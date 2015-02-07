Environment
-----------

- use Derby database in ```dev```,```test``` profile
- use SAE MySQL in ```prod``` profile

setup eclipse environment

	$ mvn eclipse:eclipse -DdownloadSources=true
	
run jetty (default start in ```dev``` profile)

	$ mvn jetty:run
	
create war

	$ mvn package
	
Note
----
no need to use ```persistence.xml``` when using spring annotation.
[Ignore 'No persistence.xml file found in project'](http://stackoverflow.com/questions/20287026/how-to-tell-eclipse-to-ignore-no-persistence-xml-file-found-in-project),

