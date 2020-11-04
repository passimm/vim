"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const child_process_1 = require("child_process");
const fs_1 = require("fs");
const path = __importStar(require("path"));
if (process.argv.length <= 3) {
    console.error("Invalid Arguments");
    console.error("Usage: node index.js [--no-watch] <path/to/folder> <path/to/compile_commands.json> <block_list>*");
    process.exit(1);
}
function Run(cmd, args, cwd, env = process.env) {
    console.log(`${cmd} ${args.join(" ")}`);
    return new Promise((resolve, reject) => {
        let proc = child_process_1.spawn(cmd, args, {
            cwd,
            env,
        });
        let stdout = "";
        let stderr = "";
        proc.on("exit", (code) => {
            resolve({
                code: code || 0,
                stdout,
                stderr,
            });
        });
        proc.stdout.on("data", (chunk) => {
            stdout += chunk.toString();
        });
        proc.stderr.on("data", (chunk) => {
            stderr += chunk.toString();
        });
    });
}
function Walk(root, callback) {
    return __awaiter(this, void 0, void 0, function* () {
        let entities = yield fs_1.promises.readdir(root);
        for (let ent of entities) {
            let fullpath = path.join(root, ent);
            callback(fullpath);
            if ((yield fs_1.promises.stat(fullpath)).isDirectory()) {
                yield Walk(fullpath, callback);
            }
        }
    });
}
function PreprocessJsonContent(content) {
    const PATTERN = /({"directory": "[^"]+", "command": ")(.*)(", "file": "[^"]+"}.*$)/;
    return content.split('\n').map((line) => {
        let match = line.match(PATTERN);
        if (!match) {
            return line;
        }
        let command = match[2];
        command = command.replace(/([^\\])"/g, '$1\\"');
        return match[1] + command + match[3];
    }).join('\n');
}
class VcxprojQueue {
    constructor(callback, concurrency = 8) {
        this.callback = callback;
        this.concurrency = concurrency;
        this.ongoing = [];
        this.pending = [];
        this.resolves = [];
    }
    Push(vcxproj) {
        return __awaiter(this, void 0, void 0, function* () {
            if (this.ongoing.indexOf(vcxproj) != -1) {
                return;
            }
            if (this.pending.find((v) => v.vcxproj == vcxproj)) {
                return;
            }
            return new Promise((resolve, reject) => {
                console.log("Enqueue", vcxproj, "ongoing", this.ongoing.length, "pending", this.pending.length);
                this.pending.push({ vcxproj, resolve, reject });
                this.notify();
            }).then((_) => { }).finally(() => {
                this.ongoing = this.ongoing.filter((o) => o != vcxproj);
                this.notify();
            });
        });
    }
    Wait() {
        if (this.ongoing.length == 0) {
            return Promise.resolve();
        }
        return new Promise((resolve, reject) => {
            console.log("start waiting");
            this.resolves.push(resolve);
        });
    }
    notify() {
        if (this.ongoing.length < this.concurrency && this.pending.length) {
            let first = this.pending.shift();
            if (!first) {
                return;
            }
            this.ongoing.push(first.vcxproj);
            this.callback(first.vcxproj, first.resolve, first.reject);
        }
        else if (this.ongoing.length == 0) {
            console.log("notify waiting");
            let resolves = this.resolves;
            this.resolves = [];
            for (let r of resolves) {
                r();
            }
        }
        console.log("Ongoing", this.ongoing.length, "pending", this.pending.length);
    }
}
class CompileDBGen {
    constructor(target) {
        this.target = target;
        this.cached = new Map();
    }
    UpdateCompileDB(vcxproj, compile_db) {
        return __awaiter(this, void 0, void 0, function* () {
            let content = yield fs_1.promises.readFile(compile_db, { encoding: "utf-8" });
            let entities = JSON.parse(content);
            this.cached.set(vcxproj, {
                path: compile_db,
                entities,
            });
            console.log("Get", entities.length, "entities from", vcxproj);
        });
    }
    Gen() {
        return __awaiter(this, void 0, void 0, function* () {
            let combined = [...this.cached.values()].map((v) => v.entities).reduce((p, c) => p.concat(c), []);
            yield fs_1.promises.writeFile(this.target, JSON.stringify(combined));
        });
    }
}
function GenerateCompileDB(vcxproj) {
    return __awaiter(this, void 0, void 0, function* () {
        console.log("Generating compile db for", vcxproj);
        let compile_db_path = path.join(path.dirname(vcxproj), "obj/amd64/compile_commands.json");
        try {
            let db_stat = yield fs_1.promises.stat(compile_db_path);
            let proj_stat = yield fs_1.promises.stat(vcxproj);
            if (db_stat.mtime >= proj_stat.mtime) {
                console.log("CompileDB is newer", vcxproj);
                return compile_db_path;
            }
        }
        catch (e) {
            // do nothing
        }
        let dirname = path.dirname(vcxproj);
        let result = yield Run("cmd.exe", ["/c", "msbuild.cmd", "/preprocess", vcxproj], dirname);
        if (result.code != 0) {
            throw result.code;
        }
        console.log("Done processing", vcxproj);
        let env = JSON.parse(JSON.stringify(process.env));
        if (env["FORCE_CLANG_TIDY"]) {
            delete env["FORCE_CLANG_TIDY"];
        }
        if (result.stdout.indexOf('Target Name="GenerateCompileDB"') == -1) {
            console.log("Patching", vcxproj);
            let tempproj = path.join(dirname, "__temp_proj_for_compile_db.vcxproj");
            let original = yield fs_1.promises.readFile(vcxproj, { encoding: "utf-8" });
            original = original.replace("</Project>", '<Import Project="$(INETROOT)\\.config\\.targets\\CompileDB.targets" /></Project>');
            yield fs_1.promises.writeFile(tempproj, original);
            console.log("Executing ", vcxproj);
            yield Run("cmd.exe", ["/c", "msbuild.cmd", "/target:GenerateCompileDB", tempproj], dirname, env);
            yield fs_1.promises.unlink(tempproj);
        }
        else {
            console.log("Executing ", vcxproj);
            yield Run("cmd.exe", ["/c", "msbuild.cmd", "/target:GenerateCompileDB", vcxproj], dirname, env);
        }
        console.log("Done ", vcxproj);
        let content = yield fs_1.promises.readFile(compile_db_path, { encoding: "utf-8" });
        let preprocessed_content = PreprocessJsonContent(content);
        yield fs_1.promises.writeFile(compile_db_path, preprocessed_content);
        return compile_db_path;
    });
}
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        let nowatch = (process.argv[2] == "--no-watch");
        let root = path.normalize(path.resolve(process.argv[nowatch ? 3 : 2]));
        console.log("starting compiledbd", root);
        let output = path.normalize(path.resolve(process.argv[nowatch ? 4 : 3]));
        if (path.basename(output) != 'compile_commands.json') {
            output = path.join(output, "compile_commands.json");
        }
        console.log("output:", output);
        try {
            yield fs_1.promises.stat(path.dirname(output));
        }
        catch (e) {
            yield fs_1.promises.mkdir(path.dirname(output), { recursive: true });
        }
        let block_list = [];
        for (let i = nowatch ? 5 : 4; i < process.argv.length; ++i) {
            block_list.push(process.argv[i]);
        }
        let gen = new CompileDBGen(output);
        let queue = new VcxprojQueue((vcxproj, resolve, reject) => {
            GenerateCompileDB(vcxproj)
                .then((compile_db_path) => gen.UpdateCompileDB(vcxproj, compile_db_path).then(() => {
                resolve(compile_db_path);
            }))
                .catch(reject);
        });
        yield Walk(root, (file) => {
            if (path.extname(file) == ".vcxproj") {
                for (let b of block_list) {
                    if (file.indexOf(b) != -1) {
                        console.log(file, "block by", b);
                        return;
                    }
                }
                file = path.normalize(path.resolve(file));
                queue.Push(file).catch((e) => {
                    console.error("unable to update compile db for", file, ":", e);
                });
            }
        });
        yield queue.Wait();
        yield gen.Gen();
        if (!nowatch) {
            console.log("Watching");
            fs_1.watch(root, { recursive: true }, (event, file) => {
                if (path.extname(file) == ".vcxproj") {
                    file = path.normalize(path.resolve(file));
                    queue
                        .Push(file)
                        .then(() => gen.Gen())
                        .catch((e) => {
                        console.error("unable to update compile db for", file, ":", e);
                    });
                }
            });
        }
    });
}
main().then(() => {
    console.log("Done");
}).catch((e) => {
    console.log("Error:", e);
});
