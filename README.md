Java project for SAE

- use Derby database in ```dev```,```test``` profile
- use SAE MySQL in ```prod``` profile

setup eclipse environment

	$ mvn eclipse:eclipse -DdownloadSources=true
	
run jetty (default start in ```dev``` profile)

	$ mvn jetty:run
	
create war

	$ mvn package
