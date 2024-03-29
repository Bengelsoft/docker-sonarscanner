FROM java:alpine

ENV SONAR_SCANNER_VERSION 4.7.0.2747
RUN apk update && apk upgrade
RUN apk add nodejs
RUN apk add --no-cache wget git && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION} && \
    cd /usr/bin && ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner sonar-scanner && \
    apk del wget
CMD sonar-scanner
