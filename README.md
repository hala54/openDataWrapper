openDataWrapper
===============

Generic wrapper converting data sources from data.paysdelaloire.fr into RDF (N3 and RDF-XML). It uses API call. Data sources are XML files. Also uses Apache Maven

Quick Start
-----------

1) Requirement

	You will need :
	- JAVA 7
	- The Java environment variable user.home must be set (should be /home/*computersname* in most cases)
	- You have to create a directory in your home folder, named .openDataWrapper. Create a file called import.odw into this folder.
	- You also have to download and set up Apache Maven in order to update the project's dependencies
	- If you are behind proxy, read the documentation

2) Start

	Run command mvn compile to compile the project. If you are using Eclipse, run mvn eclipse:eclipse to make eclipse maven-friendly, then run mvn compile
	Run Principal.java as a java application
	Follow the instruction

	WARNING : If compilation errors occurs, run mvn install:install-file -DgroupId=de.fuberlin.wiwiss.silk -DartifactId=silk -Dversion=2.5 -Dpackaging=jar -Dfile=lib/silk/silk.jar

	
3) Data (For non-XML-friendly users)
	
	You can add data from data.paysdelaloire.fr API. 
	Write into the import.odw file the name of your new data, =, and 4 informations separated by ';' :
		mydata = api_url;api_url_description;title;publisher
	Select add new sources in the main menu.

	If you are more a more XML friendly, you can add new dataSources directly writing dataSources.xml (more documentation in document.tex)

4) Convert data

	Select the convert data menu and check the result. The converted files should be in output/ folder.
	
5) Exporting your data

	Select the Sparql management menu and select the import option. Your dataset will be stored in .openDataWrapper folder.
	Run fuseki from the menu if you want to expose your data

6) Running SPARQL requests on your DataSets

	Write requests on src/main/resources/queries (1 request per file). Run Principale.java, then follow the instructions through running queries. Before running a query, you shall load a dataset.

7) Linking datasets

	Run Principale.java, then follow the instructions through linking datasets. Select datasets to link, separating datasets numbers by a ';'.
	Result into src/main/resources/output/linkedData folder

8) Making RDFS inferences

	Write you dataset schema into src/main/resources/input/rdfsSchema.
	Then run Principale.java and follow the instructions through making RDFS inferences over selected (linked)datasets in relationship with the written schema.
			
9) Making OWL inferences

	Write you dataset schema into src/main/resources/input/owlSchema.
	Then run Principale.java and follow the instructions through making OWL inferences over selected (linked)datasets in relationship with the written schema.
	