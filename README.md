Prerequisites
-------------
- JDK 1.6+ [http://www.oracle.com/technetwork/java/javase/overview/index.html](http://www.oracle.com/technetwork/java/javase/overview/index.html)
- Maven 3.2+ [http://maven.apache.org](http://maven.apache.org)
- Eclipse [http://eclipse.org](http://eclipse.org)
- NodeJs [http://nodejs.org](http://nodejs.org)
	- Yeoman [http://yeoman.io/](http://yeoman.io/) with ```webapp``` generator
	- Grunt [http://gruntjs.com/](http://gruntjs.com/)


Environment
-----------

- use Derby database in ```dev```,```test``` profile
- use SAE MySQL in ```prod``` profile

setup development environment

	$ mvn install
	$ mvn eclipse:eclipse -DdownloadSources=true
	
run restful api server

	$ cd dionysus-rest
	$ mvn spring-boot:run
	
invoke restful api

	$ curl http://localhost:8080/categories
	$ curl -X  POST -H "Content-type:application/json" -d '{"name":"test"}' http://localhost:8080/categories
	$ curl http://localhost:8080/categories/1

or start full application

	$ cd dionysus-webapp
	$ mvn spring-boot:run
	$ browser http://localhost:8080/api/v1/categories
	
create war

	$ mvn package
	
Note
----
no need to use ```persistence.xml``` when using spring annotation.
[Ignore 'No persistence.xml file found in project'](http://stackoverflow.com/questions/20287026/how-to-tell-eclipse-to-ignore-no-persistence-xml-file-found-in-project),

