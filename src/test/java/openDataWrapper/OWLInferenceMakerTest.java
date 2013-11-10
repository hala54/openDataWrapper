package openDataWrapper;

import static org.junit.Assert.*;

import java.util.Collection;

import org.junit.Test;

import com.hp.hpl.jena.rdf.model.InfModel;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.vocabulary.RDF;

public class OWLInferenceMakerTest {

	OWLInferenceMaker instance = OWLInferenceMaker.getInstance();
	String inputSchema = "src/test/resources/input/owlDemoSchema.owl";
	String inputData = "src/test/resources/input/owlDemoData.rdf";

	String expectedNForce = " - (eg:nForce rdf:type owl:Thing)\n - (eg:nForce owl:sameAs eg:unknownMB)\n - (eg:nForce owl:sameAs eg:nForce)\n - (eg:nForce rdf:type eg:MotherBoard)\n - (eg:nForce rdf:type rdfs:Resource)\n - (eg:nForce rdf:type a3b24:f7822755ad:-7ffd)\n - (eg:nForce eg:hasGraphics eg:gamingGraphics)\n - (eg:nForce eg:hasComponent eg:gamingGraphics)";
	

	@Test
	public void testRun() {


		InfModel infmodel = instance.createInfModel(inputSchema, inputData);

		Resource nForce = infmodel.getResource("urn:x-hp:eg/nForce");
		
		Collection<String> collection = instance.printStatements(infmodel, nForce, null, null);
		
		assertTrue(collection.contains("(eg:nForce rdf:type owl:Thing)"));
		assertTrue(collection.contains("(eg:nForce owl:sameAs eg:unknownMB)"));
		assertTrue(collection.contains("(eg:nForce owl:sameAs eg:nForce)"));
		assertTrue(collection.contains("(eg:nForce rdf:type eg:MotherBoard)"));
		assertTrue(collection.contains("(eg:nForce rdf:type rdfs:Resource)"));
		assertTrue(collection.contains("(eg:nForce eg:hasGraphics eg:gamingGraphics)"));
		assertTrue(collection.contains("(eg:nForce eg:hasComponent eg:gamingGraphics)"));

		assertFalse(collection.contains("(eg:nForce owl:sameAs owl:Thing)"));
	}

}
