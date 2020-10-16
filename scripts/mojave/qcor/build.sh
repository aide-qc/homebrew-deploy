#!/bin/bash

export AIDEQC_ACCESS_TOKEN=$1
export JFROG_API_KEY=$2

cd ../../../ 
brew tap aide-qc/deploy 
HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew install qcor --build-bottle --verbose 
HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew bottle qcor 
mv qcor--* qcor-1.0.0.mojave.bottle.tar.gz \
export bottle_sha=$(shasum -a 256 qcor-1.0.0.mojave.bottle.tar.gz | cut -d " " -f 1) 
sed -i "0,/sha256 \".*\" => :x86_64_linux/s//sha256 \"$bottle_sha\" => :x86_64_linux /" Formula/qcor.rb 
git config --global user.email "xacc-dev@eclipse.org"
git config --global user.name "qcor ci bot" 
git add Formula/qcor.rb && git commit -m "uploading updated qcor bottle sha" 
git config remote.aideqchbdeploy.url >&- || git remote add -t master aideqchbdeploy https://amccaskey:$AIDEQC_ACCESS_TOKEN@github.com/aide-qc/homebrew-deploy 
git push -f aideqchbdeploy HEAD:master 
brew install jfrog-cli 
jfrog bt c --interactive=false --user=amccaskey --key=$JFROG_API_KEY \
jfrog bt u --override --publish qcor-1.0.0.x86_64_linux.bottle.tar.gz amccaskey/qci-homebrew-bintray/qcor-linux-x86_64/1.0.0 
