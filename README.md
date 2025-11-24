# XML-Transformation-Test---XSL
Ce dépôt contient un projet dédié aux tests de transformation XSL. Il inclut des fichiers XML et XSL, ainsi qu'un fichier server.py pour lancer un server en local afin d'exécuter des transformations et voir le résultat. 

# Serveur XML/XSLT - Transformation de Fichiers
📋 Description
Ce projet démontre la transformation XSLT de fichiers XML en documents HTML formatés via un serveur Python local. Parfait pour tester et visualiser des transformations XSLT dans un environnement contrôlé.

🛠️ Prérequis
Python 3.6+ installé sur votre machine

Navigateur web moderne (Chrome, Firefox, Edge)

📁 Structure des Fichiers
text
projet-xml/
├── 📄 ecole.xml              # Fichier XML source avec données scolaires
├── 🎨 gestion-scolaire.xsl    # Feuille de style XSLT pour la transformation
├── ⚙️ server.py               # Serveur Python personnalisé (ce fichier)
└── 📖 README.md              # Ce fichier d'instructions
🚀 Installation et Exécution
1. Téléchargement des Fichiers
Assurez-vous d'avoir tous les fichiers dans le même dossier :

ecole.xml

gestion-scolaire.xsl

server.py

2. Lancement du Serveur
Ouvrez un terminal/CMD dans le dossier du projet et exécutez :

bash
python server.py
3. Résultat Attendu
Après exécution, vous devriez voir :

text
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
Le navigateur s'ouvrira automatiquement sur la page transformée !

🌐 Accès Manuel
Si le navigateur ne s'ouvre pas automatiquement, visitez :

Fichier principal : http://localhost:8000/ecole.xml

Feuille de style : http://localhost:8000/gestion-scolaire.xsl

✨ Fonctionnalités du Serveur
🔄 Transformation XSLT Automatique
Transforme le XML en HTML via la feuille de style XSLT

Applique les templates et règles de transformation

Génère une interface web stylisée

🎯 Ouverture Automatique
Ouvre directement le fichier transformé dans le navigateur

Gain de temps pour le développement et les tests

📊 Informations Détaillées
Affiche le dossier de travail actuel

Liste tous les fichiers XML/XSL disponibles

Donne les URLs directes d'accès

🔧 Compatibilité Améliorée
Headers CORS pour éviter les problèmes de sécurité

Gestion propre des interruptions (Ctrl+C)

🛠️ Commandes Utiles
Arrêter le serveur :
bash
Ctrl + C
Redémarrer sur un autre port :
bash
python server.py  # Utilise le port 8000 par défaut
Vérifier que le serveur fonctionne :
Ouvrez http://localhost:8000/ dans votre navigateur.

📖 Comment Ça Marche ?
Le serveur Python crée un serveur HTTP local sur le port 8000

Quand vous accédez à ecole.xml, le navigateur détecte la directive <?xml-stylesheet?>

Le navigateur télécharge gestion-scolaire.xsl et l'applique au XML

Le résultat est une page HTML complète et stylisée

🔍 Dépannage
❌ "Python n'est pas reconnu"
Vérifiez que Python est installé : python --version

Sur certains systèmes, utilisez python3 au lieu de python

❌ "Port 8000 déjà utilisé"
Le script utilisera le port 8000 par défaut

Si occupé, modifiez la variable PORT dans server.py

❌ "Fichier non trouvé"
Assurez-vous que tous les fichiers sont dans le même dossier

Vérifiez les noms de fichiers (respectez la casse)

❌ "Transformation XSLT échoue"
Vérifiez la syntaxe XML et XSLT

Consultez la console du navigateur (F12) pour les erreurs

📝 Personnalisation
Changer le port :
Modifiez la ligne dans server.py :

python
PORT = 8080  # Au lieu de 8000
Ajouter d'autres fichiers :
Placez simplement vos fichiers .xml et .xsl dans le même dossier.

🎯 Cas d'Usage
Développement XSLT : Test rapide des transformations

Enseignement : Démonstration visuelle des transformations XML

Prototypage : Validation de structures XML complexes

Debugging : Identification des erreurs de transformation

📞 Support
Si vous rencontrez des problèmes :

Vérifiez que Python est correctement installé

Confirmez que tous les fichiers sont dans le même dossier

Essayez d'ouvrir manuellement http://localhost:8000/ecole.xml

📄 Licence
Ce projet est fourni à des fins éducatives. Libre utilisation et modification.
