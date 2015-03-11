FROM cedvan/debian:wheezy.20150311
MAINTAINER dev@cedvan.com

# Install java
RUN apt-get update -qq \
    && apt-get install -qqy \
        openjdk-7-jre

# Install simulator X-Server
RUN apt-get update -qq \
    && apt-get install -qqy \
        xvfb

# Install Firefox
RUN apt-get update -qq \
    && apt-get install -qqy \
        iceweasel

# Install Chromium and ChromeDriver
RUN apt-get update -qq \
    && apt-get install -qqy \
        chromium-browser

# Install Opera
RUN sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list' \
    && sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -' \
    && apt-get update -qq \
    && apt-get install -qqy \
        opera

# Remove useless list of packages
RUN rm -rf /var/lib/apt/lists/*

# Install Selenium
ADD http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar /opt/selenium.jar

# Install bin
ADD assets/bin /bin/selenium
RUN chmod +x /bin/selenium/*

# Install drivers
ADD assets/drivers /bin/selenium/drivers
RUN chmod +x /bin/selenium/drivers/*

EXPOSE 4444

ENTRYPOINT ["/bin/selenium/init"]
