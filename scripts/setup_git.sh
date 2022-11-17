rm -rf .git

git init
git add .
git commit -m "initial commit"
git remote add origin "$1"

git branch development