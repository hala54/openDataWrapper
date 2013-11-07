package openDataWrapper;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import org.mindswap.pellet.jena.ModelExtractor;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.util.FileManager;

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

		StringBuilder outputFile = new StringBuilder("src/main/resources/output/owl/");
		
		loadLinkedDataset(outputFile);

		// Create an inference extractor
		ModelExtractor extractor = new ModelExtractor(masterModel);

		// Extract default set of inferences
		Model inferences = extractor.extractModel();

		// write loaded datasets into output files
		writeModelIntoOutputFile(inferences, outputFile);

		// empty model
		emptyModel();
		
	}
	
	/**
	 * Methode permettant de charger un dataset issu d'autres datasets
	 */
	private StringBuilder loadLinkedDataset(StringBuilder outputFile) {
		String pathToRequestedLinkedDataset = DataSourceManager.chooseAvailableLinkedDatasets();
		loadDataset(DataSourceManager.PATH_TO_LINKED_DATASETS.append("/").append(pathToRequestedLinkedDataset).toString());
		return outputFile.append(pathToRequestedLinkedDataset);
	}
	
	/**
	 * Load the specified data source data into the jena model.
	 * 
	 * @param ttl
	 *            the turtle input of data.
	 */
	private void loadDataset(String ttl) {
		if (masterModel == null) {
			masterModel = FileManager.get().loadModel("file:" + ttl, "N3");
		} else {
			try {
				FileManager.get()
						.readModel(masterModel, "file:" + ttl, "N3");
			} catch (Exception e) {
				System.err.println("The n3 file doesn't exist " + ttl + "  "
						+ e.getMessage());
			}
		}
	}
	
	
	/**
	 * Writes models into output files
	 * 
	 * @param outputFileN3
	 *            output file for .n3 file
	 * @param outputFileRDFXML
	 *            output file for .rdf file
	 */
	private void writeModelIntoOutputFile(Model model, StringBuilder outputFile) {
		BufferedWriter out;
		try {
			out = new BufferedWriter(new FileWriter(outputFile
					.append(".owl").toString()));
			model.write(out, "N3");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}


	}
}
