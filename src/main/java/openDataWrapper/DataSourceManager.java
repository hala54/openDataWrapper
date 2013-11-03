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
	public final static StringBuilder PATH_TO_LINKED_DATASETS = new StringBuilder("src/main/resources/output/linkedData/ttl");
	
	
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
	 * Method showing available linked datasets and asking user which dataset he wants to load
	 * @return name of requested dataset
	 */
	public static String chooseAvailableLinkedDatasets()
	{
		String files;
		File folder = new File(PATH_TO_LINKED_DATASETS.toString());
		File[] listOfFiles = folder.listFiles();
		Map<Integer, String> availableLinkedDatasources = new TreeMap<Integer, String>();
		try {
			for (int i = 0; i < listOfFiles.length; i++) {
				if (listOfFiles[i].isFile()) {
					files = listOfFiles[i].getName();
					if (files.endsWith(".n3") || files.endsWith(".N3")) {
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
		
		Scanner in = new Scanner(System.in);
		int result = in.nextInt();
		return availableLinkedDatasources.get(result);
	}
	
}
