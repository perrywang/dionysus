boilerplate to run in sae

setup eclipse project

	$ mvn eclipse:eclipse -DdownloadSources=true
	
run jetty (local mysql is required)

	$ mysql -uroot
	> create database dionysus;

	$ mvn jetty:run

access articles

	$ curl http://localhost:8080/articles