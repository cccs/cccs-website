---
kind: article
created_at: 2014-04-18
title: Welche Smartphone-Messenger schützen unsere Privatsphäre?
subtitle: Rückblick auf den "WhatsApp und Co."-Vortrag 
refers_to: events/201404-unsichere-messenger-alternativen
author: [Stefan "Leibi" Leibfarth](http://stefan.leibfarth.org/?page_id=7)
---
Mobile Messenger und deren Privatsphäre sind nicht zuletzt nach den Enthüllungen um die NSA und dem Kauf von WhatsApp durch Facebook ein Thema, das für viele Menschen zunehmend an Bedeutung gewinnt. In meinem Vortrag habe ich die aktuell beliebtesten Messenger vergleichen.

Ich habe dabei bewusst nicht den bösen NSA-, Facebook- oder Google-Teufel an die Wand gemalt und die dann verunsicherten Menschen zur Verwendung von Kryptografie zu bewegen, sondern einen anderen Ansatz gewählt:

**Warum stellen wir nicht sicher, dass unsere digitale Kommunikation die selben Eigenschaften wie persönliche, unmittelbare Kommunikation hat?!? **

Dies sind im wesentlichen diese Drei:<br/>
 * *Vertraulichkeit* &nbsp;(niemand kann mitlesen)<br/>
 * *Authentizität* &nbsp;&nbsp;&nbsp;&nbsp;(ich rede mit dem/der Richtigen)<br/>
 * *Integrität* &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(niemand kann Nachrichten verändern)

Nach diesen Kriterien habe ich die beliebtesten Messenger, sowie deren Alternativen, beurteilt. 
Eine unverzichtbare Voraussetzung für vertrauenswürdige und sichere Apps ist für mich, dass der Quelltext verfügbar ist; ist er es nicht, fällt die App durch.

Wenig überraschend schneiden die beliebten Messenger in allen Punkten katastrophal ab. Auch das, seit der Übernahme von WhatsApp durch Facebook, gehypte *[Threema](https://threema.ch/de/)* schneitet wenig besser ab, da auch hier kein Quelltext vorliegt. Das Open-Source-Software nicht automatisch sicher oder vertrauenswürdig ist, beweist *[Whistle.im](http://hannover.ccc.de/~nexus/whistle.html)*.

Außerdem habe ich auch den Umgang der Apps mit dem Adressbuch beleuchtet. Der Abgleich des Adressbuches bietet den praktischen Vorteil, dass der Nutzer sofort sieht, welcher seiner Kontakte schon den jeweiligen Messenger nutzen. *WhatsApp* lädt hier das komplette Adressbuch zu sich auf den Server. *surespot* verzichtet hierauf, was jedoch für den Nutzer bedeutet, dass er mit einer leeren Kontaktliste beginn.
*TextSecure* geht hier einen Mittelweg, in dem es [Hashes](https://de.wikipedia.org/wiki/Pr%C3%BCfsumme) der Telefonnummern zum Abgleich überträgt. 
Zu diesem Teil kamen relativ viele Nachfragen aus dem Publikum, ich persönlich halte den Weg den TextSecure hier geht für einen [annehmbaren Kompromiss](https://whispersystems.org/blog/contact-discovery/).

**Fazit:**<br/>
Einzig *[surespot](https://www.surespot.me/)* und *[TextSecure](https://whispersystems.org/)* können überzeugen, da sie die nötigen Anforderungen erfüllen. Besonders *TextSecure* setzt neue Maßstäbe was [einfache Bedienbarkeit und moderne Verschlüsselung](https://whispersystems.org/blog/the-new-textsecure/) angeht. Leider ist die iPhone-Variante noch in der Entwicklung, sollte aber bald erscheinen.
