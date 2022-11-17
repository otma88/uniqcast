appName="$1"
packageId="$2"
devId="$3"
stagingId="$4"


echo "Setting up flavors..."
cat scripts/pubspec.yaml | sed "s/\${APP_NAME}/$appName/g" | sed "s/\${ID_DEV}/$devId/g" | sed "s/\${ID_STAGING}/$stagingId/g" | sed "s/\${ID_PROD}/$packageId/g" > scripts/tmp.yaml
rm pubspec.yaml 
mv scripts/tmp.yaml pubspec.yaml

flutter pub get
if [[ "$?" != "0" ]]; then
    git reset --hard
    git clean -fd
    currentDir=`pwd`
    cd .. && mv $currentDir "q_flutter_starter"
    echo "Please upgrade to the latest flutter/dart sdk" && exit 1
fi

flutter pub run flutter_flavorizr
rm -r lib
mv scripts/lib .
mv scripts/mason.yaml .
mv scripts/.run android
mkdir -p assets/images/

cat lib/main/app_environment.dart | sed "s/APP_NAME/$appName/g" > tmp.dart
rm lib/main/app_environment.dart && mv tmp.dart lib/main/app_environment.dart

# Modify the ios flavors
flutterBase='FLUTTER_TARGET=lib/main/'
cat ios/Flutter/devDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_dev.dart%" > tmp.xcconfig
rm ios/Flutter/devDebug.xcconfig && mv tmp.xcconfig ios/Flutter/devDebug.xcconfig

cat ios/Flutter/devRelease.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_dev.dart%" > tmp.xcconfig
rm ios/Flutter/devRelease.xcconfig && mv tmp.xcconfig ios/Flutter/devRelease.xcconfig

cat ios/Flutter/stagingDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_staging.dart%" > tmp.xcconfig
rm ios/Flutter/stagingDebug.xcconfig && mv tmp.xcconfig ios/Flutter/stagingDebug.xcconfig

cat ios/Flutter/stagingDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_staging.dart%" > tmp.xcconfig
rm ios/Flutter/stagingDebug.xcconfig && mv tmp.xcconfig ios/Flutter/stagingDebug.xcconfig

cat ios/Flutter/prodDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_prod.dart%" > tmp.xcconfig
rm ios/Flutter/prodDebug.xcconfig && mv tmp.xcconfig ios/Flutter/prodDebug.xcconfig

cat ios/Flutter/prodDebug.xcconfig | sed "s%FLUTTER.*%${flutterBase}main_prod.dart%" > tmp.xcconfig
rm ios/Flutter/prodDebug.xcconfig && mv tmp.xcconfig ios/Flutter/prodDebug.xcconfig
