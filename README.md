openDataWrapper
===============

Generic wrapper converting data sources from data.paysdelaloire.fr into RDF (N3 and RDF-XML). 
It uses API call. Data sources are XML files. Also uses Apache Maven

Quick Start
-----------

1) Requirement :

	- JAVA 1.7

	-  Maven : 2.2

        -  Eclipse  with maven and git plugins installed 


2) Start

 - git clone https://github.com/hala54/openDataWrapper
 - cd openDataWrapper/
 - mvn eclipse:eclipse 
 - mvn install:install-file -DgroupId=de.fuberlin.wiwiss.silk -DartifactId=silk -Dversion=2.5 -Dpackaging=jar -Dfile=lib/silk/silk.jar 
(add to repo maven local lib silk  lib/silk/silk.jar)   (More about silk in http://wifo5-03.informatik.uni-mannheim.de/bizer/silk/)
 - Open  Eclipse, Import the project (import -> General -> existing projects into workspace)
 - run  Principale.java  from Eclipse 
	
3) Data (For non-XML-friendly users)

	Create a file called import.odw into openDataWrapper folder.
	You can add data from data.paysdelaloire.fr API. 
	Write into the import.odw file the name of your new data, =, and 4 informations separated by ';' :
		mydata = api_url;api_url_description;title;publisher
	Select add new sources in the main menu.

	If you are more a more XML friendly, you can add new dataSources directly writing dataSources.xml (more documentation in document.pdf)
	
	Warning : your data (if xml) must have this form :
	  <document> //An root element (name doesn't matter)
	    <data>
	      <element> ... </element>
	      <element> ... </element>
	      ...
	    </data>
	  </document>
	  
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
	
