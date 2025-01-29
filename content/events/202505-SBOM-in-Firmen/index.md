---
kind: event
startdate: 2025-05-08T19:30:00Z
duration: 2h
title: "SBOM in Firmen - warum man über seine Abhängigkeiten bescheid wissen sollte"
speakers:
  -
    name: "David Schumm"
    name: "Aoileann Nic Chraith"
    name: "Christian Wege"
location:
  location: bib
public: true
---
In Firmen ist SBOM das neue Schreckenswort, das Entwicklern allerdings
seit Ewigkeiten bekannt ist, wenn auch nicht unter dieser Beschreibung.
Der "Software Bill of Material" beschreibt die Abhängigkeit einer Anwendung
von Bibliotheken oder anderen Programmen und deren Abhängigkeiten von Bibliotheken
oder Anwendungen. Das Ziel dabei ist als Betreiber einer Anwendung zu wissen, welche 
Schwachstellen die Anwendung haben kann. Um dieses einschätzen zu können muss man aber
die Abhängigkeiten einer Software kennen - und heutige Software hat oft Dutzende, wenn
nicht hunderte von Abhängigkeiten. Das beginnt bei den eingebundenen Libraries zur Text-
oder Grafikausgabe, geht über Bibliotheken für mathematische Operationen bis hin
zu Software zum Erstellen von PDF-Dateien.

Firmen ist diese Abhängigkeit Im Dezember 2021 sehr klar geworden, als eine Lücke
in einer zentralen Log-Bibliothek gefunden wurde ("log4j") und viele Hersteller
dann prüfen mussten ob sie von dieser Schwachstelle betroffen sind. Und viele Firmen
mussten auch intern klären ob sie von dieser Schwachstelle betroffen sein könnten.

Eine Softwarestückliste listet alle Komponenten und Abhängigkeiten 
einer Softwareanwendung vollständig auf. Sie fördert die 
Transparenz und Nachvollziehbarkeit in der Softwareentwicklung, 
indem sie Herkunft und Versionen von Softwarekomponenten aufzeigt. 
Diese vollständige Auflistung aller FOSS-Komponenten 
ermöglicht die Einhaltung der Bedingungen aller verbauten FOSS-Lizenzen.
