<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- CDA R2 Tyylitiedosto, HL7 Finland 31.10.2011 -->
<!-- Muutoshistoria -->
<!-- 2012.01.10: P�ivitetty muuttuneen Header-m��rittelyn mukaiseksi, lausuntokierroksen kommenttien k�sitelyss� havaitut viilaukset. SP -->
<!-- 2011.10.31: P�ivitetty muuttuneen Header-m��rittelyn mukaiseksi. SP -->
<!-- 2008.08.19: P�ivitetty muuttuneen Header-m��rittelyn mukaiseksi. AE -->
<!-- 2006.09.25: P�ivitetty muuttuneen Header-m��rittelyn mukaiseksi. Lis�tty kuvalinkin esitt�minen (AVE) -->
<!-- 2004.12.12: Lis�tty Sovittujen Header-elementtien muotoilu katseltaviksi. -->
<!-- 2004.12.12: Lis�tty content-elementin attribuutin revised-k�sittely. Eli lis�ykset ja poistot merkit��n.-->
<!-- 2004.09.28: Lis�tty xsl:output lause, jossa sanotaan merkkivalikoimaksi ISO-8859-1. -->
<!-- 2008.12.04: ��nestyksen muutokset Antero Ensio -->
<!-- 2009-05-25 lis�tty @styleCode='xUnstructured' -->
<!-- Muista p�ivitt�� tyylitiedoston versio html-head tagin j�lkeen -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:hl7-org:v3" xmlns:n2="urn:hl7-org:v3/meta/voc" xmlns:voc="urn:hl7-org:v3/voc" xmlns:hl7fi="urn:hl7finland" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="html" indent="yes" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>
  <!-- CDA document -->
  <xsl:template match="/">
    <xsl:apply-templates select="n1:ClinicalDocument"/>
  </xsl:template>
  <xsl:template match="n1:ClinicalDocument">
    <html>
      <head/>
      <style>
        <xsl:comment>
                     .class-normal {  font-style: normal; font-weight: normal; }
                     .class-bold {  font-style: normal; font-weight: bold; }
                     .class-underline { font-style: normal; font-weight: normal; text-decoration: underline; }
                     .class-italics { font-style: italic; font-weight: normal; }
                     .class-emphasis {  font-style: normal; font-weight: normal; background-color:yellow; }
                     .class-delete {  font-style: normal; font-weight: normal; text-decoration:line-through; }
                     .class-insert {  font-style: normal; font-weight: normal; text-decoration:underline; }
                     .class-caption {  font-style: normal; font-weight: bold;  }
        </xsl:comment>
      </style>
      <xsl:comment>
                   KanTa eArkisto CDA R2 Tyylitiedosto
      </xsl:comment>
      <body>
        <em class="class-caption">
          <span style="font-weight:bold; color:green;">
            <h3>
              <xsl:text>CDA R2 tuloste (CDA_Fi_header_2012-01-10.xsl)</xsl:text>
            </h3>
          </span>
        </em>
        <!-- Asiakirjan tunnisteet -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Asiakirjan tunnisteet</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="n1:id"/>
        <xsl:apply-templates select="n1:setId"/>
        <xsl:apply-templates select="n1:versionNumber"/>
        <xsl:apply-templates select="n1:relatedDocument"/>
        <!-- Tekniset CDAR2 rakenteen tiedot -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Tekniset CDAR2 rakenteen tiedot</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="n1:realmCode"/>
        <xsl:apply-templates select="n1:typeId"/>
        <xsl:apply-templates select="n1:templateId"/>
        <!-- Potilas -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Potilas</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="n1:recordTarget"/>
        <!-- Ammattihenkil� -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Ammattihenkil�</xsl:text>
          </h3>
        </span>
        <xsl:call-template name="author">
          <xsl:with-param name="author" select="."/>
        </xsl:call-template>
        <!--xsl:apply-templates select="n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name"/>
        <xsl:apply-templates select="n1:author/n1:assignedAuthor/n1:id"/>
        <xsl:apply-templates select="n1:author/n1:time"/>
        <xsl:apply-templates select="n1:author/n1:assignedAuthor/n1:representedOrganization"/>
        <xsl:apply-templates select="n1:author/n1:functionCode"/>
        <xsl:apply-templates select="n1:author/n1:assignedAuthor/n1:code"/>
        <xsl:apply-templates select="n1:author/n1:assignedAuthor/n1:code/n1:translation/n1:qualifier/n1:value"/-->
        <!-- Asiakirjan elinkaari -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Asiakirjan elinkaari</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="n1:effectiveTime"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:declaredTime"/>
        <xsl:apply-templates select="n1:copyTime"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:retentionPeriod"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:recordStatus"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:auditTrail"/>
        <!-- Asiakirjahallinto -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Asiakirjahallinto</xsl:text>
          </h3>
        </span>
        <xsl:for-each select="n1:participant">
          <xsl:choose>
            <xsl:when test="@typeCode = 'CST'">
              <span style="font-weight:bold; color:green;">
                <xsl:text>2.2.21.1 Asiakirjan arkistonmuodostaja: </xsl:text>
              </span>
              <xsl:value-of select="n1:associatedEntity/n1:id/@root"/>
              <xsl:choose>
                <xsl:when test="n1:associatedEntity/n1:id/@extension">
                  <xsl:text>.</xsl:text>
                  <xsl:value-of select="n1:associatedEntity/n1:id/@extension"/>
                </xsl:when>
              </xsl:choose>
              <br/>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
        <xsl:apply-templates select="n1:custodian"/>
        <xsl:apply-templates select="n1:code"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:patientRegistrySpecifier"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:patientRegistrySpecifierName"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:patientHomeMunicipality"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:activeCustodian"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:activeCustodianName"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:functionCode"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:retentionPeriodClass"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:extendedRetentionPeriod"/>
        <xsl:apply-templates select="n1:title"/>
        <xsl:apply-templates select="n1:languageCode"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:documentType"/>
        <xsl:apply-templates select="n1:confidentialityCode"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:tableOfContents"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:fileFormat"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:sensitiveDocument"/>
        <xsl:for-each select="n1:participant">
          <xsl:choose>
            <xsl:when test="@typeCode = 'SBJ'">
              <span style="font-weight:bold; color:green;">
                <xsl:text>2.2.21.2 Asiakirjan toista henkil�� sis�lt�vien tietojen omistajan henkil�tunnus: </xsl:text>
              </span>
              <xsl:value-of select="n1:associatedEntity/n1:id/@root"/>
              <xsl:choose>
                <xsl:when test="n1:associatedEntity/n1:id/@extension">
                  <xsl:text>.</xsl:text>
                  <xsl:value-of select="n1:associatedEntity/n1:id/@extension"/>
                </xsl:when>
              </xsl:choose>
              <br/>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:releaseDateForPatientViewing"/>
        <!-- Palvelutapahtuman tiedot -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Palvelutapahtuman tiedot</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="n1:componentOf/n1:encompassingEncounter/n1:id"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:secondaryEncompassingEncounterId"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:encompassingEncounterMasterCode"/>
        <xsl:apply-templates select="n1:componentOf/n1:encompassingEncounter/n1:responsibleParty/n1:assignedEntity/n1:representedOrganization"/>
        <!-- Palvelutapahtuman tiedot ensisijaisella asiakirjalla -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Palvelutapahtuman tiedot ensisijaisella asiakirjalla</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="n1:componentOf/n1:encompassingEncounter/n1:effectiveTime"/>
        <xsl:apply-templates select="n1:componentOf/n1:encompassingEncounter/n1:encounterParticipant"/>
        <xsl:apply-templates select="n1:documentationOf"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:encompassingEncounterCode"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:custodianTypeCode"/>
        <xsl:apply-templates select="n1:componentOf/n1:encompassingEncounter/n1:code"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:outsourcingServiceCustomer"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:outsourcingServiceCustomerName"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:eprServiceProvider"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:eprServiceProviderName"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:serviceChainLink"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:episodeLink"/>
        <!-- Ei k�yt�ss� kansallisessa arkistossa -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Ei k�yt�ss� kansallisessa arkistossa</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:currentLocation"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:registratedTime"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:sender"/>
        <!-- Asiakirjan allekirjoitus ja salaus -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Asiakirjan allekirjoitus ja salaus</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:signatureCollection/hl7fi:signature"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:password"/>
        <!-- Muut metatiedot -->
        <span style="font-weight:bold; color:green;">
          <h3>
            <xsl:text>Muut metatiedot</xsl:text>
          </h3>
        </span>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:softwareSupport"/>
        <xsl:apply-templates select="hl7fi:localHeader/hl7fi:product"/>
        <br/>
        <xsl:apply-templates select="n1:component/n1:structuredBody"/>
      </body>
    </html>
  </xsl:template>
  <!-- 01 Asiakirjan aluekoodi -->
  <xsl:template match="n1:ClinicalDocument/n1:realmCode">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.01 Asiakirjan aluekoodi: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 02 Asiakirjan tyyppi -->
  <xsl:template match="n1:ClinicalDocument/n1:typeId">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.02 Asiakirjassa noudatettu teknillinen standardiversio : </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- 03 Asiakirjan m��rittelyt -->
  <xsl:template match="n1:ClinicalDocument/n1:templateId">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.03 Asiakirjassa noudatettu m��ritys: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- 04 Asiakirjan OID-tunnus -->
  <xsl:template match="n1:ClinicalDocument/n1:id">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.04 Asiakirjan tunnus: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- 05 Asiakirjan code -->
  <xsl:template match="n1:ClinicalDocument/n1:code">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.05 Asiakirjan potilasrekisteritunnus: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 06 Asiakirjan title -->
  <xsl:template match="n1:ClinicalDocument/n1:title">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.06 Asiakirjan otsikko: </xsl:text>
      </span>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- 07 effectiveTime -->
  <xsl:template match="n1:effectiveTime">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.07 Asiakirjan luontiaika: </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="."/>
      </xsl:call-template>
      <br/>
    </em>
  </xsl:template>
  <!-- 8. Asiakirjan luottamuksellisuus  pakollinen t�ytet��n aina N -->
  <xsl:template match="n1:confidentialityCode">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.08 Asiakirjan luottamuksellisuus: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 9. Asiakirjan kieli pakollinen-->
  <xsl:template match="n1:languageCode">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.09 Asiakirjan kieli: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 10 Alkuper�isen asiakirjan OID-tunnus -->
  <xsl:template match="n1:setId">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.10 Alkuper�isen asiakirjan tunnus: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- 11 Asiakirjan versio -->
  <xsl:template match="n1:versionNumber">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.11 Asiakirjan versio: </xsl:text>
      </span>
      <xsl:value-of select="@value"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 12 asiakirjan kopiointiaika -->
  <xsl:template match="n1:copyTime">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.12 Asiakirjan kopiointiaika (arkisto t�ytt��): </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="."/>
      </xsl:call-template>
      <br/>
    </em>
  </xsl:template>
  <!-- 13 recordTarget potilaan tiedot -->
  <xsl:template match="n1:recordTarget">
    <em class="class-caption">
      <xsl:for-each select="n1:patientRole/n1:id">
        <span style="font-weight:bold; color:green;">
          <xsl:text>2.2.13.1 Potilaan henkil�tunnus: </xsl:text>
        </span>
        <xsl:value-of select="@root"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="@extension"/>
        <br/>
      </xsl:for-each>
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.13.2 Potilaan nimi: </xsl:text>
      </span>
      <xsl:value-of select="n1:patientRole/n1:patient/n1:name/n1:family"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="n1:patientRole/n1:patient/n1:name/n1:given"/>
      <br/>
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.13.3 Potilaan syntym�aika: </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="n1:patientRole/n1:patient/n1:birthTime"/>
      </xsl:call-template>
      <br/>
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.13.4 Potilaan sukupuoli: </xsl:text>
      </span>
      <xsl:for-each select="n1:patientRole/n1:patient/n1:administrativeGenderCode">
        <xsl:value-of select="@code"/>,&#160;
        <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
        <xsl:value-of select="@codeSystem"/>,&#160;
        <xsl:value-of select="@codeSystemName"/>
      </xsl:for-each>
      <br/>
    </em>
  </xsl:template>
  <!-- 14 author -->
  <xsl:template name="author">
    <xsl:for-each select="n1:author">
    <!-- 14.1 author ID-->
      <xsl:for-each select="n1:assignedAuthor/n1:id">
        <span style="font-weight:bold; color:green;">
          <xsl:text>2.2.14.1 Ammattihenkil�n tunniste: </xsl:text>
        </span>
        <xsl:value-of select="@root"/>
        <xsl:choose>
          <xsl:when test="@extension">
            <xsl:text>.</xsl:text>
            <xsl:value-of select="@extension"/>
          </xsl:when>
        </xsl:choose>
        <br/>
      </xsl:for-each>
      <!-- 14.2 author -->
      <xsl:choose>
        <xsl:when test="n1:assignedAuthor/n1:assignedPerson/n1:name">
          <span style="font-weight:bold; color:green;">
            <xsl:text>2.2.14.2 Ammattihenkil�n nimi: </xsl:text>
          </span>
          <xsl:value-of select="n1:assignedAuthor/n1:assignedPerson/n1:name/n1:suffix"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="n1:assignedAuthor/n1:assignedPerson/n1:name/n1:given"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="n1:assignedAuthor/n1:assignedPerson/n1:name/n1:family"/>
          <br/>
        </xsl:when>
      </xsl:choose>
      <!-- 14.3 author -->
      <xsl:choose>
        <xsl:when test="n1:time">
          <span style="font-weight:bold; color:green;">
            <xsl:text>2.2.14.3 Ammattihenkil�tiedon muodostamisaika: </xsl:text>
          </span>
          <xsl:call-template name="effectivetime">
            <xsl:with-param name="effectivetime" select="n1:time"/>
          </xsl:call-template>
          <br/>
        </xsl:when>
      </xsl:choose>
      <!-- 14.4 author -->
      <xsl:choose>
        <xsl:when test="n1:assignedAuthor/n1:representedOrganization">
          <span style="font-weight:bold; color:green;">
            <xsl:text>2.2.14.4 Ammattihenkil�n palveluyksikk�: </xsl:text>
          </span>
          <xsl:value-of select="n1:assignedAuthor/n1:representedOrganization/n1:id/@root"/>
          <xsl:choose>
            <xsl:when test="n1:assignedAuthor/n1:representedOrganization/n1:id/@extension">
              <xsl:text>.</xsl:text>
              <xsl:value-of select="n1:assignedAuthor/n1:representedOrganization/n1:id/@extension"/>
            </xsl:when>
          </xsl:choose>
          <xsl:text>, </xsl:text>
          <xsl:value-of select="n1:assignedAuthor/n1:representedOrganization/n1:name"/>
          <br/>
        </xsl:when>
      </xsl:choose>
      <!-- 14.5 author -->
      <xsl:choose>
        <xsl:when test="n1:functionCode">
          <span style="font-weight:bold; color:green;">
            <xsl:text>2.2.14.5 Ammattihenkil�n rooli: </xsl:text>
          </span>
          <xsl:value-of select="n1:functionCode/@code"/>,&#160;
          <xsl:value-of select="n1:functionCode/@displayName"/>&#160;-- koodisto:&#160;
          <xsl:value-of select="n1:functionCode/@codeSystem"/>,&#160;
          <xsl:value-of select="n1:functionCode/@codeSystemName"/>
          <br/>
        </xsl:when>
      </xsl:choose>
      <!-- 14.6 author -->
      <xsl:choose>
        <xsl:when test="n1:assignedAuthor/n1:code">
          <span style="font-weight:bold; color:green;">
            <xsl:text>2.2.14.6 Ammattihenkil�n perusluokituskoodi: </xsl:text>
          </span>
          <xsl:value-of select="n1:assignedAuthor/n1:code/@code"/>,&#160;
          <xsl:value-of select="n1:assignedAuthor/n1:code/@displayName"/>&#160;-- koodisto:&#160;
          <xsl:value-of select="n1:assignedAuthor/n1:code/@codeSystem"/>,&#160;
          <xsl:value-of select="n1:assignedAuthor/n1:code/@codeSystemName"/>
          <br/>
        </xsl:when>
      </xsl:choose>
      <!-- 14.7 author -->
      <xsl:for-each select="n1:assignedAuthor/n1:code/n1:translation/n1:qualifier">
          <span style="font-weight:bold; color:green;">
            <xsl:text>2.2.14.7 Ammattihenkil�n lis�luokituskoodi: </xsl:text>
          </span>
        <xsl:if test="n1:name/@code!=0">
                <xsl:value-of select="n1:name/@code"/>,&#160;
        </xsl:if>
        <xsl:if test="n1:name/@displayName!=0">
                <xsl:value-of select="n1:name/@displayName"/>,&#160; -- koodisto:&#160;
        </xsl:if>
        <xsl:if test="n1:name/n1:originalText!=0">
                <xsl:value-of select="n1:name/n1:originalText"/>,&#160;
        </xsl:if>
        <xsl:if test="n1:name/@codeSystem!=0">
                <xsl:value-of select="n1:name/@codeSystem"/>,&#160;
        </xsl:if>
        <xsl:if test="n1:name/@codeSystemName!=0">
        <xsl:value-of select="n1:name/@codeSystemName"/>,&#160;
        </xsl:if>
        <xsl:if test="n1:value/n1:originalText!=0">
        <xsl:value-of select="n1:value/n1:originalText"/>,&#160;
        </xsl:if>
        <xsl:if test="n1:value/@code!=0">
        <xsl:value-of select="n1:value/@code"/>,&#160;
        </xsl:if>
        <xsl:if test="n1:value/@displayName!=0">
        <xsl:value-of select="n1:value/@displayName"/>,&#160; -- koodisto:&#160;
        </xsl:if>
        <xsl:if test="n1:value/@codeSystem!=0">
        <xsl:value-of select="n1:value/@codeSystem"/>,&#160;
        </xsl:if>
        <xsl:if test="n1:value/@codeSystemName!=0">
        <xsl:value-of select="n1:value/@codeSystemName"/>,&#160;
        </xsl:if>
       <br/>
      </xsl:for-each>
      <br/>
    </xsl:for-each>
  </xsl:template>
  <!-- 17 custodian -->
  <xsl:template match="n1:custodian">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.17 Asiakirjan rekisterinpit�j�: </xsl:text>
      </span>
      <xsl:value-of select="n1:assignedCustodian/n1:representedCustodianOrganization/n1:id/@root"/>
      <xsl:choose>
        <xsl:when test="n1:assignedCustodian/n1:representedCustodianOrganization/n1:id/@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="n1:assignedCustodian/n1:representedCustodianOrganization/n1:id/@extension"/>
        </xsl:when>
      </xsl:choose>
      <xsl:text>,&#160;</xsl:text>
      <xsl:value-of select="n1:assignedCustodian/n1:representedCustodianOrganization/n1:name"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 23. Annettu palvelu -->
  <xsl:template match="n1:documentationOf">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.23 Annettu palvelu: </xsl:text>
      </span>
      <xsl:value-of select="n1:serviceEvent/n1:code/@code"/>,&#160;
      <xsl:value-of select="n1:serviceEvent/n1:code/@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="n1:serviceEvent/n1:code/@codeSystem"/>,&#160;
      <xsl:value-of select="n1:serviceEvent/n1:code/@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 24.  Korjattu asiakirja-->
  <xsl:template match="n1:relatedDocument">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.24 Korjattu asiakirja: </xsl:text>
      </span>
      <xsl:text>id: </xsl:text>
      <xsl:value-of select="n1:parentDocument/n1:id/@root"/>
      <xsl:text> setId: </xsl:text>
      <xsl:value-of select="n1:parentDocument/n1:setId/@root"/>
      <xsl:text> versio: </xsl:text>
      <xsl:value-of select="n1:parentDocument/n1:versionNumber/@value"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 26.1 componentOf Palvelutapahtumatunnus -->
  <xsl:template match="n1:componentOf/n1:encompassingEncounter/n1:id">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.26.1 Palvelutapahtumatunnus: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- 26.2componentOf Palvelutapahtumatunnus 2008-12-04-->
  <xsl:template match="n1:componentOf/n1:encompassingEncounter/n1:code">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.26.2 Palvelutapahtumaluokka: poistettu 4.12.2008</xsl:text>
      </span>
      <br/>
    </em>
  </xsl:template>
  <!-- 26.3 componentOf Hoitoaika -->
  <xsl:template match="n1:componentOf/n1:encompassingEncounter/n1:effectiveTime">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.26.3 Palvelutapahtuman kokonaishoitoaika: </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="."/>
      </xsl:call-template>
      <br/>
    </em>
  </xsl:template>
  <!-- 26.4 componentOf Palveluntuottaja 2008-12-04 -->
  <xsl:template match="n1:componentOf/n1:encompassingEncounter/n1:responsibleParty/n1:assignedEntity/n1:representedOrganization">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.26.4 Palveluntuottaja: </xsl:text>
      </span>
      <xsl:value-of select="n1:id/@root"/>
      <xsl:choose>
        <xsl:when test="n1:id/@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="n1:id/@extension"/>
        </xsl:when>
      </xsl:choose>
      <xsl:text>,&#160;</xsl:text>
      <xsl:value-of select="n1:name"/>
      <br/>
    </em>
  </xsl:template>
  <!-- 26.5 componentOf Palvelutapahtumatunnus -->
  <xsl:template match="n1:componentOf/n1:encompassingEncounter/n1:encounterParticipant">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.2.26.5 Palveluyksik�n hoitoaika: </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="n1:time"/>
      </xsl:call-template>
      <span style="font-weight:bold; color:green;">
        <xsl:text> palveluyksikk�: </xsl:text>
      </span>
      <xsl:value-of select="n1:assignedEntity/n1:representedOrganization/n1:name"/>
      <br/>
    </em>
  </xsl:template>
  <!-- Local Header -->
  <!-- FI 1 hl7fi:description - asiakirjan kuvaus -->
  <xsl:template match="hl7fi:localHeader/hl7fi:description">
    <br/>
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.01 Kuvaus: </xsl:text>
      </span>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 2 hl7fi:tableOfContents - asiakirjan sis�llysluettelo -->
  <xsl:template match="hl7fi:localHeader/hl7fi:tableOfContents">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.02 Asiakirjan sis�llysluettelo (n�kym�t): </xsl:text>
      </span>
    </em>
    <xsl:for-each select="hl7fi:contentsCode/@displayName">
      <em class="class-caption">
        <xsl:text>&#160;&#160;</xsl:text>
        <xsl:value-of select="."/>
      </em>
    </xsl:for-each>
    <br/>
  </xsl:template>
  <!-- FI 3 hl7fi:registratedTime - asiakirjan rekiter�intiaika -->
  <xsl:template match="hl7fi:localHeader/hl7fi:registratedTime">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.03 Asiakirjan rekister�intiaika (ei k�yt�ss� kansallisessa arkistossa): </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="."/>
      </xsl:call-template>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 4 hl7fi:declaredTime - asiakirjan arkistointiaika -->
  <xsl:template match="hl7fi:localHeader/hl7fi:declaredTime">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.04 Asiakirjan arkistointiaika (arkisto t�ytt��): </xsl:text>
      </span>
      <xsl:call-template name="date">
        <xsl:with-param name="date" select="@value"/>
      </xsl:call-template>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 5 hl7fi:typeCode - asiakirjan laji -->
  <xsl:template match="hl7fi:localHeader/hl7fi:typeCode">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.05 Asiakirjan laji: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 6 hl7fi:fileFormat - asiakirjan tiedostomuoto -->
  <xsl:template match="hl7fi:localHeader/hl7fi:fileFormat">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.06 Asiakirjan tiedostomuoto: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 7 hl7fi:softwareSupport - asiakirjan esitt�miselle asetetut ohjelmistovaatimukset -->
  <xsl:template match="hl7fi:localHeader/hl7fi:softwareSupport">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.07 Asiakirjan tuottanut ohjelmisto: </xsl:text>
      </span>
      <xsl:choose>
        <xsl:when test="@moderator">
          <xsl:text> toimittaja: </xsl:text>
          <xsl:value-of select="@moderator"/>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="@product">
          <xsl:text> tuote: </xsl:text>
          <xsl:value-of select="@product"/>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="@version">
          <xsl:text> versio: </xsl:text>
          <xsl:value-of select="@version"/>
        </xsl:when>
      </xsl:choose>
      <xsl:text> teksti: </xsl:text>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 8 hl7fi:hasPartOfId - palvelutapahtuman asiakirjatunnus -->
  <xsl:template match="hl7fi:localHeader/hl7fi:hasPart">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.08 Palvelutapahtumatunnus: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 9 hl7fi:documentTypeCode - asiakirjan tyyppi -->
  <xsl:template match="hl7fi:localHeader/hl7fi:documentType">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.09 Asiakirjan tyyppi: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 10 hl7fi:currentLocation - asiakirjan tilap�inen sijoitus -->
  <xsl:template match="hl7fi:localHeader/hl7fi:currentLocation">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.10 Asiakirjan tilap�inen sijoitus (ei k�yt�ss� kansallisessa arkistossa): </xsl:text>
      </span>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 11 hl7fi:retentionPeriodTime - asiakirjan h�vitt�misaika -->
  <xsl:template match="hl7fi:localHeader/hl7fi:retentionPeriod">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.11 Asiakirjan h�vitt�misaika (arkisto t�ytt��): </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="."/>
      </xsl:call-template>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 12 hl7fi:functionCode - asiakirjan teht�v�tunnus (AMS) -->
  <xsl:template match="hl7fi:localHeader/hl7fi:functionCode">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.12 Asiakirjan teht�v�luokka (eAMS): </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 13 hl7fi:recordStatusCode - asiakirjan valmistumisen tila -->
  <xsl:template match="hl7fi:localHeader/hl7fi:recordStatus">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.13 Asiakirjan valmistumisen tila: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 14 hl7fi:auditTrail - asiakirjan k�sittelyhistoria -->
  <xsl:template match="hl7fi:localHeader/hl7fi:auditTrail">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.14 Asiakirjan k�sittelyhistoria muutoslaji: </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:auditTrailCode/@displayName"/>
      <span style="font-weight:bold; color:green;">
        <xsl:text> saika: </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="hl7fi:auditTrailTime"/>
      </xsl:call-template>
      <span style="font-weight:bold; color:green;">
        <xsl:text> objektiv�li: </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:auditTrailId/@root"/>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="hl7fi:auditTrailIdEnd/@root"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 15 hl7fi:serviceChainLink - asiakirjan linkit palveluketjuihin -->
  <xsl:template match="hl7fi:localHeader/hl7fi:serviceChainLink">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.15.1 Palvelutapahtuman palvelukokonaisuustunnus: </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:serviceChainLinkId/@root"/>
      <xsl:choose>
        <xsl:when test="hl7fi:serviceChainLinkId/@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="hl7fi:serviceChainLinkId/@extension"/>
        </xsl:when>
      </xsl:choose>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="hl7fi:serviceChainLinkName"/>
      <br/>
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.15.2 Palvelutapahtuman palvelukokonaisuusluokka: </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:serviceChainLinkCode/@code"/>,&#160;
      <xsl:value-of select="hl7fi:serviceChainLinkCode/@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="hl7fi:serviceChainLinkCode/@codeSystem"/>,&#160;
      <xsl:value-of select="hl7fi:serviceChainLinkCode/@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 16 hl7fi:episodeLink Asiakirjan linkit hoitokokonaisuuksiin -->
  <xsl:template match="hl7fi:localHeader/hl7fi:episodeLink">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.16.1 Palvelutapahtuman palvelun tuottajan oma palvelukokonaisuustunnus: </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:episodeLinkId/@root"/>
      <xsl:choose>
        <xsl:when test="hl7fi:episodeLinkId/@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="hl7fi:episodeLinkId/@extension"/>
        </xsl:when>
      </xsl:choose>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="hl7fi:episodeLinkName"/>
      <br/>
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.16.2 Palvelutapahtuman palvelun tuottajan oma palvelukokonaisuusluokka: </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:episodeLinkCode/@code"/>,&#160;
      <xsl:value-of select="hl7fi:episodeLinkCode/@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="hl7fi:episodeLinkCode/@codeSystem"/>,&#160;
      <xsl:value-of select="hl7fi:episodeLinkCode/@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 17 hl7fi:product - asiakirjan toimittajan alue -->
  <xsl:template match="hl7fi:localHeader/hl7fi:product">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.17 Toimittajan tuotealue: </xsl:text>
      </span>
      <xsl:choose>
        <xsl:when test="@moderator">
          <xsl:text> toimittaja: </xsl:text>
          <xsl:value-of select="@moderator"/>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="@product">
          <xsl:text> tuote: </xsl:text>
          <xsl:value-of select="@product"/>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="@version">
          <xsl:text> versio: </xsl:text>
          <xsl:value-of select="@version"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 18 hl7fi:signatureCollection - asiakirjan s�hk�iset allekirjoitustiedot -->
  <xsl:template match="hl7fi:localHeader/hl7fi:signatureCollection/hl7fi:signature">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.18.1 Asiakirjan s�hk�inen allekirjoitus: </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:signatureDescription/@code"/>,&#160;
      <xsl:value-of select="hl7fi:signatureDescription/@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="hl7fi:signatureDescription/@codeSystem"/>,&#160;
      <xsl:value-of select="hl7fi:signatureDescription/@codeSystemName"/>
      <br/>
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.18.2 Asiakirjan s�hk�isen allekirjoituksen aikaleima: </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:signatureTimestamp"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 19 hl7fi:sender - osapuolitunnus -->
  <xsl:template match="hl7fi:localHeader/hl7fi:sender">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.19 Viestiliikenteen osapuoli (ei k�yt�ss� kansallisessa arkistossa): </xsl:text>
      </span>
      <xsl:value-of select="hl7fi:senderCode/@code"/>,&#160;
      <xsl:value-of select="hl7fi:senderCode/@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="hl7fi:senderCode/@codeSystem"/>,&#160;
      <xsl:value-of select="hl7fi:senderCode/@codeSystemName"/>
      <xsl:value-of select="hl7fi:senderName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 20 hl7fi:password - salasana -->
  <xsl:template match="hl7fi:localHeader/hl7fi:password">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.20 Asiakirjan salasana: </xsl:text>
      </span>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 21 hl7fi:patientRegistrySpecifier - potilasrekisteritarkenne -->
  <xsl:template match="hl7fi:localHeader/hl7fi:patientRegistrySpecifier">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.21.1 Asiakirjan potilasrekisteritarkenne: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 21 hl7fi:patientRegistrySpecifier - potilasrekisteritarkenne -->
  <xsl:template match="hl7fi:localHeader/hl7fi:patientRegistrySpecifierName">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.21.2 Asiakirjan potilasrekisteritarkenteen nimi: </xsl:text>
      </span>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 22 hl7fi:custodianTypeCode - Rekisteripit�j�n laji -->
  <xsl:template match="hl7fi:localHeader/hl7fi:custodianTypeCode">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.22 Rekisteripit�j�n laji: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 23 hl7fi:encompassingEncounterCode - Sis�lt��k� palvelutapahtuma osastohoitoa 2008-12-04 -->
  <xsl:template match="hl7fi:encompassingEncounterCode">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.23 Palvelutapahtuman laji: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 24 hl7fi:activeCustodian  - Aktiivi rekisterinpit�j� -->
  <xsl:template match="hl7fi:localHeader/hl7fi:activeCustodian">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.24.1 Asiakirjan aktiivi rekisterinpit�j� (arkisto t�ytt��): </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 24 hl7fi:activeCustodian  - Aktiivi rekisterinpit�j� -->
  <xsl:template match="hl7fi:localHeader/hl7fi:activeCustodianName">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.24.2 Asiakirjan aktiivi rekisterinpit�j�n nimi (arkisto t�ytt��): </xsl:text>
      </span>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 25 hl7fi:sender - Palvelutapahtuman ensisijaisuus -->
  <xsl:template match="hl7fi:localHeader/hl7fi:encompassingEncounterMasterCode">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.25 Palvelutapahtumatietojen ensisijaisuus asiakirjassa: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 26 hl7fi:secondaryEncompassingEncounterId - Toissijainen palvelutapahtumatunnus -->
  <xsl:template match="hl7fi:localHeader/hl7fi:secondaryEncompassingEncounterId">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.26 Toissijainen palvelutapahtumatunnus: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 27 hl7fi:outsourcingServiceCustomer - Palvelunj�rjest�j� 2008-12-04 -->
  <xsl:template match="hl7fi:localHeader/hl7fi:outsourcingServiceCustomer">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.27.1 Palvelunj�rjest�j�: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 27 hl7fi:outsourcingServiceCustomer - Palvelunj�rjest�j�n nimi 2008-12-04 -->
  <xsl:template match="hl7fi:localHeader/hl7fi:outsourcingServiceCustomerName">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.27.2 Palvelunj�rjest�j�n nimi: </xsl:text>
      </span>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 28 hl7fi:retentionPeriodClass - Asiakirjan s�ilytysaikaluokka -->
  <xsl:template match="hl7fi:localHeader/hl7fi:retentionPeriodClass">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.28 Asiakirjan s�ilytysaikaluokka: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 29 hl7fi:extendedRetentionPeriod - Asiakirjan pidennetty s�ilytysaika -->
  <xsl:template match="hl7fi:localHeader/hl7fi:extendedRetentionPeriod">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.29 Asiakirjan pidennetty s�ilytysaika: </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="."/>
      </xsl:call-template>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 30 hl7fi:sensitiveDocoment - Asiakirjan erityissis�lt� -->
  <xsl:template match="hl7fi:localHeader/hl7fi:sensitiveDocument">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.30 Asiakirjan erityissis�lt�: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 31 hl7fi:eprServiceProvider - J�rjestelm�palvelujen antaja -->
  <xsl:template match="hl7fi:localHeader/hl7fi:eprServiceProvider">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.31.1 J�rjestelm�palvelujen antaja: </xsl:text>
      </span>
      <xsl:value-of select="@root"/>
      <xsl:choose>
        <xsl:when test="@extension">
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@extension"/>
        </xsl:when>
      </xsl:choose>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 31 hl7fi:eprServiceProvider - J�rjestelm�palvelujen antaja -->
  <xsl:template match="hl7fi:localHeader/hl7fi:eprServiceProviderName">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.31.2 J�rjestelm�palvelujen antajan nimi: </xsl:text>
      </span>
      <xsl:value-of select="."/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 32 hl7fi:releaseDateForPatientViewing - Kansalaisen katseltavissa oleva asiakirja ajankohdasta lukien -->
  <xsl:template match="hl7fi:releaseDateForPatientViewing">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.32 Kansalaisen katseltavissa oleva asiakirja ajankohdasta lukien: </xsl:text>
      </span>
      <xsl:call-template name="effectivetime">
        <xsl:with-param name="effectivetime" select="."/>
      </xsl:call-template>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 33 hl7fi:yyy _ potilaan kotikunta 2008-12-04 -->
  <xsl:template match="hl7fi:patientHomeMunicipality">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.33	Potilaan kotikunta: </xsl:text>
      </span>
      <xsl:value-of select="@code"/>,&#160;
      <xsl:value-of select="@displayName"/>&#160;-- koodisto:&#160;
      <xsl:value-of select="@codeSystem"/>,&#160;
      <xsl:value-of select="@codeSystemName"/>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 33 hl7fi:xxx -  2.4.33	hl7fi:xxx _ arkistonmuodostaja 2008-12-04 -->
  <xsl:template match="hl7fi:xxx">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.33	Arkistonmuodostaja: </xsl:text>
      </span>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 34 hl7fi:yyy _ potilaan kotikunta 2008-12-04 -->
  <xsl:template match="hl7fi:yyy">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.34	Potilaan kotikunta: </xsl:text>
      </span>
      <br/>
    </em>
  </xsl:template>
  <!-- FI 35 hl7fi:zzz -  Asiakrjan toista henkil�� sis�lt�vien tietojen omistajan henkil�tunnus 2008-12-04 -->
  <xsl:template match="hl7fi:zzz">
    <em class="class-caption">
      <span style="font-weight:bold; color:green;">
        <xsl:text>2.4.35 Asiakrjan toista henkil�� sis�lt�vien tietojen omistajan henkil�tunnus: </xsl:text>
      </span>
      <br/>
    </em>
  </xsl:template>
  <!-- StructuredBody -->
  <xsl:template match="n1:component/n1:structuredBody">
    <xsl:apply-templates select="n1:component/n1:section"/>
  </xsl:template>
  <!-- Component/Section -->
  <xsl:template match="n1:component/n1:section">
    <xsl:apply-templates select="n1:title"/>
    <ul>
      <xsl:apply-templates select="n1:text"/>
      <xsl:apply-templates select="n1:component/n1:section"/>
    </ul>
  </xsl:template>
  <!--   Title  -->
  <xsl:template match="n1:title">
    <span style="font-weight:bold; color:green;">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>
  <!--   Text   -->
  <xsl:template match="n1:text">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="n1:br">
    <br/>
  </xsl:template>
  <!--   paragraph  -->
  <xsl:template match="n1:paragraph">
    <xsl:apply-templates/>
    <br/>
  </xsl:template>
  <!--   content  -->
  <xsl:template match="n1:content">
    <xsl:choose>
      <xsl:when test='@revised="delete"'>
        <em class="class-delete">
          <xsl:apply-templates/>
        </em>
      </xsl:when>
      <xsl:when test='@revised="insert"'>
        <em class="class-insert">
          <xsl:apply-templates/>
        </em>
      </xsl:when>
      <xsl:when test='@revised="Bold"'>
        <em class="class-bold">
          <xsl:apply-templates/>
        </em>
      </xsl:when>
      <xsl:when test='@revised="Underline"'>
        <em class="class-underline">
          <xsl:apply-templates/>
        </em>
      </xsl:when>
      <xsl:when test='@revised="Italics"'>
        <em class="class-italics">
          <xsl:apply-templates/>
        </em>
      </xsl:when>
      <xsl:when test='@revised="Emphasis"'>
        <em class="class-emphasis">
          <xsl:apply-templates/>
        </em>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!--   list  -->
  <xsl:template match="n1:list">		<!--   listan otsikko  -->
    <xsl:if test="n1:caption">
      <span style="font-weight:bold; ">
        <xsl:apply-templates select="n1:caption"/>
      </span>
    </xsl:if>
    <!-- Jokainen listan alkio -->
    <xsl:for-each select="n1:item">
      <li>				<!-- Lista-alkion elementti-->
        <xsl:apply-templates/>
      </li>
    </xsl:for-each>
  </xsl:template>
  <!--   caption  -->
  <xsl:template match="n1:caption">
    <xsl:apply-templates/>
    <xsl:text>: </xsl:text>
  </xsl:template>
  <!--      Tables	 Koko alipuu kopioidaan sellaisenaan.	 CAPTION elementin lapset k�sitell��n mahdollisilla muilla templateilla  -->
  <xsl:template match="n1:table|n1:table/n1:caption|n1:thead|n1:tfoot|n1:tbody|n1:colgroup|n1:col|n1:tr|n1:th|n1:td">
    <xsl:copy>
      <xsl:apply-templates select="*|@*|text()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="n1:table/@*|n1:thead/@*|n1:tfoot/@*|n1:tbody/@*|n1:colgroup/@*|n1:col/@*|n1:tr/@*|n1:th/@*|n1:td/@*">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="n1:table/n1:caption">
    <span style="font-weight:bold; ">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <!-- Nimen tulostaminen -->
  <xsl:template name="getName">
    <xsl:apply-templates select="n1:name"/>
  </xsl:template>
  <!-- P�iv�m��r�n ja kellonajan tai -v�lien muotoilu ulkoasuun pp.kk.vvvv klo hh:mm:ss 2008-09-25 -->
  <xsl:template name="effectivetime">
    <xsl:param name="effectivetime"/>
    <xsl:choose>			<!-- p�iv�m��r� -->
      <xsl:when test="$effectivetime/@value">
        <xsl:call-template name="datesingle">
          <xsl:with-param name="pdatesingle" select="$effectivetime/@value"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>				<!-- p�iv�m��r� -->
        <xsl:choose>
          <xsl:when test="$effectivetime/n1:low/@value">
            <xsl:call-template name="datesingle">
              <xsl:with-param name="pdatesingle" select="$effectivetime/n1:low/@value"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
        <xsl:text> - </xsl:text>
        <xsl:choose>
          <xsl:when test="$effectivetime/n1:high/@value">
            <xsl:call-template name="datesingle">
              <xsl:with-param name="pdatesingle" select="$effectivetime/n1:high/@value"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- P�iv�m��r�n ja kellonajan tai -v�lien muotoilu ulkoasuun pp.kk.vvvv klo hh:mm:ss -->
  <xsl:template name="date">
    <xsl:param name="date"/>
    <xsl:choose>			<!-- p�iv�m��r�v�li -->
      <xsl:when test="contains($date,'..')">
        <xsl:call-template name="datesingle">
          <xsl:with-param name="pdatesingle" select="substring-before ($date,'..')"/>
        </xsl:call-template>
        <xsl:text> - </xsl:text>
        <xsl:call-template name="datesingle">
          <xsl:with-param name="pdatesingle" select="substring-after ($date,'..')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>				<!-- p�iv�m��r� -->
        <xsl:call-template name="datesingle">
          <xsl:with-param name="pdatesingle" select="$date"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="datesingle">
    <xsl:param name="pdatesingle"/>
    <!-- pp-->
    <xsl:if test='substring ($pdatesingle, 7, 2)!=""'>
      <xsl:value-of select="format-number(substring ($pdatesingle,7, 2),0)"/>
      <xsl:text>.</xsl:text>
    </xsl:if>
    <!-- kk-->
    <xsl:if test='substring ($pdatesingle, 5, 2)!=""'>
      <xsl:value-of select="format-number(substring ($pdatesingle,5, 2),0)"/>
      <xsl:text>.</xsl:text>
    </xsl:if>
    <!-- vvvv-->
    <xsl:value-of select="substring ($pdatesingle, 1, 4)"/>
    <xsl:text/>
    <xsl:if test='substring ($pdatesingle, 9, 2)!=""'>
      <xsl:text> klo </xsl:text>
      <!-- hh-->
      <xsl:value-of select="substring ($pdatesingle,9, 2)"/>
    </xsl:if>
    <!-- mm -->
    <xsl:if test='substring ($pdatesingle, 11, 2)!=""'>
      <xsl:text>:</xsl:text>
      <xsl:value-of select="substring ($pdatesingle,11, 2)"/>
    </xsl:if>
    <!-- ss -->
    <xsl:if test='substring ($pdatesingle, 13, 2)!=""'>
      <xsl:text>:</xsl:text>
      <xsl:value-of select="substring ($pdatesingle,13, 2)"/>
    </xsl:if>
  </xsl:template>
  <!-- 	Stylecode processing   	  Supports Bold, Underline and Italics display-->
  <xsl:template match="//n1:*[@styleCode]">
  <!-- lis�tty 2009-05-25-->
    <xsl:if test="@styleCode='xUnstructured'">
    <!--xsl:element name="b"-->
      <xsl:apply-templates/>
      <!--/xsl:element-->		</xsl:if>
    <xsl:if test="@styleCode='Bold'">
      <xsl:element name="b">
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@styleCode='Italics'">
      <xsl:element name="i">
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@styleCode='Underline'">
      <xsl:element name="u">
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Italics') and not (contains(@styleCode, 'Underline'))">
      <xsl:element name="b">
        <xsl:element name="i">
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Italics'))">
      <xsl:element name="b">
        <xsl:element name="u">
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Bold'))">
      <xsl:element name="i">
        <xsl:element name="u">
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and contains(@styleCode, 'Bold')">
      <xsl:element name="b">
        <xsl:element name="i">
          <xsl:element name="u">
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  <!-- 	Superscript or Subscript   -->
  <xsl:template match="n1:sup">
    <xsl:element name="sup">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="n1:sub">
    <xsl:element name="sub">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <!--   RenderMultiMedia renderMultiMedia.referencedObject -attribuutista poimitaan xml-ID viittaus vastaavaan rakenteisessa muodossa olevaan observationMedia-elementtiin ja laitetaan se apumuuttujaan imageRef -->
  <xsl:template match="n1:renderMultiMedia">
    <xsl:variable name="imageRef" select="@referencedObject"/>
    <!-- Haetaan xml-ID:n avulla vastaava observationMedia -->
    <xsl:if test="//n1:observationMedia[@ID=$imageRef]">			<!-- Tulostetaan linkki kuvaan -->			<!-- a-elementin href-attribuuttiin laitetaan kuvan osoite ja nimi, t�ss� tapauksessa esim. linkki -->
      <xsl:element name="a">
				<!-- Oletetaan, kaikki kuvat ovat saatavilla samasta palvelusta riippumatta OID root-arvosta -->				<!-- Oletetaan, ett� kuva on tiedostossa, jonka nimi = extension-attribuutin arvo -->
        <xsl:attribute name="href">
          <xsl:text>http://193.185.85.122/csp/cdar2/displayImage.csp?acNumber=</xsl:text>
          <xsl:value-of select="//n1:observationMedia[@ID=$imageRef]/n1:id/@extension"/>
        </xsl:attribute>
        <!-- Jokin teksti, jota klikkaamalla selain aktivoi haun linkill� -->
        <xsl:text> Katso</xsl:text>
      </xsl:element>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>








