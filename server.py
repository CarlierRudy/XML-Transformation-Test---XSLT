import http.server
import socketserver
import webbrowser
import os

class CORSHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET')
        self.send_header('Cache-Control', 'no-cache, no-store, must-revalidate')
        super().end_headers()

def start_server():
    PORT = 8000
    
    # Changer le répertoire de travail vers le dossier du script
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    with socketserver.TCPServer(("", PORT), CORSHTTPRequestHandler) as httpd:
        print("=" * 60)
        print(f"🚀 Serveur XML/XSLT démarré!")
        print(f"📂 Dossier: {os.getcwd()}")
        print(f"🌐 Adresse: http://localhost:{PORT}/ecole.xml")
        print("=" * 60)
        print("📋 Fichiers disponibles:")
        for file in os.listdir('.'):
            if file.endswith(('.xml', '.xsl', '.html')):
                print(f"   • http://localhost:{PORT}/{file}")
        print("=" * 60)
        print("🛑 Pour arrêter le serveur: Ctrl+C")
        
        # Ouvrir automatiquement le navigateur
        webbrowser.open(f'http://localhost:{PORT}/ecole.xml')
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n🛑 Serveur arrêté.")

if __name__ == "__main__":
    start_server()