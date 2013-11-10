package openDataWrapper;

import static org.junit.Assert.*;

import java.util.Collection;

import org.junit.Test;

import com.hp.hpl.jena.rdf.model.InfModel;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.vocabulary.RDF;

/**
 * Class testing RDFS Inference Maker
 * 
 * @author alexis.linard
 * 
 */
public class RDFSInferenceMakerTest {

	RDFSInferenceMaker instance = RDFSInferenceMaker.getInstance();
	String inputSchema = "src/test/resources/input/rdfsDemoData.rdf";
	String inputData = "src/test/resources/input/rdfsDemoData.rdf";

	String expectedColin = " - (eg:colin rdf:type eg:Teenager)\n - (eg:colin rdf:type rdfs:Resource)\n - (eg:colin rdf:type eg:Person)";
	String expectedPerson = " - (eg:Person rdf:type rdfs:Class)\n - (eg:Person rdf:type rdfs:Resource)";
	
	@Test
	public void testCreateInfModel() {

		InfModel infmodel = instance.createInfModel(inputSchema, inputData);

		Resource colin = infmodel.getResource("urn:x-hp:eg/colin");
		Collection<String> stmts1 = instance.printStatements(infmodel, colin, null, null);
		
		assertTrue(stmts1.contains("(eg:colin rdf:type eg:Teenager)"));
		assertTrue(stmts1.contains("(eg:colin eg:age '13')"));
		assertTrue(stmts1.contains("(eg:colin eg:mum eg:rosy)"));

		assertFalse(stmts1.contains("(eg:Person rdf:type rdfs:Class)"));

		

		Resource person = infmodel.getResource("urn:x-hp:eg/Person");
		Collection<String> stmts2 = instance.printStatements(infmodel, person, RDF.type, null);

		assertTrue(stmts2.isEmpty());

		assertFalse(stmts2.contains("(eg:colin rdf:type eg:Teenager)"));

	}

}
