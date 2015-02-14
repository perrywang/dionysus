Environment
-----------

- use Derby database in ```dev```,```test``` profile
- use SAE MySQL in ```prod``` profile

setup eclipse environment

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

