echo "Renaming project..."
projectName=`echo "$1" | tr '[:upper:]' '[:lower:]' | sed "s/ /_/g"`

currentDir=`pwd`
dirName=${currentDir: -18}
if [[ "$dirName" != "my_flutter_starter" ]]; then
  echo "Please position yourself in my_flutter_starter directory" && exit 1
fi

cat scripts/pubspec.yaml | sed "s%my_flutter_starter%${projectName}%" > tmp.yaml
rm scripts/pubspec.yaml && mv tmp.yaml scripts/pubspec.yaml

cd ..
mv my_flutter_starter "$projectName"
cd "$projectName"

flutter create .