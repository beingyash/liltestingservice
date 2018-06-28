FROM r.cfcr.io/saggiyogesh/beingyash/liltestingbase:master

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
dpkg --unpack google-chrome-stable_current_amd64.deb && \
apt-get install -f -y && \
apt-get clean && \
rm google-chrome-stable_current_amd64.deb && \
apt-get install -y pkg-mozilla-archive-keyring

RUN git clone https://beingyash:zBcbFmFTUeV4EDH3Tmg8@bitbucket.org/dostmohit/revisee2e.git 

WORKDIR /revisee2e

ENTRYPOINT [ "protractor", "conf.js", "--grep", "@$TESTING_TYPE" --suite "$SUITE_NAME" ]