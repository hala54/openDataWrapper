package openDataWrapper;

import static org.junit.Assert.*;

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
		assertEquals(expectedNForce, instance.printStatements(infmodel, nForce, null, null)); 
	
	}

}
