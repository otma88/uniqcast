# Get the named parameters
while [ $# -gt 0 ]; do
   if [[ $1 == *"--"*  ]]; then
        param="${1/--/}"
        declare $param="$2"
   fi
  shift
done

# Check if arguments are provided
if [ -z "$starterLocation" ]; then
  echo "Please enter the q_flutter_starter location" && exit 1
fi
if [ -z "$appName" ]; then
  echo "Please provide the app name using the -n option" && exit 1
fi
if [ -z "$package" ]; then
  echo "Please provide the project prod package name/bundle id using the --package option" && exit 1
fi

packageDev="$package.dev"
packageStaging="$package.staging"
cd $starterLocation

bash scripts/rename_project.sh "$appName" && bash scripts/setup_flavors.sh "$appName" "$package" "$packageDev" "$packageStaging"
if [[ "$?" == "0" ]]; then
  if [ -n "${sentryProject+x}" ]; then bash scripts/create_sentry_project.sh "$appName"; fi
  bash scripts/cleanup.sh
  flutter pub upgrade --major-versions
  cd ios && pod repo update && cd ..
  # bash setup_git.sh "$remoteSSH"
  rm -r scripts
  rm test/widget_test.dart
  mason get
  echo "Don't forget to setup the signing for ios"
  echo "All done :)"
fi


