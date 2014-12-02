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
@prefix vcard: &lt;http://www.w3.org/2006/vcard/ns#&gt; .

&lt;http://lodpaddle.univ-nantes.fr/parc_et_jardin&gt; rdf:type void:Dataset ;
	foaf:homepage "informations sur les parc et jardin de nantes";
	dcterms:title "Parc et jardins"^^xsd:string ;
	dcterms:description "Parc et jardins"^^xsd:string ;
	dcterms:created "2014-12-02"^^xsd:date;
	dcterms:publisher :pub .

:pub rdfs:label "Nantes métropole".

</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="geo/name"/>
<xsl:text>&#009;rdf:type&#009; pdll:parc_et_jardin;
</xsl:text>
	<xsl:apply-templates select="Jardin_clos"/>
	<xsl:apply-templates select="Jeux"/>
	<xsl:apply-templates select="Commentaire"/>
	<xsl:apply-templates select="Pataugeoire"/>
	<xsl:apply-templates select="Acces_Tan"/>
	<xsl:apply-templates select="Mobilier_pique_nique"/>
	<xsl:apply-templates select="_l"/>
	<xsl:apply-templates select="Acces_handicap_y_compris_sanitai"/>
	<xsl:apply-templates select="Gardien"/>
	<xsl:apply-templates select="Code"/>
	<xsl:apply-templates select="adresse_postale"/>
	<xsl:apply-templates select="Surface_hors_batiments"/>
	<xsl:apply-templates select="Sanitaires"/>
	<xsl:apply-templates select="Abris"/>
	<xsl:apply-templates select="Collection_vegetale"/>
	<xsl:apply-templates select="Point_d_eau"/>
	<xsl:apply-templates select="Chien_interdit_en_laisse"/>

</xsl:template>

<xsl:template match="Jardin_clos">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:enclosed_garden&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:enclosed_garden&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Jeux">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasPlayingArea&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasPlayingArea&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Commentaire">
<xsl:choose><xsl:when test=". = 'null'">&#009;rdfs:comment&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;rdfs:comment&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Pataugeoire">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasPaddlingPool&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasPaddlingPool&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Acces_Tan">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:mobilityServicesNearby&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:mobilityServicesNearby&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Mobilier_pique_nique">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasPicNicFurniture&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasPicNicFurniture&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="_l">&#009;geo:lat&#009;"<xsl:value-of select="substring-after(substring-before(.,' ,'),'[ ')"/>"^^xsd:decimal ;
&#009;geo:long&#009;"<xsl:value-of select="substring-before(substring-after(.,', '),']')"/>"^^xsd:decimal  ;
</xsl:template>

<xsl:template match="Acces_handicap_y_compris_sanitai">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasDisabledAccess&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasDisabledAccess&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Gardien">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasWatchMan&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasWatchMan&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Code">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:id&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:id&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="adresse_postale">
<xsl:choose><xsl:when test=". = 'null'">&#009;vcard:street-address&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;vcard:street-address&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Surface_hors_batiments">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:dimensions&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:dimensions&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Sanitaires">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasWaterCloset&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasWaterCloset&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Abris">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasShelter&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasShelter&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Collection_vegetale">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:collectionVegetable&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:collectionVegetable&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="geo/name"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.univ-nantes.fr/parc_et_jardin/',encode-for-uri(.)),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Point_d_eau">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasWaterSource&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasWaterSource&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="Chien_interdit_en_laisse">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:dogsForbidenWithoutLead&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;pdll:dogsForbidenWithoutLead&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>