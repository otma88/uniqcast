appName="$1"
slug=$(echo "$appName" | tr " " - | tr '[:upper:]' '[:lower:]')

sentryBaseUrl="https://sentry.q-tests.com/api/0"
sentryAuthKey="7ac48d332d204e68b7147cd637d1a218046ea6b1ea8f41b8b72bfc581f34e293"
orgSlug="q-sentry"
teamSlug="mobile"

echo "Creating sentry project..."

createProjectResponseAndStatusCode=$(curl --silent -w ";%{http_code}" -X POST --data "{
    \"name\": \"$appName\", \
    \"platform\": \"flutter\", \
    \"slug\": \"$slug\"
  }" \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $sentryAuthKey" \
  $sentryBaseUrl/teams/$orgSlug/$teamSlug/projects/)
statusCode=$(echo "$createProjectResponseAndStatusCode" | cut -d ";" -f 2)
response=$(echo "$createProjectResponseAndStatusCode" | cut -d ";" -f 1)

if [ "$statusCode" -eq 201 ] || [ "$statusCode" -eq 409 ]; then
  getDsnResponseAndStatusCode=$(curl --silent -w ";%{http_code}" -X GET -H 'Content-Type: application/json' \
    -H "Authorization: Bearer $sentryAuthKey" \
    $sentryBaseUrl/projects/$orgSlug/"$slug"/keys/)
  response=$(echo "$getDsnResponseAndStatusCode" | cut -d ";" -f 1)
  statusCode=$(echo "$getDsnResponseAndStatusCode" | cut -d ";" -f 2)
  echo "Successfully created Sentry project!"

  if [ "$statusCode" -eq 200 ]; then
    sentryDsn=$(echo "$response" | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['dsn']['public'])")
    cat lib/main.dart | sed s#DSN#"$sentryDsn"#g > tmp && rm lib/main.dart && mv tmp lib/main.dart
    echo "Successfully fetched and set Sentry DSN!"
  else
    echo "Failed to get Sentry DSN with statusCode: $statusCode and response: $response"
  fi
else
  echo "Failed to create Sentry project with statusCode: $statusCode and response: $response"
fi