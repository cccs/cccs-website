---
kind: event
startdate: 2019-04-11T19:30:00Z
duration: 2h
title: "Sprachbau, DSLs und Verifikationstools"
speakers:
  -
    name: "Markus Völter"
location:
  location: bib
public: true
---
Sprachen sind seit jeher das Rückgrat des Software Engineering:
Programmiersprachen, Modellierungssprachen, Spezifikationssprachen.

Sprachen sind nützlich, da sie es den Entwicklern erlauben, bestimmte
Problemstellungen oder Lösungsalgorithmen möglichst gut auszudrücken.
"Gut" kann bedeuten: möglichst kompakt, möglichst leicht lesbar,
zugänglich für Nicht-Programmierer in interdisziplinären Kontexten, oder
geeignet für bestimmte (semi-)formale Analysealgorithmen. Leicht
vereinfachend kann man sagen: je breiter das Anwendungsspektrum einer
Sprache, desto schlechter erfüllt sie viele dieser Kriterien.

Ein vielversprechender Ansatz besteht daher darin, eine Sprache für
einen ganz konkreten Einsatzzweck zu bauen, sogenannte
domänenspezifische Sprachen: für Steuergesetze, für medizinische
Algorithmen, für die Konfiguration komplexer technischer Geräte oder die
Performanceanalyse von eingebetteten Systemen.

Der Haken dabei? Man muss eine neue Sprache bauen. Die Lösung?
Domänenspezifische Sprachen zur Sprachdefinition. Über die letzten Jahre
haben sich die dafür notwendigen Werkzeuge so weiterentwickelt, dass der
Aufwand zum Bau einer Sprache problemlos im Rahmen eines normalen
Softwareentwicklungsprojektes unterzubringen ist. Diese Werkzeuge,
Language Workbenches, unterstützen die Definition aller relevanten
Sprachaspekte, von Struktur über Typsystem bis zu Interpretern,
Compilern und komfortablen IDEs. Sie erlauben modulare Spracherweiterung
und -komposition sowie die Mischung von Syntaxformen wie Text, Tabellen,
und Diagrammen.

Dieser Vortrag zeigt den Sprachbau mit einer solchen Language
Workbench, dem Open-Source Werkzeug MPS von Jetbrains. Neben der
Live-Demo einer Spracherweiterung werden ein paar Beispiele für DSLs
aus dem industriellen Umfeld demonstriert. Ich gehe dabei auch auf die Integration
mit Verifikationswerkzeugen wie SMT Solvern und Model Checkern ein.
