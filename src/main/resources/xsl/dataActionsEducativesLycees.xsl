<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ex="http://www.example.org/" 
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	> 
<xsl:output method='text' encoding='UTF-8'/>

<xsl:template match="document">
	<xsl:apply-templates select="data"/>
</xsl:template>

<xsl:variable name="incr" select="0"></xsl:variable>

<xsl:template match="data">
	<xsl:text>
@prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
@prefix : &lt;#&gt; .
@prefix void: &lt;http://rdfs.org/ns/void#&gt; .
@prefix TEMPORAIRE: &lt;http://temporaire.org/&gt; .
@prefix gr: &lt;http://purl.org/goodrelations/&gt; .
@prefix pdll: &lt;http://lodpaddle.univ-nantes.fr/&gt; .
@prefix dbpedia: &lt;http://dbpedia.org/resource/&gt; .
@prefix prop-fr: &lt;http://fr.dbpedia.org/property/&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix ex: &lt;http://example.org/&gt; .
@prefix owl: &lt;http://www.w3.org/2002/07/owl#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix dbpprop: &lt;http://dbpedia.org/property/&gt; .
@prefix dbpedia-owl: &lt;http://dbpedia.org/ontology/&gt; .
@prefix sc: &lt;http://schema.org/&gt; .
@prefix geo: &lt;http://www.w3.org/2003/01/geo/wgs84_pos#&gt; .

&lt;http://lodpaddle.univ-nantes.fr/dataActionsEducativesLycees&gt; rdf:type void:Dataset ;
	foaf:homepage "http://data.paysdelaloire.fr/donnees/detail/actions-educatives-conduites-dans-les-lycees-publics-et-prives-des-pays-de-la-loire/";
	dcterms:title "Actions Educatives conduites dans les lycées publics et privés des Pays de la Loire"^^xsd:string ;
	dcterms:description "Actions Educatives conduites dans les lycées publics et privés des Pays de la Loire"^^xsd:string ;
	dcterms:created "2013-11-03"^^xsd:date;
	dcterms:publisher :pub .

:pub rdfs:label "Région des Pays de la Loire".

</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="COMMUNE_LIBELLE"/>
<xsl:text>&#009;rdf:type&#009; pdll:dataActionsEducativesLycees;
</xsl:text>
	<xsl:apply-templates select="DENOMINATION_LONGUE"/>
	<xsl:apply-templates select="DENOMINATION"/>
	<xsl:apply-templates select="PUBLIC_PRIVE"/>
	<xsl:apply-templates select="NB_ELEVES"/>
	<xsl:apply-templates select="ANNEE"/>
	<xsl:apply-templates select="THEME"/>
	<xsl:apply-templates select="MINISTERE_CODE"/>
	<xsl:apply-templates select="ADRESSE_4"/>
	<xsl:apply-templates select="COMMUNE_CODE_INSEE"/>
	<xsl:apply-templates select="MINISTERE_LIBELLE"/>
	<xsl:apply-templates select="CATEGORIE_RECTORAT_CODE_LIBELLE"/>
	<xsl:apply-templates select="ADRESSE_1"/>
	<xsl:apply-templates select="ADRESSE_2"/>
	<xsl:apply-templates select="CATEGORIE_RECTORAT_CODE"/>
	<xsl:apply-templates select="ADRESSE_3"/>
	<xsl:apply-templates select="SOUS_THEME"/>
	<xsl:apply-templates select="RNE"/>
	<xsl:apply-templates select="VILLE"/>
	<xsl:apply-templates select="BP"/>
	<xsl:apply-templates select="ACTION"/>

</xsl:template>

<xsl:template match="COMMUNE_LIBELLE"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.univ-nantes.fr/dataActionsEducativesLycees/',encode-for-uri(.)),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DENOMINATION_LONGUE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:highschoolNameExtanded&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:highschoolNameExtanded&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DENOMINATION">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:highschoolName&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:highschoolName&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PUBLIC_PRIVE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:privacy&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:privacy&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="NB_ELEVES">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:NB_ELEVES&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:NB_ELEVES&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ANNEE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dcterms:date&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dcterms:date&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="THEME">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:theme&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:theme&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MINISTERE_CODE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:ministryCode&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:ministryCode&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE_4">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMUNE_CODE_INSEE"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:insee&#009; "-120404040"^^xsd:int ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:insee&#009; "<xsl:value-of select="."/>"^^xsd:int ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="MINISTERE_LIBELLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:ministryName&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:ministryName&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CATEGORIE_RECTORAT_CODE_LIBELLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:rectoratCategoryCodeExplicit&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:rectoratCategoryCodeExplicit&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CATEGORIE_RECTORAT_CODE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:rectoratCategoryCode&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:rectoratCategoryCode&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ADRESSE_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="SOUS_THEME">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:SOUS_THEME&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:SOUS_THEME&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="RNE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:highschoolRNECode&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:highschoolRNECode&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VILLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:town&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:town&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="BP">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:postOfficeBoxNumber&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:postOfficeBoxNumber&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="ACTION">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:ACTION&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:ACTION&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>