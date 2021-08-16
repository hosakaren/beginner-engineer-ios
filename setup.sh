rm -r ./FxiOS.xcworkspace
rm -r ./FxFw/FxFw.xcodeproj
rm -r ./Podfile.lock
rm -rf ./Pods/

cd ./FxFw/
xcodegen
cd ../GaitameOnline/
xcodegen
cd ../InetSec/
xcodegen

cd ../
pod install
