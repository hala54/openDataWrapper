package openDataWrapper.inference;

import java.util.Collection;

import com.hp.hpl.jena.rdf.model.InfModel;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.Property;
import com.hp.hpl.jena.rdf.model.Resource;

/**
 * Class making inferences
 * @author alexis.linard
 *
 */
public interface InferenceMaker {

	public void run();
	
	public InfModel createInfModel(String inputSchema, String inputData);
	
	public Collection<String> printStatements(Model m, Resource s, Property p, Resource o);
	
}
