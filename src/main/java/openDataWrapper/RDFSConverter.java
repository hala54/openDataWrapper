package openDataWrapper;

import com.hp.hpl.jena.rdf.model.Model;

/**
 * 
 * @author alexis.linard
 *
 */
public class RDFSConverter {

	/**
	 * Modele en cours
	 */
	Model masterModel;

	/**
	 * Instance unique pré-initialisée du Singleton
	 */
	private static RDFSConverter INSTANCE = new RDFSConverter();

	/**
	 * Constructeur privé du singleton RDFSConverter
	 */
	private RDFSConverter() {

	}

	/**
	 * Point d'accès pour l'instance unique du singleton
	 */
	public static RDFSConverter getInstance() {
		return INSTANCE;
	}

	/**
	 * This method is supposed to clear the current model from memory. Haven't
	 * seen any lowering in memory after execution though... garbage collector?
	 * Anyway, the model is empty after execution.
	 */
	private void emptyModel() {
		if (masterModel != null) {
			masterModel.removeAll();
			System.out.println("The model has been successfully emptied");
		} else {
			System.out.println("No existing model. Please load data first!");
		}
	}

	/**
	 * Main method running RDFSConverter on chosen datasources
	 */
	public void run() {
		//TODO implement
		System.err.println("Not Implemented yet");
	}
	
	
	
}
