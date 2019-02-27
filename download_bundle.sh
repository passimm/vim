if [ ! -d "bundle" ]; then
    mkdir bundle
fi
cd bundle
for i in `cat bundles.txt`
do
    git clone $i
done

