<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ex="http://www.example.org/" 
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
> 
<xsl:output method='text' encoding='UTF-8'/>

<xsl:template match="weatherdata">
  <xsl:text>@prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
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
@prefix dc: &lt;http://purl.org/dc/elements/1.1/&gt;

@prefix shw: &lt;http://paul.staroch.name/thesis/SmartHomeWeather/owl#&gt; .

&lt;http://lodpaddle.univ-nantes.fr/meteoPrevision3h&gt; rdf:type void:Dataset ;
  foaf:homepage "http://http://api.openweathermap.org/data/2.5/forecast?q=Nantes&amp;mode=xml";
  dcterms:title "Les previsions meteo 3h de la ville de Nantes"^^xsd:string ;
  dcterms:description "Les previsions meteo la ville de Nantes toutes les 3h sur 5 jours"^^xsd:string ;
  dcterms:created "2014-12-08"^^xsd:date;
  dcterms:publisher :pub.

:pub rdfs:label "Open Weather Map".

:from rdfs:subPropertyOf dc:date.
:to rdfs:subPropertyOf dc:date.

&lt;http://lodpaddle.univ-nantes.fr/meteoPrevision3h&gt;
  </xsl:text>

	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="text()">
</xsl:template>

<xsl:template match="location">
  <xsl:text>dbpprop:town "</xsl:text><xsl:value-of select="name/text()" />
  <xsl:text>".
  </xsl:text>
</xsl:template>

<xsl:template match="time">
  <xsl:text>&lt;http://lodpaddle.univ-nantes.fr/meteoPrevision3h&gt; :forecast _:prevision</xsl:text><xsl:value-of select="substring(@from, 1, 13)" /><xsl:text>.
_:prevision</xsl:text><xsl:value-of select="substring(@from, 1, 13)" /><xsl:text>
  </xsl:text>
  <xsl:apply-templates/>
  <xsl:text>:from "</xsl:text><xsl:value-of select="@from" /><xsl:text>";
  :to "</xsl:text><xsl:value-of select="@to" /><xsl:text>".

</xsl:text>
</xsl:template>


<xsl:template match="temperature">
  <xsl:text>shw:hasTemperature </xsl:text><xsl:value-of select="@value" />
  <xsl:text>;
  </xsl:text>
</xsl:template>

<xsl:template match="humidity">
  <xsl:text>shw:hasHumidityValue </xsl:text><xsl:value-of select="@value" />
  <xsl:text>;
  </xsl:text>
</xsl:template>

<xsl:template match="pressure">
  <xsl:text>shw:hasPressureValue </xsl:text><xsl:value-of select="@value" />
  <xsl:text>;
  </xsl:text>
</xsl:template>

<xsl:template match="wind/speed">
  <xsl:text>shw:hasWindSpeed </xsl:text><xsl:value-of select="@value" />
  <xsl:text>;
  </xsl:text>
</xsl:template>

<xsl:template match="wind/direction">
  <xsl:text>shw:hasWindDirection </xsl:text><xsl:value-of select="@value" />
  <xsl:text>;
  </xsl:text>
</xsl:template>

<xsl:template match="clouds">
  <xsl:text>shw:hasCloudCover </xsl:text><xsl:value-of select="@all" />
  <xsl:text>;
  </xsl:text>
</xsl:template>

<xsl:template match="precipitation[@mode='rain']">
  <xsl:text>shw:hasPrecipitationIntensity </xsl:text><xsl:value-of select="@value"/>
  <xsl:text>;
  </xsl:text>
</xsl:template>

<xsl:template match="precipitation[@mode='no']">
  <xsl:text>shw:hasPrecipitationIntensity 0</xsl:text>
  <xsl:text>;
  </xsl:text>
</xsl:template>

</xsl:stylesheet>
