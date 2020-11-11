#!/bin/bash

export AIDEQC_ACCESS_TOKEN=$1
export JFROG_API_KEY=$2

set +x

cd homebrew-deploy
brew tap aide-qc/deploy 

#xacc
HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew install xacc --build-bottle --verbose 
HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew bottle xacc
mv xacc--* xacc-1.0.0.mojave.bottle.tar.gz 
export bottle_sha=$(shasum -a 256 xacc-1.0.0.mojave.bottle.tar.gz | cut -d " " -f 1) 
sed -i '' "s/   sha256 ".*" => :mojave/   sha256 \"$bottle_sha\" => :mojave/g" Formula/xacc.rb

#qcor
HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew install qcor --build-bottle --verbose 
HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew bottle qcor 
mv qcor--* qcor-1.0.0.mojave.bottle.tar.gz 
export bottle_sha=$(shasum -a 256 qcor-1.0.0.mojave.bottle.tar.gz | cut -d " " -f 1) 
sed -i '' "s/   sha256 ".*" => :mojave/   sha256 \"$bottle_sha\" => :mojave/g" Formula/qcor.rb

# git push
git config --global user.email "xacc-dev@eclipse.org"
git config --global user.name "xacc ci bot" 
git add Formula/xacc.rb Formula/qcor.rb && git commit -m "uploading updated xacc/qcor mojave bottle sha" 
git config remote.aideqchbdeploy.url >&- || git remote add -t master aideqchbdeploy https://amccaskey:$AIDEQC_ACCESS_TOKEN@github.com/aide-qc/homebrew-deploy 
git push -f aideqchbdeploy HEAD:master 

# upload
brew install jfrog-cli 
jfrog bt c --interactive=false --user=amccaskey --key=$JFROG_API_KEY 
jfrog bt u --override --publish xacc-1.0.0.mojave.bottle.tar.gz amccaskey/qci-homebrew-bintray/xacc-mojave/1.0.0 
jfrog bt u --override --publish qcor-1.0.0.mojave.bottle.tar.gz amccaskey/qci-homebrew-bintray/qcor-mojave/1.0.0 

# clean up
brew uninstall xacc qcor
brew untap aide-qc/deploy
cd ..
rm -rf homebrew-deploy
