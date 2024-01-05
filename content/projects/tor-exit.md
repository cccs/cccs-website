---
title: Tor-Exit Knoten
kind: project
status: active
---
Seit Anfang 2022 betreibt der CCCS e.V. einen eigenen Server um das [Tor-Netzwerk](https://www.torproject.org/de/) zu unterstützen.   
Tor bietet Millionen Menschen weltweit die Möglichkeit das Internet anonym und unzensiert zu nutzen.   
Je mehr Knoten Teil des Netzwerks sind, desto besser funktioniert das Gesamtsystem.   
Den Exit Knoten kommt dabei eine besondere Rolle zu, denn deren IP-Adresse ist für die anderen Teilnehmenden am Internet (z.B. Webseiten) als Quelle des Datenverkehrs durch das Tor-Netzwerk sichtbar. Die Furcht vor juristischen Streitigkeiten schreckt viele von deren Betrieb ab.   
Die Folge: Die Exit Knoten sind der Flaschenhals des Netzwerks, sie zu betreiben besonders wichtig.

## Hardware
CPU: 2 x Intel Xeon E5-2680 v2 @ 2.80GHz   
RAM: 128GiB   
Anbindung: 10 GiB/s   
Standort: [Individual Network Berlin e.V.](https://in-berlin.de/provider/colo.html) in Berlin Tempelhof

## Tor Instanzen
Um die Hardware und Netzanbindung optimal auszulasten laufen auf dem Server mehrere Tor-Instanzen.   
Die aktuelle Übersicht über diese Instanzen gibt es [hier](https://metrics.torproject.org/rs.html#search/CCCStuttgartBer).

## Statistiken

### Beitrag zum Tor-Netzwerk
![](/img/tor-exit-graph.png)   
Quelle: [OrNetStats](https://nusenu.github.io/OrNetStats/www.cccs.de.html) / Stand: 29.12.2023

### Menge an durchgeleiteten Daten
![Summary](https://exit-inberlin-static.leibfarth.org/summary.png)   
<br>![Months](https://exit-inberlin-static.leibfarth.org/months.png)   
<br>![Years](https://exit-inberlin-static.leibfarth.org/years.png)

## Behördenanfragen
(Stand 05.01.2024)   
Regelmäßig erreichen uns Behördenanfragen bzw. Auskunftsanordnungen. Immer sollen wir zu einer unserer Server persönliche Daten von Nutzenden heraus geben.   
Den einzelnen Tor-Knoten liegen diese Daten jedoch nicht vor, so dass wir die Auskunft nicht erteilen können.   
Kurz: Bis dato haben wir keine Daten an Behörden weitergegeben.
