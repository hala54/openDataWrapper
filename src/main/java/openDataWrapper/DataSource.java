package main.java.openDataWrapper;


/**
 * This class describes a datasource
 * @author alexis.linard
 *
 */
public class DataSource {

	public String nom;
	public String apiUrl;
	public String url;
	public String titre;
	public String publisher;
	public String xsltFile;
	public boolean specificXSLT;
	public String outputTtl;
	public String outputRdf;

	
	/**
	 * Constructor of a DataSource
	 * @param nom API's name
	 * @param apiUrl API's url
	 * @param url API's description url
	 * @param titre API's title
	 * @param publisher Publisher of the API
	 * @param xsltFile 
	 * @param specificXSLT
	 * @param outputTtl Output folder for generated Turtle files
	 * @param outputRdf Output folder for generated RDF-XML files
	 */
	public DataSource(String nom, String apiUrl,String url, String titre, String publisher, String xsltFile,
			boolean specificXSLT, String outputTtl, String outputRdf) {
		super();
		this.nom = nom;
		this.apiUrl = apiUrl;
		this.url = url;
		this.titre = titre;
		this.publisher = publisher;
		this.xsltFile = xsltFile;
		this.specificXSLT = specificXSLT;
		this.outputTtl = outputTtl;
		this.outputRdf = outputRdf;
	}

	/**
	 * 
	 * @return
	 */
	public String getNom() {
		return nom;
	}

	/**
	 * 
	 * @return
	 */
	public String getApiUrl() {
		return apiUrl;
	}

	/**
	 * 
	 * @return
	 */
	public String getXsltFile() {
		return xsltFile;
	}

	/**
	 * 
	 * @return
	 */
	public boolean isSpecificXSLT() {
		return specificXSLT;
	}

	/**
	 * 
	 * @return
	 */
	public String getOutputTtl() {
		return outputTtl;
	}

	/**
	 * 
	 * @return
	 */
	public String getOutputRdf() {
		return outputRdf;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * 
	 * @return
	 */
	public String getTitre() {
		return titre;
	}

	/**
	 * 
	 * @return
	 */
	public String getPublisher() {
		return publisher;
	}

}
