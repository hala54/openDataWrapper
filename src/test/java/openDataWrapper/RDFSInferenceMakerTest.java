package openDataWrapper;

import static org.junit.Assert.*;

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
		assertEquals(expectedColin, instance.printStatements(infmodel, colin, RDF.type, null)); 

		Resource person = infmodel.getResource("urn:x-hp:eg/Person");
		assertEquals(expectedPerson, instance.printStatements(infmodel, person, RDF.type, null)); 

	}

}
