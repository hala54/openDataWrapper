package openDataWrapper;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeMap;

import org.jdom2.JDOMException;

import openDataWrapper.LoadRessources;

/**
 * Manages available datasources
 * @author alexis.linard
 *
 */
public class DataSourceManager {

	/**
	 * Path to linked datasets in n3 format
	 */
	public final static StringBuilder PATH_TO_LINKED_DATASETS_TTL = new StringBuilder("src/main/resources/output/linkedData/ttl");
	
	/**
	 * Path to linked datasets in rdf format
	 */
	public final static StringBuilder PATH_TO_LINKED_DATASETS_RDF = new StringBuilder("src/main/resources/output/linkedData/rdf-xml");
	
	/**
	 * Path to datasets in n3 format
	 */
	public final static StringBuilder PATH_TO_DATASETS_TTL = new StringBuilder("src/main/resources/output/ttl");
	
	/**
	 * Path to datasets in RDF format
	 */
	public final static StringBuilder PATH_TO_DATASETS_RDF = new StringBuilder("src/main/resources/output/rdf-xml");
	
	/**
	 * Path to RDFS schemas
	 */
	public final static StringBuilder PATH_TO_RDFS_SCHEMAS = new StringBuilder("src/main/resources/input/rdfsSchema");
	
	/**
	 * Path to OWL schemas
	 */
	public final static StringBuilder PATH_TO_OWL_SCHEMAS = new StringBuilder("src/main/resources/input/owlSchema");
	
	/**
	 * Méthode affichant les datasources supportés par l'application. This
	 * function display the data sources list, with the id number. Useful when
	 * you want to make a process on only one data source.
	 */
	public static void printAvailableDataSources() {
		Map<Integer, DataSource> dataSources = getAvailableDataSources();
		Set<Integer> nomData = dataSources.keySet();
		Iterator<Integer> it = nomData.iterator();
		System.out.println("Liste des dataset:");
		while (it.hasNext()) {
			Integer courant = it.next();
			System.out.println("[" + courant + "] "
					+ dataSources.get(courant).getNom());
		}
	}

	/**
	 * This function displays the data sources list
	 * @return The available datasources
	 */
	public static Map<Integer, DataSource> getAvailableDataSources() {
		LoadRessources lr;
		try {
			lr = new LoadRessources();
		} catch (JDOMException e1) {
			System.err
					.println("The configuration file dataSource.xml is corrupted. Please check that this file is a valid XML file!");
			return null;
		} catch (IOException e1) {
			System.err
					.println("Unable to open the configuration file dataSources.xml");
			return null;
		}
		Map<Integer, DataSource> dataSources = lr.extractData();
		return dataSources;
	}
	
	
	/**
	 * Method showing available linked datasets in N3 format and asking user which dataset he wants to load
	 * @return name of requested dataset
	 */
	public static String chooseAvailableLinkedDatasetsN3()
	{
		File folder = new File(PATH_TO_LINKED_DATASETS_TTL.toString());
		File[] listOfFiles = folder.listFiles();
		Map<Integer, String> availableLinkedDatasources = new TreeMap<Integer, String>();
		String extensionN3Lower = ".n3";
		String extensionN3Upper = ".N3";
		
		return chooseFiles(listOfFiles, availableLinkedDatasources,
				extensionN3Lower, extensionN3Upper);
	}
	
	
	/**
	 * Method showing available linked datasets in RDF format and asking user which dataset he wants to load
	 * @return name of requested dataset
	 */
	public static String chooseAvailableLinkedDatasetsRDF()
	{
		File folder = new File(PATH_TO_LINKED_DATASETS_RDF.toString());
		File[] listOfFiles = folder.listFiles();
		Map<Integer, String> availableLinkedDatasources = new TreeMap<Integer, String>();
		String extensionRDFLower = ".rdf";
		String extensionRDFUpper = ".RDF";
		return chooseFiles(listOfFiles, availableLinkedDatasources,
				extensionRDFLower, extensionRDFUpper);
	}
	
	
	/**
	 * Method showing available datasets in RDF format and asking user which dataset he wants to load
	 * @return name of requested dataset
	 */
	public static String chooseAvailableDatasetsRDF()
	{
		File folder = new File(PATH_TO_DATASETS_RDF.toString());
		File[] listOfFiles = folder.listFiles();
		Map<Integer, String> availableLinkedDatasources = new TreeMap<Integer, String>();
		String extensionRDFLower = ".rdf";
		String extensionRDFUpper = ".RDF";
		
		
		return chooseFiles(listOfFiles, availableLinkedDatasources,
				extensionRDFLower, extensionRDFUpper);
	}
	
	/**
	 * Method showing available RDFS schemas and asking user which one he wants to load
	 * @return name of requested dataset
	 */
	public static String chooseAvailableRDFSSchemas()
	{
		File folder = new File(PATH_TO_RDFS_SCHEMAS.toString());
		File[] listOfFiles = folder.listFiles();
		Map<Integer, String> availableLinkedDatasources = new TreeMap<Integer, String>();
		String extensionRDFLower = ".rdf";
		String extensionRDFUpper = ".RDF";
		
		
		return chooseFiles(listOfFiles, availableLinkedDatasources,
				extensionRDFLower, extensionRDFUpper);
	}
	
	/**
	 * Method showing available OWL schemas and asking user which one he wants to load
	 * @return name of requested dataset
	 */
	public static String chooseAvailableOWLSchemas()
	{
		File folder = new File(PATH_TO_OWL_SCHEMAS.toString());
		File[] listOfFiles = folder.listFiles();
		Map<Integer, String> availableLinkedDatasources = new TreeMap<Integer, String>();
		String extensionOWLLower = ".owl";
		String extensionOWLUpper = ".OWL";
		
		
		return chooseFiles(listOfFiles, availableLinkedDatasources,
				extensionOWLLower, extensionOWLUpper);
	}


	/**
	 * Extracted method : available linked datasets and asking user which dataset he wants to load
	 * @param listOfFiles list of files into given folder
	 * @param availableLinkedDatasources Map
	 * @param extensionLower the good extension for requested files
	 * @param extensionUpper the good extension for requested files
	 * @return
	 */
	private static String chooseFiles(File[] listOfFiles,
			Map<Integer, String> availableLinkedDatasources,
			String extensionLower, String extensionUpper) {
		String files;
		try {
			for (int i = 0; i < listOfFiles.length; i++) {
				if (listOfFiles[i].isFile()) {
					files = listOfFiles[i].getName();
					if (files.endsWith(extensionUpper) || files.endsWith(extensionUpper)) {
						availableLinkedDatasources.put(i, files);
					}
				}
			}
		} catch (NullPointerException npe) {
			System.err.println("No linked data available");
			return null;
		}
		
		System.out.println("Which linked dataset do you want to load?");
		int i=0;
		for(String s:availableLinkedDatasources.values()){
			System.out.println("["+ i +"] "+s);
			i++;
		}
		
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		int result = in.nextInt();
		return availableLinkedDatasources.get(result);
	}
}
