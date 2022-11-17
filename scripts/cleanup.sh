sed -n '/^flavorizr/q;p' pubspec.yaml > tmp.yaml
mv tmp.yaml pubspec.yaml