<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="M1.dtd"/>
  <xsl:template match="/">
          <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
          <link type="text/css" rel="stylesheet" href="etudiant.css"/></head>
              <body>
        <h1 align="center">Delibiration finel</h1>
  <table border="3" align="center" >
  <tr>
  <th>Matricule</th>
  <th>Nom</th> 
  <th>Prenom</th> 
  <th>Moy S1</th>
  <th>Moy S2</th>
  <th>Moyenne Annuelle</th>
  <th>Credit S1</th>
  <th>Credit S2</th>
   <th>Unite</th>
  </tr>
  <xsl:for-each select="Moy/etudiant"> 
  <xsl:sort select='Moy/MoyAnnuel' order="descending" data-type="number"/>
  <tr> 
      <td><xsl:value-of select="Identite/Matricule"/></td> 
      <td><xsl:value-of select="Identite/Nom"/></td> 
      <td><xsl:value-of select="Identite/Prenom"/></td> 
      <td><xsl:value-of select="Moy/MoyS1"/></td> 
      <td><xsl:value-of select="Moy/MoyS2"/></td> 
      <td><xsl:value-of select="Moy/MoyAnnuel"/></td> 
      <td><xsl:value-of select="Moy/CreditS1"/></td> 
      <td><xsl:value-of select="Moy/CreditS2"/></td>
      <td><xsl:value-of select="Moy/Unite"/></td>
  </tr>
  </xsl:for-each>
  </table>
  <div >
    <h3>le nombre des etudiants total est : <xsl:value-of select="count(M1/etudiant)"/> </h3>
   <h3>le nombre des etudiants Admet est : <xsl:value-of select="count(M1/etudiantMoy/MoyS1 >= 10 and Moy/MoyS2 >= 10])"/> </h3>
   <h3>le nombre des etudiant Admet Avec dette est : <xsl:value-of select="count(M1/etudiant[(Moy/CreditS1 + Moy/CreditS2) >= 45 and Moy/Unite = 'Oui'])-10"/> </h3>
   <h3>le nombre des etudiant ajourner est : <xsl:value-of select="count(M1/etudiant[ 45 > (Moy/CreditS1 + Moy/CreditS2) ])"/> </h3>
   <h3 >Moyenne de la Classe: <xsl:value-of select="sum(M1/etudiant/MoyAnnuel)" /></h3>
   </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>