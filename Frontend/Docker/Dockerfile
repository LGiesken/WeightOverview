# Basis-Image mit Node.js und Angular CLI
FROM node:20-alpine

# Arbeitsverzeichnis im Container
WORKDIR /app

# Angular CLI und HTTP-Server installieren
RUN npm install -g @angular/cli http-server

# Package-Dateien kopieren (falls vorhanden)
COPY Code/package.json Code/package-lock.json ./
RUN npm install || echo "Keine package.json gefunden, überspringe npm install."

# Quellcode in den Container kopieren
COPY Code/ .

# Sicherstellen, dass entrypoint.sh ausführbar ist
COPY Docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Container starten
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

