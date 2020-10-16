#!/bin/bash

export AIDEQC_ACCESS_TOKEN=$1
export JFROG_API_KEY=$2

cd ../../../ 
brew tap aide-qc/deploy 
HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew install qcor --build-bottle --verbose 
HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew bottle qcor 
mv qcor--* qcor-1.0.0.catalina.bottle.tar.gz 
export bottle_sha=$(shasum -a 256 qcor-1.0.0.catalina.bottle.tar.gz | cut -d " " -f 1) 
sed -i '' "s/   sha256 ".*" => :catalina/   sha256 \"$bottle_sha\" => :catalina/g" Formula/qcor.rb
git config --global user.email "xacc-dev@eclipse.org"
git config --global user.name "qcor ci bot" 
git add Formula/qcor.rb && git commit -m "uploading updated qcor catalina bottle sha" 
git config remote.aideqchbdeploy.url >&- || git remote add -t master aideqchbdeploy https://amccaskey:$AIDEQC_ACCESS_TOKEN@github.com/aide-qc/homebrew-deploy 
git push -f aideqchbdeploy HEAD:master 
brew install jfrog-cli 
jfrog bt c --interactive=false --user=amccaskey --key=$JFROG_API_KEY 
jfrog bt u --override --publish qcor-1.0.0.catalina.bottle.tar.gz amccaskey/qci-homebrew-bintray/qcor-catalina/1.0.0 
