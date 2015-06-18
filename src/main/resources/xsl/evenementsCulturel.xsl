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
@prefix dul:&lt;http://www.ontologydesignpatterns.org/ont/dul/&gt; .
@prefix time:&lt;http://www.w3.org/2006/time#&gt; .
@prefix igeo:&lt;http://rdf.insee.fr/def/geo#&gt; .

&lt;http://lodpaddle.univ-nantes.fr/evenementsCulturel&gt; rdf:type void:Dataset ;
	foaf:homepage "http://data.infolocale.fr/explore/dataset/agenda_culturel/download/?format=csv&refine.nav_lieu=44&timezone=Europe/Berlin";
	dcterms:title "les évenements Culturel de loire Atlantique"^^xsd:string ;
	dcterms:description "les évenements Culturel de loire Atlantique"^^xsd:string ;
	dcterms:created "2014-11-20"^^xsd:date;
	dcterms:publisher :pub .

:pub rdfs:label "Région pays de la loire".

</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="titre"/>
<xsl:text>&#009;rdf:type&#009; pdll:evenementsCulturel;
</xsl:text>
	<xsl:apply-templates select="genre"/>
	<xsl:apply-templates select="code_postal"/>
	<xsl:apply-templates select="tarif_reduit"/>
	<xsl:apply-templates select="genre_ident"/>
	<xsl:apply-templates select="organisme_ident"/>
	<xsl:apply-templates select="jour_min"/>
	<xsl:apply-templates select="photo_1_path"/>
	<xsl:apply-templates select="departement"/>
	<xsl:apply-templates select="organisme_nom"/>
	<xsl:apply-templates select="photo_1_legende"/>
	<xsl:apply-templates select="jour_du"/>
	<xsl:apply-templates select="texte_milieu"/>
	<xsl:apply-templates select="style"/>
	<xsl:apply-templates select="ident"/>
	<xsl:apply-templates select="categorie"/>
	<xsl:apply-templates select="texte_debut"/>
	<xsl:apply-templates select="jour_3"/>
	<xsl:apply-templates select="photo_2_path"/>
	<xsl:apply-templates select="photo_1_credit"/>
	<xsl:apply-templates select="tarif_autre"/>
	<xsl:apply-templates select="jour_2"/>
	<xsl:apply-templates select="jour_1"/>
	<xsl:apply-templates select="code_insee"/>
	<xsl:apply-templates select="photo_3_path"/>
	<xsl:apply-templates select="coordonnees_gps"/>
	<xsl:apply-templates select="date_creation"/>
	<xsl:apply-templates select="tarif_mention_payant"/>
	<xsl:apply-templates select="rubrique"/>
	<xsl:apply-templates select="photo_2_legende"/>
	<xsl:apply-templates select="tarif_mention_gratuit"/>
	<xsl:apply-templates select="texte_fin"/>
	<xsl:apply-templates select="jour_max"/>
	<xsl:apply-templates select="rubrique_ident"/>
	<xsl:apply-templates select="date_modification"/>
	<xsl:apply-templates select="url"/>
	<xsl:apply-templates select="tarif_general"/>
	<xsl:apply-templates select="etat"/>
	<xsl:apply-templates select="jour_au"/>
	<xsl:apply-templates select="nav_lieu"/>
	<xsl:apply-templates select="commune"/>
	<xsl:apply-templates select="photo_2_credit"/>
	<xsl:apply-templates select="photo_3_credit"/>
	<xsl:apply-templates select="photo_3_legende"/>

</xsl:template>

<xsl:template match="genre">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:category&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:category&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="code_postal">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:postalCode&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:postalCode&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="tarif_reduit">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:minPrice&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:minPrice&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="genre_ident"></xsl:template>

<xsl:template match="organisme_ident"></xsl:template>

<xsl:template match="jour_min">
<xsl:choose><xsl:when test=". = 'null'">&#009;time:intervalStarts&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;time:intervalStarts&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_1_path">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_1_path&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_1_path&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="titre"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.univ-nantes.fr/evenementsCulturel/',encode-for-uri(.)),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="departement"><xsl:choose><xsl:when test=". = 'null'">&#009;igeo:departement&#009; "-120404040"^^xsd:int ;
</xsl:when>
<xsl:otherwise>&#009;igeo:departement&#009; "<xsl:value-of select="."/>"^^xsd:int ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="organisme_nom">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:Organization&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:Organization&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_1_legende">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_1_legende&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_1_legende&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="jour_du"></xsl:template>

<xsl:template match="texte_milieu">
<xsl:choose><xsl:when test=". = 'null'">&#009;dcterms:description&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dcterms:description&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="style"></xsl:template>

<xsl:template match="ident"></xsl:template>

<xsl:template match="categorie"></xsl:template>

<xsl:template match="texte_debut">
<xsl:choose><xsl:when test=". = 'null'">&#009;dcterms:description&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dcterms:description&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="jour_3">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:jour_3&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:jour_3&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_2_path">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_2_path&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_2_path&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_1_credit">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_1_credit&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_1_credit&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="tarif_autre">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:price&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:price&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="jour_2">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:jour_2&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:jour_2&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="jour_1">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:jour_1&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:jour_1&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="code_insee">
<xsl:choose><xsl:when test=". = 'null'">&#009;igeo:codeINSEE&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;igeo:codeINSEE&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_3_path">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_3_path&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_3_path&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="coordonnees_gps">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:GeoCoordinates&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:GeoCoordinates&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="date_creation">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:datePublished&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:datePublished&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="tarif_mention_payant">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:tarif_mention_payant&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:tarif_mention_payant&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="rubrique">
<xsl:choose><xsl:when test=". = 'null'">&#009;dul:EventType&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dul:EventType&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_2_legende">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_2_legende&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_2_legende&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="tarif_mention_gratuit"></xsl:template>

<xsl:template match="texte_fin">
<xsl:choose><xsl:when test=". = 'null'">&#009;dcterms:description&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dcterms:description&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="jour_max">
<xsl:choose><xsl:when test=". = 'null'">&#009;time:intervalFinishes&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;time:intervalFinishes&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="rubrique_ident"></xsl:template>

<xsl:template match="date_modification">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:dateModified&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:dateModified&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="url">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:url&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:url&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="tarif_general">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:maxPrice&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:maxPrice&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="etat"></xsl:template>

<xsl:template match="jour_au"></xsl:template>

<xsl:template match="nav_lieu"></xsl:template>

<xsl:template match="commune">
<xsl:choose><xsl:when test=". = 'null'">&#009;igeo:Commune&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;igeo:Commune&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_2_credit">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_2_credit&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_2_credit&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_3_credit">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_3_credit&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_3_credit&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="photo_3_legende">
<xsl:choose><xsl:when test=". = 'null'">&#009;TEMPORAIRE:photo_3_legende&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;TEMPORAIRE:photo_3_legende&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>