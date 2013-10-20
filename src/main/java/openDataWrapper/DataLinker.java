package main.java.openDataWrapper;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.InputMismatchException;
import java.util.Properties;
import java.util.Scanner;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.util.FileManager;

/**
 * 
 * @author alexis.linard
 * 
 */
public class DataLinker {

	/**
	 * Modele en cours
	 */
	Model masterModel;

	/**
	 * Instance unique pré-initialisée du Singleton
	 */
	private static DataLinker INSTANCE = new DataLinker();

	/**
	 * Constructeur privé du singleton DataLinker
	 */
	private DataLinker() {

	}

	/**
	 * Point d'accès pour l'instance unique du singleton
	 */
	public static DataLinker getInstance() {
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
	 * Main method running DataLinker on chosen datasources
	 */
	public void run() {
		StringBuilder outputFileN3 = new StringBuilder(
				"ressources/output/linkedData/ttl/linked-");
		StringBuilder outputFileRDFXML = new StringBuilder(
				"ressources/output/linkedData/rdf-xml/linked-");

		//choose and load datasets into model
		loadChosenDatasets(outputFileN3, outputFileRDFXML);

		//write loaded datasets into output files
		writeModelIntoOutputFiles(outputFileN3, outputFileRDFXML);

		//empty model
		emptyModel();

		//delete duplicated triples into files
		try {
			deleteAllDuplicate();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Writes models into output files
	 * @param outputFileN3 output file for .n3 file
	 * @param outputFileRDFXML output file for .rdf file
	 */
	private void writeModelIntoOutputFiles(StringBuilder outputFileN3,
			StringBuilder outputFileRDFXML) {
		BufferedWriter outN3;
		BufferedWriter outRDFXML;
		try {
			outN3 = new BufferedWriter(new FileWriter(outputFileN3
					.append(".n3").toString()));
			masterModel.write(outN3, "N3");
			outN3.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		try {
			outRDFXML = new BufferedWriter(new FileWriter(outputFileRDFXML
					.append(".rdf").toString()));
			masterModel.write(outRDFXML, "RDF/XML");
			outRDFXML.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Let users choosing datasets and loading datasets into model
	 * @param outputFileN3 output file for .n3 file
	 * @param outputFileRDFXML output file for .rdf file
	 */
	private void loadChosenDatasets(StringBuilder outputFileN3,
			StringBuilder outputFileRDFXML) {
		System.out.println("which datasets do you want to link?\nwrite datasets numbers separating numbers by ';' ");
		DataSourceManager.printAvailableDataSources();

		Scanner in = new Scanner(System.in);

		try {
			String result = in.nextLine();
			String[] results = result.split(";");
			for (String res : results) {
				if (Integer.valueOf(res) > 0
						&& Integer.valueOf(res) <= DataSourceManager
								.getAvailableDataSources().size()) {
					DataSource dts = DataSourceManager.getAvailableDataSources().get(
							Integer.valueOf(res));
					outputFileN3.append(dts.getNom()).append("-");
					outputFileRDFXML.append(dts.getNom()).append("-");
					loadDataset(dts);
					System.out.println("loading " + dts.getNom() + " ok!");
				} else {
					System.err.println("error loading dataset!");
				}
			}
		} catch (InputMismatchException e) {
			System.err.println("The input isn't a string!");
		} finally {
			in.close();
		}
	}

	/**
	 * Load the specified data source data into the jena model.
	 * 
	 * @param dts
	 *            the DataSource object containing information about data.
	 */
	private void loadDataset(DataSource dts) {
		String n3path = dts.getOutputTtl();
		if (masterModel == null) {
			masterModel = FileManager.get().loadModel("file:" + n3path, "N3");
		} else {
			try {
				FileManager.get()
						.readModel(masterModel, "file:" + n3path, "N3");
			} catch (Exception e) {
				System.err.println("The n3 file doesn't exist " + n3path + "  "
						+ e.getMessage());
			}
		}
	}

	/**
	 * Add links in the source file and suppress all the duplicates dbpprop:town
	 * for all the source files with links (cf linkmapping.properties)
	 * 
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	private void deleteAllDuplicate() throws FileNotFoundException, IOException {
		File file = new File("ressources/output/linkedData/ttl");
		File[] files = file.listFiles();
		Properties prop = new Properties();
		prop.load(new FileReader("configuration/linkmapping.properties"));
		String name = "", name1 = "", filename;

		if (files != null) {
			for (File fi : files) {
				if (fi.isFile() == true && fi.getName().endsWith(".n3")
						&& fi.getName().startsWith("linked-") && fi != null) {

					try {
						if ((filename = fi.getName().substring(0,
								fi.getName().indexOf(".n3"))) != null) {
							if (prop.getProperty("map" + filename) != null) {
								name = prop.getProperty("map" + filename)
										.split(",")[2];
								name1 = prop.getProperty("map" + filename)
										.split(",")[0];
								System.out.println(name1 + " , " + name);

								File f = new File(
										"ressources/output/links/resultFiles");
								if (!f.exists() || !f.isDirectory()) {
									// faire la création
									if (!f.mkdirs()) {
										System.err
												.println("Unable to create output folder! Stop");
										return;
									}
								}
								deleteDuplicates(fi.getPath(),
										"ressources/output/links/nt/" + name1
												+ "-" + name + ".nt",
										"ressources/output/links/resultFiles/"
												+ name1 + "-" + name + ".ttl");
							}
						}
						// System.out.println("map"+fi.getName().substring(0,
						// fi.getName().indexOf(".n3")));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	/**
	 * Delete the duplicates property dbpprop:town within the srcFile and add
	 * the corresponding town Uri if it exist
	 * 
	 * @param srcFile
	 *            The path to the source File
	 * @param linkFile
	 *            The path to the link file
	 * @param output
	 *            The output file
	 * @throws Exception
	 */
	private void deleteDuplicates(String srcFile, String linkFile, String output)
			throws Exception { // a modifier

		BufferedReader reader = new BufferedReader(new FileReader(srcFile));
		BufferedReader linkReader = new BufferedReader(new FileReader(linkFile));
		HashMap<String, String> linkMap = new HashMap<String, String>();
		StringBuilder stringBuilder = new StringBuilder();
		String ls = System.getProperty("line.separator");
		String tempuri, temptown;
		int cpt = 1;
		String line = null;
		String[] items;
		String town;
		Boolean isTownFound = false;
		String linkuri = "";

		/** lecture du fichier de liens et le contenu est mis dans une map **/
		while ((line = linkReader.readLine()) != null) {

			if (line.length() > 1) {

				items = line.split("<");
				town = items[3].split("http://dbpedia.org/resource/")[1];
				/*******/
				linkMap.put("<" + items[1].trim(),
						"<" + items[3].substring(0, items[3].indexOf(" .")));
				linkuri = "<" + items[2].trim();
			}
		}

		if (linkuri.equals("<http://www.w3.org/2002/07/owl#sameAs>")) {
			linkuri = "owl:sameAs";
		} else if (linkuri.equals("<http://dbpedia.org/property/town>")) {
			linkuri = "dbpprop:town";
		}

		/** Construction du nouveau fichier en remplaçant ce qu'il faut **/
		while ((line = reader.readLine()) != null) {
			if (line.length() > 1) {
				if (line.trim().charAt(0) == '<') {

					stringBuilder.append(line);
					stringBuilder.append(ls);

					isTownFound = false;

					tempuri = line.split("\t")[0];
					if (linkMap.containsKey(tempuri)) {

						String ligne2 = "";
						String tmp2;
						cpt++;

						while ((ligne2 = reader.readLine()) != null
								&& !(ligne2.isEmpty())
								&& (ligne2.trim().charAt(0) != '<')) {

							if (ligne2.trim().startsWith("dbpprop:town")) {
								tmp2 = ligne2.split("\t")[2];
								line = "\t" + linkuri + "\t"
										+ linkMap.get(tempuri) + ";";
								stringBuilder.append(line);
								stringBuilder.append(ls);
								isTownFound = true;

							} else {
								stringBuilder.append(ligne2);
								stringBuilder.append(ls);
							}
						}

						/**
						 * Si la propriete dbpprop:town n'existe pas, la
						 * rajouter
						 **/
						if (isTownFound == false) {
							if (linkMap.get(tempuri) != null) {
								line = "\t" + linkuri + "\t"
										+ linkMap.get(tempuri) + ".";
								stringBuilder.replace(
										stringBuilder.lastIndexOf("."),
										stringBuilder.lastIndexOf(".") + 1,
										" ;");
								stringBuilder.append(line);
								stringBuilder.append(ls);
							} else {
								line = "\t" + linkuri
										+ "\t\"undefined\"^^xsd:string ;";
								stringBuilder.append(line);
								stringBuilder.append(ls);
							}
						}

						if (ligne2.isEmpty()) {
							stringBuilder.append(ls);
						}
					} else {
						/** Si aucun liens n'a pu etre trouvé **/

						String ligne3 = "";
						String tmp3;
						cpt++;

						while ((ligne3 = reader.readLine()) != null
								&& !(ligne3.isEmpty())
								&& (ligne3.trim().charAt(0) != '<')) {

							if (ligne3.trim().startsWith("dbpprop:town")) {
								tmp3 = ligne3.split("\t")[2];
								stringBuilder.append(ligne3);
								stringBuilder.append(ls);
								isTownFound = true;

							} else {
								stringBuilder.append(ligne3);
								stringBuilder.append(ls);
							}
						}

						/**
						 * Si la propriete dbpprop:town n'existe pas, la
						 * rajouter
						 **/
						if (isTownFound == false) {
							line = "\t" + linkuri
									+ "\t\"undefined\"^^xsd:string .";
							stringBuilder.replace(
									stringBuilder.lastIndexOf("."),
									stringBuilder.lastIndexOf(".") + 1, " ;");
							stringBuilder.append(line);
							stringBuilder.append(ls);
						}

						if (ligne3.isEmpty()) {
							stringBuilder.append(ls);
						}

					}
				} else {
					stringBuilder.append(line);
					stringBuilder.append(ls);
				}
			} else {
				stringBuilder.append(ls);
			}
		}
		reader.close();
		// System.out.println("Compteur "+cpt);
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			out.write(stringBuilder.toString());
			out.close();
		} catch (IOException e) {
			System.out.println("Exception ");
		}

	}
}
