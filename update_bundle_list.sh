rm ./bundles.txt
cd bundle
for i in `ls`
do
    cd $i && git remote -v|grep fetch|awk '{print $2}' >> ../../bundles.txt && cd -
done
cd ..
