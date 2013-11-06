package openDataWrapper;

import com.hp.hpl.jena.rdf.model.Model;

/**
 * 
 * @author alexis.linard
 *
 */
public class OWLConverter {

	/**
	 * Modele en cours
	 */
	Model masterModel;

	/**
	 * Instance unique pré-initialisée du Singleton
	 */
	private static OWLConverter INSTANCE = new OWLConverter();

	/**
	 * Constructeur privé du singleton OWLConverter
	 */
	private OWLConverter() {

	}

	/**
	 * Point d'accès pour l'instance unique du singleton
	 */
	public static OWLConverter getInstance() {
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
	 * Main method running OWLConverter on chosen datasources
	 */
	public void run() {
		//TODO implement
		System.err.println("Not Implemented yet");
	}
	
}
