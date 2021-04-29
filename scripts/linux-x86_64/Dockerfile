from homebrew/ubuntu20.04

ARG AIDEQC_ACCESS_TOKEN
ARG JFROG_API_KEY

RUN apt-get update && apt-get install -y liblapack-dev dirmngr \ 
    && apt-key --keyring /usr/share/keyrings/githubcli-archive-keyring.gpg adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/github-cli2.list \
    && apt-get update && apt-get -y install gh \
    && echo $AIDEQC_ACCESS_TOKEN | tee token.txt \
    && gh auth login --with-token < token.txt 

RUN brew tap aide-qc/deploy && HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew install xacc --build-bottle --verbose \
    && HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew bottle xacc \
    && mv xacc--* xacc-1.0.0.x86_64_linux.bottle.tar.gz \ 
    && HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew install qcor --build-bottle --verbose \
    && HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=false brew bottle qcor \
    && mv qcor--* qcor-1.0.0.x86_64_linux.bottle.tar.gz 
RUN gh release upload --repo aide-qc/aide-qc 0.0.1 xacc-1.0.0.x86_64_linux.bottle.tar.gz --clobber \
    && gh release upload --repo aide-qc/aide-qc 0.0.1 qcor-1.0.0.x86_64_linux.bottle.tar.gz --clobber
