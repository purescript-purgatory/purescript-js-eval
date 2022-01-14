#!/usr/bin/env sh
hash=`git ls-remote https://github.com/rajatsharma/purescript-js-eval.git | grep refs/heads/master | cut -f 1`
deps=`dhall-to-json <<< "let contents = ./node_modules/purescript-js-eval/spago.dhall in contents.dependencies"`
package='with js-eval = {
  dependencies = dependencies-array,
  repo = "https://github.com/rajatsharma/purescript-js-eval.git",
  version = "version-hash"
}'
base=`basename "$PWD"`

if [ "$base" != "purescript-js-eval" ]
then
  echo $package | perl -pE "s/dependencies-array/$deps/;s/version-hash/$hash/;" >> $PWD/packages.dhall
  spago install js-eval
fi
