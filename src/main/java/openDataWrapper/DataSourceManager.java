package main.java.openDataWrapper;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.jdom2.JDOMException;

/**
 * Manages available datasources
 * @author alexis.linard
 *
 */
public class DataSourceManager {

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
	
}
