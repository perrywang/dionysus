[![Build Status](https://travis-ci.org/luj1985/dionysus.svg?branch=master)](https://travis-ci.org/luj1985/dionysus)

Prerequisites
-------------
- JDK 1.7+ [http://www.oracle.com/technetwork/java/javase/overview/index.html](http://www.oracle.com/technetwork/java/javase/overview/index.html)
- Maven 3.0+ [http://maven.apache.org](http://maven.apache.org)
- Eclipse [http://eclipse.org](http://eclipse.org)
- NodeJs [http://nodejs.org](http://nodejs.org)
	- Yeoman [http://yeoman.io/](http://yeoman.io/) with ```webapp``` generator
	- Grunt [http://gruntjs.com/](http://gruntjs.com/)
	- Bower [http://bower.io/](http://bower.io/)
- LiveReload [http://livereload.com/](http://livereload.com/)


Environment
-----------

- use H2 database in ```dev```,```test``` profile
- use BAE MySQL in ```prod``` profile

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


Client side development
-----------------------
startup application server

	$ cd dionysus-webapp
	$ mvn spring-boot:run

launch client side application

	$ cd dionysus-client/yo
	$ grunt serve
	
Note
----
no need to use ```persistence.xml``` when using spring annotation.
[Ignore 'No persistence.xml file found in project'](http://stackoverflow.com/questions/20287026/how-to-tell-eclipse-to-ignore-no-persistence-xml-file-found-in-project),

