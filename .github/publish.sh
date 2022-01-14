VERSION="${npm_package_version:-$(jq -r .version package.json)}"
echo $VERSION
for package in $( ls packages ); do
  yarn --cwd packages/$package version --new-version $VERSION --no-git-tag-version
done
git commit -a -m "v$VERSION"
git push
git tag "v$VERSION"
git push origin "v$VERSION"
git tag -d "v$VERSION"
