package openDataWrapper;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.InputMismatchException;
import java.util.Scanner;

import com.hp.hpl.jena.rdf.model.InfModel;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Property;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.rdf.model.Statement;
import com.hp.hpl.jena.rdf.model.StmtIterator;
import com.hp.hpl.jena.reasoner.Reasoner;
import com.hp.hpl.jena.reasoner.ReasonerRegistry;
import com.hp.hpl.jena.util.FileManager;
import com.hp.hpl.jena.util.PrintUtil;

/**
 * 
 * @author alexis.linard
 * 
 */
public class OWLInferenceMaker {

	/**
	 * Instance unique pré-initialisée du Singleton
	 */
	private static OWLInferenceMaker INSTANCE = new OWLInferenceMaker();

	/**
	 * Constructeur privé du singleton OWLInferenceMaker
	 */
	private OWLInferenceMaker() {
	}

	/**
	 * Point d'accès pour l'instance unique du singleton
	 */
	public static OWLInferenceMaker getInstance() {
		return INSTANCE;
	}

	/**
	 * Main method running OWLInferenceMaker on chosen datasources
	 */
	public void run() {

		String inputSchema = DataSourceManager.chooseAvailableOWLSchemas();
		String inputData = "";

		Scanner in = new Scanner(System.in);
		try {
			System.out.println(" Do you want to use:\n"
					+ "[1] Linked datasets\n" + "[2] Simple datasets\n");
			int result = in.nextInt();

			switch (result) {
			case 1:
				inputData = DataSourceManager
						.chooseAvailableLinkedDatasetsRDF();
				break;
			case 2:
				inputData = DataSourceManager.chooseAvailableDatasetsRDF();
				break;
			default:
				// on quitte
				System.err.println("Choose 1 or 2");
				return;
			}
		} catch (InputMismatchException e) {
			System.out.println("input is not a number!");
			in.nextLine();
		}

		InfModel infmodel = createInfModel(inputSchema, inputData);

		System.out
				.println("Which resource do you want to test? Press 0 to exit\n");

		BufferedReader inString = new BufferedReader(new InputStreamReader(
				System.in));

		try {
			String resource = inString.readLine();

			while (!resource.contentEquals("0")) {
				Resource res = infmodel.getResource(resource);
				System.out.println(resource + " :");
				printStatements(infmodel, res, null, null);
				System.out
						.println("Which resource do you want to test? Press 0 to exit\n");
				resource = inString.readLine();

			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Creates an Inference model
	 * 
	 * @param inputSchema
	 *            the input selected schema
	 * @param inputData
	 *            the input selected data
	 * @return an InfModel to make inferences
	 */
	public InfModel createInfModel(String inputSchema, String inputData) {
		Reasoner reasoner = ReasonerRegistry.getOWLReasoner();
		reasoner = reasoner.bindSchema(FileManager.get().loadModel(
				"file:" + inputSchema));
		InfModel infmodel = ModelFactory.createInfModel(reasoner, FileManager
				.get().loadModel("file:" + inputData));
		return infmodel;
	}

	/**
	 * Method printing inferences of a given InfModel, for a given resource
	 * 
	 * @param m
	 *            the model
	 * @param s
	 *            the input resource
	 * @param p
	 *            the RDF property (RDF.type, etc...)
	 * @param o
	 *            ?
	 */
	public Collection<String> printStatements(Model m, Resource s, Property p,
			Resource o) {
		Collection<String> stringOutput = new ArrayList<String>();
		for (StmtIterator i = m.listStatements(s, p, o); i.hasNext();) {
			Statement stmt = i.nextStatement();
			System.out.println(" - " + PrintUtil.print(stmt));
			stringOutput.add(PrintUtil.print(stmt));
		}
		return stringOutput;

	}

}
