![Docker Pulls](https://img.shields.io/docker/pulls/bengelsoft/sonarscanner)

# Docker-Sonar Scanner CLI

Executing the [sonar scanner-CLI](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/) using a container. (with support for plugins that need node.js)

Use a container to run the sonar-scanner-CLI. This sonar-scanner supports plugins that need node.js for analyzing such as:

* [Typescript plugin](https://docs.sonarqube.org/latest/analysis/languages/typescript/)
* [CSS plugin](https://docs.sonarqube.org/latest/analysis/languages/css/)
* [Javascript plugin](https://docs.sonarqube.org/latest/analysis/languages/javascript/)

## How to use this image

### Prepare your project
https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/
The SonarScanner needs properties to know what to analyze. The scanner search for an
`sonar-project.properties` in de root of the project.

See this example or take a look at the source from the [example project](https://github.com/SonarSource/sonar-scanning-examples/tree/master/sonarqube-scanner) for a `sonar-project.properties` example.

```properties
# example: sonar-project.properties

# must be unique in a given SonarQube instance
sonar.host.url=http://sonarqube
sonar.login=xxxxxxxxxxxxxxxxxx
sonar.projectKey=my:project

# --- optional properties ---

# defaults to project key
sonar.projectName=My project
sonar.projectVersion=1.0

# Path is relative to the sonar-project.properties file. Defaults to .
sonar.sources=.

# Encoding of the source code. Default is default system encoding
sonar.sourceEncoding=UTF-8
```

### Run the sonar-scanner

```bash
docker run -t --rm -v /source:/usr/src/analyse -w //usr/src/analyse
bengelsoft/sonarscanner
```

volume: mounting the analyzing source code to the container.
workdir: is the root of the analyzing project and is the directory where the `sonar-project.properties` is saved

## More Information

[SonarQube documentation](https://docs.sonarqube.org/latest/)

## Contributing

Feel free to make a pull request with improvements :)