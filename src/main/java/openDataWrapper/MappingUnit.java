package main.java.openDataWrapper;

/**
 * 
 * @author alexis.linard
 *
 */
public class MappingUnit {

	public String vocabulaire;
	public String type;
	public boolean ignore;

	/**
	 * 
	 * @param vocabulaire
	 * @param type
	 */
	public MappingUnit(String vocabulaire, String type) {
		super();
		this.vocabulaire = vocabulaire;
		this.type = type;
		ignore = false;
	}

	/**
	 * 
	 * @param prop
	 */
	public MappingUnit(String prop) {
		super();
		String[] splitProp = prop.split(",");
		if (splitProp.length >= 2) {
			this.vocabulaire = splitProp[0];
			this.type = splitProp[1];
		} else {
			if (prop.equals("ignore")) {
				ignore = true;
			} else {
				System.err.println("la propriété n'est pas complète " + prop);
			}
		}
	}

	/**
	 * 
	 * @return
	 */
	public String getVocabulaire() {
		return vocabulaire;
	}

	/**
	 * 
	 * @return
	 */
	public String getType() {
		return type;
	}
}
