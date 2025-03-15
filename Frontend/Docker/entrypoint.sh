#!/bin/sh

# Falls es eine package.json gibt, installiere alle Module
if [ -f package.json ]; then
    echo "Installiere Abhängigkeiten..."
    npm install
fi

# Falls zusätzliche Angular-Module installiert werden sollen:
if [ -n "$ANGULAR_MODULES" ]; then
    echo "Installiere zusätzliche Angular-Module: $ANGULAR_MODULES"
    npm install $ANGULAR_MODULES
fi

# Angular App starten (falls vorhanden)
if [ -d src ]; then
    echo "Starte Angular Entwicklung..."
    ng serve --host 0.0.0.0 --poll 2000
else
    echo "Kein Angular-Projekt gefunden. Container läuft im Leerlauf."
    tail -f /dev/null
fi

