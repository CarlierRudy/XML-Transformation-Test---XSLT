<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
    <title>Gestion Scolaire - Lycée Victor Hugo</title>
    <style>
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            margin: 0; 
            padding: 0; 
            background-color: #f5f5f5; 
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header { 
            background: linear-gradient(135deg, #2c3e50, #34495e);
            color: white; 
            padding: 30px 0;
            text-align: center;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .header h1 {
            margin: 0;
            font-size: 2.5em;
        }
        .header p {
            margin: 10px 0 0 0;
            font-size: 1.2em;
            opacity: 0.9;
        }
        .section {
            background: white;
            padding: 25px;
            margin-bottom: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .section h2 {
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
            margin-top: 0;
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin: 20px 0;
            font-size: 14px;
        }
        th, td { 
            border: 1px solid #ddd; 
            padding: 12px 15px; 
            text-align: left; 
        }
        th { 
            background-color: #3498db; 
            color: white; 
            font-weight: 600;
            position: sticky;
            top: 0;
        }
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        tr:hover {
            background-color: #e8f4f8;
            transition: background-color 0.3s;
        }
        .excellent { 
            background-color: #d4edda !important; 
        }
        .bon { 
            background-color: #fff3cd !important; 
        }
        .a-ameliorer { 
            background-color: #f8d7da !important; 
        }
        .moyenne { 
            font-weight: bold; 
            color: #2c3e50; 
            font-size: 1.1em;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin: 20px 0;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-left: 4px solid #3498db;
        }
        .stat-number {
            font-size: 2em;
            font-weight: bold;
            color: #2c3e50;
        }
        .stat-label {
            color: #7f8c8d;
            margin-top: 5px;
        }
        .badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.8em;
            font-weight: bold;
        }
        .badge-excellent { background: #28a745; color: white; }
        .badge-bon { background: #ffc107; color: #212529; }
        .badge-normal { background: #dc3545; color: white; }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            table {
                font-size: 12px;
            }
            th, td {
                padding: 8px 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🏫 <xsl:value-of select="ecole/@nom"/></h1>
            <p>Système de Gestion Scolaire - Année 2024</p>
        </div>
        
        <!-- Statistiques générales -->
        <div class="stats">
            <div class="stat-card">
                <div class="stat-number"><xsl:value-of select="count(ecole/eleves/eleve)"/></div>
                <div class="stat-label">Élèves</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><xsl:value-of select="count(ecole/professeurs/professeur)"/></div>
                <div class="stat-label">Professeurs</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><xsl:value-of select="count(//matiere)"/></div>
                <div class="stat-label">Matières enseignées</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><xsl:value-of select="count(//note)"/></div>
                <div class="stat-label">Notes enregistrées</div>
            </div>
        </div>
        
        <xsl:apply-templates select="ecole/eleves"/>
        
        <xsl:if test="ecole/professeurs">
            <xsl:apply-templates select="ecole/professeurs"/>
        </xsl:if>
    </div>
</body>
</html>
</xsl:template>

<!-- Template pour la liste des élèves -->
<xsl:template match="eleves">
    <div class="section">
        <h2>👨‍🎓 Liste des Élèves (<xsl:value-of select="count(eleve)"/> élève(s))</h2>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Date de Naissance</th>
                    <th>Classe</th>
                    <th>Moyenne Générale</th>
                    <th>Statut</th>
                    <th>Détails</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="eleve">
                    <xsl:sort select="informations/nom"/>
                </xsl:apply-templates>
            </tbody>
        </table>
    </div>
</xsl:template>

<!-- Template pour chaque élève -->
<xsl:template match="eleve">
    <xsl:variable name="moyenneGenerale">
        <xsl:call-template name="calculer-moyenne-generale"/>
    </xsl:variable>
    
    <xsl:variable name="statut">
        <xsl:choose>
            <xsl:when test="$moyenneGenerale >= 15">excellent</xsl:when>
            <xsl:when test="$moyenneGenerale >= 10">bon</xsl:when>
            <xsl:otherwise>a-ameliorer</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="badgeClass">
        <xsl:choose>
            <xsl:when test="$moyenneGenerale >= 15">badge-excellent</xsl:when>
            <xsl:when test="$moyenneGenerale >= 10">badge-bon</xsl:when>
            <xsl:otherwise>badge-normal</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <tr class="{$statut}">
        <td><strong><xsl:value-of select="@id"/></strong></td>
        <td><xsl:value-of select="informations/nom"/></td>
        <td><xsl:value-of select="informations/prenom"/></td>
        <td><xsl:value-of select="informations/date_naissance"/></td>
        <td><xsl:value-of select="informations/classe"/></td>
        <td class="moyenne">
            <xsl:value-of select="format-number($moyenneGenerale, '0.00')"/>
        </td>
        <td>
            <span class="badge {$badgeClass}">
                <xsl:choose>
                    <xsl:when test="$moyenneGenerale >= 15">Excellent</xsl:when>
                    <xsl:when test="$moyenneGenerale >= 10">Bon</xsl:when>
                    <xsl:otherwise>À améliorer</xsl:otherwise>
                </xsl:choose>
            </span>
        </td>
        <td>
            <button onclick="afficherNotes('{@id}')" style="padding: 5px 10px; cursor: pointer;">📊 Voir notes</button>
        </td>
    </tr>
</xsl:template>

<!-- Template pour la liste des professeurs -->
<xsl:template match="professeurs">
    <div class="section">
        <h2>👨‍🏫 Équipe Pédagogique (<xsl:value-of select="count(professeur)"/> professeur(s))</h2>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Matière</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="professeur">
                    <xsl:sort select="nom"/>
                </xsl:apply-templates>
            </tbody>
        </table>
    </div>
</xsl:template>

<!-- Template pour chaque professeur -->
<xsl:template match="professeur">
    <tr>
        <td><strong><xsl:value-of select="@id"/></strong></td>
        <td><xsl:value-of select="nom"/></td>
        <td><xsl:value-of select="prenom"/></td>
        <td><xsl:value-of select="matiere"/></td>
    </tr>
</xsl:template>

<!-- Template nommé pour calculer la moyenne générale pondérée -->
<xsl:template name="calculer-moyenne-generale">
    <xsl:variable name="totalPondere">
        <xsl:call-template name="calculer-total-pondere"/>
    </xsl:variable>
    <xsl:variable name="totalCoefficients">
        <xsl:call-template name="calculer-total-coefficients"/>
    </xsl:variable>
    <xsl:value-of select="$totalPondere div $totalCoefficients"/>
</xsl:template>

<!-- Template pour calculer le total pondéré -->
<xsl:template name="calculer-total-pondere">
    <xsl:variable name="total" select="0"/>
    <xsl:for-each select="notes/matiere">
        <xsl:variable name="moyenneMatiere" select="sum(note) div count(note)"/>
        <xsl:variable name="coefficient" select="@coefficient"/>
        <xsl:value-of select="$total + ($moyenneMatiere * $coefficient)"/>
    </xsl:for-each>
</xsl:template>

<!-- Template pour calculer le total des coefficients -->
<xsl:template name="calculer-total-coefficients">
    <xsl:value-of select="sum(notes/matiere/@coefficient)"/>
</xsl:template>

</xsl:stylesheet>