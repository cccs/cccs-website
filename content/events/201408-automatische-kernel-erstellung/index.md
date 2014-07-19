---
kind: event
startdate: 2014-08-14T19:30:00Z
duration: 2h
title: "Beyond make menuconfig - vollautomatische Erstellung aktueller Linux-Kernel mit VServer-Patch"
speakers:
  -
    name: 'Christian Recktenwald'
location:
  location: bib
public: true
---
Seit das Debian-Team beschlossen hat, keinen Kernel mehr mit
VServer-Patch[0] anzubieten, besteht die Aufgabe, dies nun selbst
zu tun. Dass der offizielle Debian-Kernel mit der Version
deutlich hinter der Entwicklung herhinkt, tut ein Uebriges.

Erforderlich war ein Ablauf, der moeglichst zeitnah und
standardisiert den Kernel als .deb-Paket in einem Repository
bereitstellt.

So entstand im Oktober 2012 bei LiHAS [1] das Projekt kernel-autobuild [2],
um Linux-Kernel vollautmatisch zu erzeugen.

Kernel-autobuild sorgt nun dafuer, dass die Ermittlung der aktuellen
Version, Download, patchen mit dem VServer-Patch, erstellen eines
Debian-Pakets, erstellen einer virtuellen Maschine (KVM), Test in
der virtuellen Maschine, Upload ins Repository und Information
per Email automatisch ablaufen.

Um den Ueberblick ueber 12000 Kernel-Optionen zu behalten,
gibt es Tools, um multiple .config-Files zu vergleichen und seit
Juni 2014 auch Tools um Kconfig nach XML zu exportieren
und hier ebenfalls Mehrwege-Vergleiche durchfuehren zu koennen."

Vorrausetzungen

Zum Verstaendnis sollte man schon mal einen Kernel gebaut oder
es zumindest versucht haben.
Die grundlegenden Ideen von Virtualisierung, HTML, XML,
Shell-Programmierung und dem Debian Packet-Management helfen.

Zur Person

Christian Recktenwald macht seit 1989 Dinge mit Computern
und arbeitet seit 1993 mit Linux. Von seinem Vater hat er die
Idee uebernommen, dass Computer dazu da sind, Menschen
fehleranfaellige Routinearbeiten abzunehmen.

[0] http://www.linux-vserver.org
[1] http://www.lihas.de