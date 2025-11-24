#  Serveur XML/XSLT - Transformation de Fichiers

##  Description

Ce projet démontre la transformation XSLT de fichiers XML en documents HTML formatés via un serveur Python local. Parfait pour tester et visualiser des transformations XSLT dans un environnement contrôlé.

##  Prérequis

- **Python 3.6+** installé sur votre machine
- Navigateur web moderne (Chrome, Firefox, Edge)

##  Structure des Fichiers
```bash
projet-xml/
├── ecole.xml # Fichier XML source avec données scolaires
├── gestion-scolaire.xsl # Feuille de style XSLT pour la transformation
├── server.py # Serveur Python personnalisé
└── README.md # Ce fichier d'instructions
```

##  Installation et Exécution

### 1. Téléchargement des Fichiers

Assurez-vous d'avoir tous les fichiers dans le même dossier :
- `ecole.xml`
- `gestion-scolaire.xsl` 
- `server.py`

### 2. Lancement du Serveur

**Ouvrez un terminal/CMD dans le dossier du projet et exécutez :**

```bash
python server.py
```
##Resultat attendu:
============================================================
🚀 Serveur XML/XSLT démarré!
📂 Dossier: /chemin/vers/votre/dossier
🌐 Adresse: http://localhost:8000/ecole.xml
============================================================
📋 Fichiers disponibles:
   • http://localhost:8000/ecole.xml
   • http://localhost:8000/gestion-scolaire.xsl
============================================================
🛑 Pour arrêter le serveur: Ctrl+C

En suite ouvrez : http://localhost:8000/ecole.xml
