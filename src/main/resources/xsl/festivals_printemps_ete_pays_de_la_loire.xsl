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
@prefix  gndo: &lt;htpp://d-nb.info/standards/elementset/gnd#&gt; .

&lt;http://lodpaddle.univ-nantes.fr/festivals_printemps_ete_pays_de_la_loire&gt; rdf:type void:Dataset ;
	foaf:homepage "http://data.nantes.fr/donnees/detail/les-festivals-du-printemps-et-de-lete-en-pays-de-la-loire/";
	dcterms:title "festivals printemps ete pays de la loire"^^xsd:string ;
	dcterms:description "festivals printemps ete pays de la loire"^^xsd:string ;
	dcterms:created "2014-12-02"^^xsd:date;
	dcterms:publisher :pub .

:pub rdfs:label "Région des Pays de la Loire".

</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="geo/name"/>
<xsl:text>&#009;rdf:type&#009; pdll:festivals_printemps_ete_pays_de_la_loire;
</xsl:text>
	<xsl:apply-templates select="ORGANISATEUR"/>
	<xsl:apply-templates select="PAGE_FACEBOOK"/>
	<xsl:apply-templates select="_l"/>
	<xsl:apply-templates select="DATES"/>
	<xsl:apply-templates select="DEPARTEMENT"/>
	<xsl:apply-templates select="VILLE"/>
	<xsl:apply-templates select="CODE_INSEE"/>
	<xsl:apply-templates select="SITE_WEB"/>
	<xsl:apply-templates select="AUTRES_VILLES"/>
	<xsl:apply-templates select="PROGRAMMATION"/>
	<xsl:apply-templates select="TYPE"/>

</xsl:template>

<xsl:template match="ORGANISATEUR">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:performer&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:performer&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PAGE_FACEBOOK">
<xsl:choose><xsl:when test=". = 'null'">&#009;foaf:page&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;foaf:page&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="_l">&#009;geo:lat&#009;"<xsl:value-of select="substring-after(substring-before(.,' ,'),'[ ')"/>"^^xsd:decimal ;
&#009;geo:long&#009;"<xsl:value-of select="substring-before(substring-after(.,', '),']')"/>"^^xsd:decimal  ;
</xsl:template>

<xsl:template match="geo/name"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.univ-nantes.fr/festivals_printemps_ete_pays_de_la_loire/',encode-for-uri(.)),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DATES">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:openingHours&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:openingHours&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="DEPARTEMENT">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:department&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:department&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="VILLE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:town&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:town&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CODE_INSEE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:insee&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:insee&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="SITE_WEB">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:website&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:website&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="AUTRES_VILLES">
<xsl:choose><xsl:when test=". = 'null'">&#009;gndo:otherPlace&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;gndo:otherPlace&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PROGRAMMATION">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:performers&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:performers&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="TYPE">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:genre&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;sc:genre&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>