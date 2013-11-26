---
kind: event
startdate: 2012-11-08T19:30:00Z
duration: 2h
title: "Besonderheiten von NixOS"
speakers:
  -
    name: Joachim Schiele
material:
  -
    title: SVG (in Firefox getestet)
    file: CCCS-stuttgart-vortrag-nixos.svg
audio: CCCS_081112.mp3
location:
  location: bib
  details: Max-Bense-Forum, UG
public: true
# <li> <strong>8.11.2012</strong> <br>
#      <strong>Referent:</strong> Joachim Schiele <br>
#      <strong>Thema:</strong> "Besonderheiten von NixOS" <br>
#      <strong>Orgapate:</strong> Skyr<br>
#      <strong>Folien:</strong> <a href="http://lastlog.de/misc/CCCS-stuttgart-vortrag-nixos.svg">SVG (in Firefox getestet)</a><br>
#      <a href="http://www.cccs.de/wiki/pub/Main/VorTraege/pressetext-201211.txt" target="_top">Pressetext 11/2012</a> <br>
#      <a href="http://www.cccs.de/wiki/pub/Main/VorTraege/aushang-201211.pdf" target="_top">Aushang November 2012</a> <br>
#      <a href="http://www.cccs.de/wiki/pub/Main/VorTraege/flyer-201211.pdf" target="_top">Flyer November 2012</a><br>
#      <strong>Audio:</strong> <a href="http://www1.stuttgart.de/stadtbibliothek/druck/audio/cccs/cccs_audio.php#39" target="_top">http://www1.stuttgart.de/stadtbibliothek/druck/audio/cccs/cccs_audio.php#39</a>
# </li>
# Datum:          Donnerstag, 08. November 2012
# Zeit:           19:00 Einlass, 19:30 Vortragsbeginn
#
# Thema:          "Besonderheiten von NixOS"
# Referent:       Joachim Schiele
#
# Ort:            Stadtbibliothek am Mailänder Platz
#                 Mailänder Platz 1, 70173 Stuttgart
#                 Max Bense Forum, erstes Untergeschoß
#                 N48° 47' 25.249" E9° 10' 56.96"
#
# Veranstalter:   Chaos Computer Club Stuttgart (http://www.cccs.de/)
# Kooperation:    Dank an die Stadtbücherei Stuttgart für die Räumlichkeiten!
#
# Eintritt:       Frei. Um Spenden wird gebeten.
#
# Kurzbeschreibung:
# Eines der Kernbestandteile einer Linux-Distribution ist der Paketmanager: Er
# sorgt dafür, daß ein gewünschtes Programm samt aller benötigten Abhängigkeiten
# auf einem System installiert - und auf Wunsch auch wieder entfernt, ohne dabei
# die Funktion anderer installierter Programme zu beeinträchtigen. Moderne
# Distributionen haben die damit verbundenen Probleme im Griff - zumindest so
# lange bei der Installation nichts schief geht.  Was passiert aber, wenn die
# Installation mitendrin abbricht? Der leidgeplagte Admin kann sich da sicher an
# den einen oder anderen Vorfall erinnern... nun steht man vor dem Scherbenhaufen
# eines inkonsistenten Systems, in dem alte und neue Dateien, aktualisierte und
# noch nicht aktualisikerte Bibliotheksversionen munter durcheinander
# herumliegen.
#
# NixOS möchte dieses Problem (und weitere Probleme wie z.B. versionsunabhängige
# Konfiguration der Pakete) mit einem "alles-oder-nichts"-Ansatz lösen und
# bedient sich hierfür bei Ideen und Konzepten funktionaler Programmierung. Mit
# der funktionalen Programmiersprache Nix bietet es die nächste Generation an
# Paketverwaltung. Man braucht aber keine Angst vor funktionaler Programmierung
# zu haben, diese sind in NixOS recht gut vor dem Benutzer versteckt.
#
# Welche Gemeinheiten das klassische Paketmanagement birgt und wie NixOS diese
# Probleme löst, soll in diesem Vortrag gezeigt werden.
#
---
Eines der Kernbestandteile einer Linux-Distribution ist der Paketmanager: Er
sorgt dafür, dass ein gewünschtes Programm samt aller benötigten Abhängigkeiten
auf einem System installiert - und auf Wunsch auch wieder entfernt, ohne dabei
die Funktion anderer installierter Programme zu beeinträchtigen. Moderne
Distributionen haben die damit verbundenen Probleme im Griff - zumindest so
lange bei der Installation nichts schief geht.  Was passiert aber, wenn die
Installation mitendrin abbricht? Der leidgeplagte Admin kann sich da sicher an
den einen oder anderen Vorfall erinnern... nun steht man vor dem Scherbenhaufen
eines inkonsistenten Systems, in dem alte und neue Dateien, aktualisierte und
noch nicht aktualisikerte Bibliotheksversionen munter durcheinander
herumliegen.

NixOS möchte dieses Problem (und weitere Probleme wie z.B. versionsunabhängige
Konfiguration der Pakete) mit einem "alles-oder-nichts"-Ansatz lösen und
bedient sich hierfür bei Ideen und Konzepten funktionaler Programmierung. Mit
der funktionalen Programmiersprache Nix bietet es die nächste Generation an
Paketverwaltung. Man braucht aber keine Angst vor funktionaler Programmierung
zu haben, diese sind in NixOS recht gut vor dem Benutzer versteckt.

Welche Gemeinheiten das klassische Paketmanagement birgt und wie NixOS diese
Probleme löst, soll in diesem Vortrag gezeigt werden.

