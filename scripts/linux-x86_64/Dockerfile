from homebrew/ubuntu20.04

ARG AIDEQC_ACCESS_TOKEN
ARG JFROG_API_KEY

run brew tap aide-qc/deploy && apt-get update && apt-get install -y liblapack-dev \ 
    # xacc
    && HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew install xacc --build-bottle --verbose \
    && HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew bottle xacc \
    && mv xacc--* xacc-1.0.0.x86_64_linux.bottle.tar.gz \ 
    && export bottle_sha=$(sha256sum xacc-1.0.0.x86_64_linux.bottle.tar.gz | cut -d " " -f 1) \
    && git clone https://github.com/aide-qc/homebrew-deploy && cd homebrew-deploy \
    && sed -i "0,/sha256 \".*\" => :x86_64_linux/s//sha256 \"$bottle_sha\" => :x86_64_linux /" Formula/xacc.rb \
    #qcor
    && cd ../ && HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew install qcor --build-bottle --verbose \
    && HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew bottle qcor \
    && mv qcor--* qcor-1.0.0.x86_64_linux.bottle.tar.gz \ 
    && export bottle_sha=$(sha256sum qcor-1.0.0.x86_64_linux.bottle.tar.gz | cut -d " " -f 1) \
    && cd homebrew-deploy \
    && sed -i "0,/sha256 \".*\" => :x86_64_linux/s//sha256 \"$bottle_sha\" => :x86_64_linux /" Formula/qcor.rb \
    # git push
    && git config --global user.email "mccaskeyaj@ornl.gov" \
    && git config --global user.name "Alex McCaskey" \
    && git add Formula/qcor.rb Formula/xacc.rb && git commit -m "uploading updated bottle sha" \
    && git config remote.aideqchbdeploy.url >&- || git remote add -t master aideqchbdeploy https://amccaskey:$AIDEQC_ACCESS_TOKEN@github.com/aide-qc/homebrew-deploy \
    && git push -f aideqchbdeploy HEAD:master \
    # upload bottles
    && cd .. && brew install jfrog-cli \
    && jfrog bt c --interactive=false --user=amccaskey --key=$JFROG_API_KEY \
    && jfrog bt u --override --publish qcor-1.0.0.x86_64_linux.bottle.tar.gz amccaskey/qci-homebrew-bintray/qcor-linux-x86_64/1.0.0 \
    && jfrog bt u --override --publish xacc-1.0.0.x86_64_linux.bottle.tar.gz amccaskey/qci-homebrew-bintray/xacc-linux-x86_64/1.0.0 
