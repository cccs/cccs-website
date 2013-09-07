---
kind: article
created_at: 2013-07-29
title: Der Richter und die Cloud
subtitle: "Zusammenfassung vom Vortrag: Ermittlungsrichter Sierk Hamann über seinen Streit mit Facebook"
refers_to: events/201307-der-facebook-hack
author: Skyr, Rince
---
Beim Vortrag hatte Sierk Hamann um die „Flüchtigkeit des gesprochenen
Worts“ gebeten, weshalb es keine Audio-Aufzeichnung gab. Mitschriebe
waren aber gestattet, sogar einen Stenographen hätte er uns zugestanden
-- also haben Rince und Skyr in die Tasten ihrer Laptops gegriffen und
versucht, das wichtigste mitzunotieren. Herausgekommen ist diese
Zusammenfassung des Vortrags.

<!--break-->

Sierk Hamann ist Ermittlungsrichter in Reutlingen bei Stuttgart. In der Vortragsreihe des Chaos Computer Club Stuttgart berichtete er über seine Erfahrungen mit der Netzwelt anhand eines (inzwischen abgeschlossenen) Falles. Der Fall hatte es bundesweit unter Titeln wie „Richter beschlagnahmt Facebook-Profil“ in die Presse und Blogosphäre (mit unterschiedlich korrekten Darstellungen) geschafft (siehe z.B. [0,1]).


# Tathintergrund

Im Fall ging es um ein Einbruchsdelikt: Die Familie des Hauses war im Urlaub, lediglich die Tochter blieb zu Hause. Sie wurde von einem Bekannten abends zum Essen ausgeführt; der Bekannte gab dem Haupttäter einen Hinweis, dass die Luft nun rein sei, dieser beging den eigentlichen Einbruch.

Die Verhandlung beschäftigte sich mit dem Mittäter, dem Bekannten der Tochter. Der Haupttäter und der Mittäter hatten in diesem Fall über Facebook und deren Messaging-System kommuniziert. Bei beiden Handys (also Haupttäter und Mittäter) fand man die Facebook-App, beide fand man bei Facebook, wenn man nach ihnen suchte. Allerdings waren auf beiden Handys die SMS-Nachrichten der Tatnacht ab 23 Uhr gelöscht -- um Mitternacht wurde der Einbruch verübt. Auf die Frage, warum diese SMSe fehlten erklärten die Beschuldigten, dass der Speicher voll gewesen sei.


# Max Schrems zur Hilfe?

Die Vermutung von Hamann war nun, dass die Täter auch über den Facebook-Chat miteinander kommuniziert hatten; auf den Handys war von einer entsprechenden Kommunikation zwar nichts mehr zu finden, jedoch wusste der technisch interessierte Richter von den Ergebnissen von Max Schrems und dessen Initiative „Europe versus Facebook“ [2], dass Facebook sehr großzügig bei der Datenspeicherung vorgeht und die Daten sogar um Positionsangaben der Handys anreichert.

Analog zur Beschlagnahmung von E-Mail-Postfächern wollte er die entsprechenden Daten beschlagnahmen lassen (der Beschlagnahmebeschluss ist unter [1] verlinkt). Bei E-Mails ist dies nach seiner Aussage ein gängiges Procedere, bei deutschen E-Mail-Providern sind die Daten so innerhalb eines Tages greifbar. Wer aber war überhaupt der korrekte Ansprechpartner für sein Anliegen?

Facebook ist in Deutschland mit einer GmbH vertreten, die in Hamburg ansässig ist. An diese richtete Hamann zunächst seinen Richterbeschluß. Anstatt einer promten Antwort erhielt er nur ein (vermutlich automatisiertes) Schreiben einer „Jana“, dass seiner Anfrage eine „Record Number“ zugeteilt worden wäre. Erst auf hartnäckiges Nachhaken hin versichterte Facebook Hamburg an Eides Statt per Brief, dass es in Deutschland keine Person gäbe, die Zugriff auf diese Art von Daten habe, da die Facebook GmbH in Deutschland nur für Marketing zuständig sei.

Durch den Erfolg von Max Schrems ermutigt, wollte Hamann sein Glück bei der Irischen Niederlassung Facebook Dublin Ltd. versuchen, er stellte ein entsprechendes Rechtshilfeersuchen an die Irischen Behörden. Laut „Europe versus Facebook“ und den Aussagen des Irischen Datenschutzbeauftragten würden die Daten in Irland verarbeitet. Den Irischen Ermittunglsbehörden wurde im Zuge von Hamanns Ersuchen allerdings mitgeteilt, alle Daten lägen in den USA, der Richter solle ein entsprechendes Rechtshilfeersuchen an die USA stellen. Ein Rechtshilfeersuchen bezeichnete Hamann als den „Elefantenpfad“, ein  Vorgang, der mindestens ein Jahr dauert und ungewissen Ausgang hat.

Der Widerspruch zwischen den Informationen an die Ermittler und den Aussagen, die Facebook gegenüber den Datenschutzbeauftragten machte, wurde nie aufgelöst.

Paradoxerweise wurde dem Angeklagten selbst ebenfalls die entsprechende Auskunft verwehrt: Er hatte zu seiner Entlastung ebenfalls bei Facebook die Kommunikationsdaten angefragt -- vergeblich.


# Randnotiz E-Mail-Beschlagnahme

Hamann erläuterte im Zuge des Beschlagnahmungs-Bescheids den Ablauf, der nach gängiger Rechtssprechung für E-Mails angewandt wird. E-Mails werden wie Postkarten betrachtet: Während der Zustellung unterliegen sie dem Fernmeldegeheimnis; sobald sie zugestellt sind, also im Briefkasten des Empfängers liegen, können sie ohne größere Hürden beschlagnahmt werden.

Analog zum Briefkasten wird das E-Mail-Postfach beim Provider betrachtet. Dies war zu Zeiten, als das POP-Protokoll noch vorherrschend verwendet wurde, eine gangbare Analogie. Da inzwischen viele Leute ihr Mailarchiv aus Bequemlichkeitsgründen auf einem IMAP-Server liegenlassen oder gar ihre gesamte Kommunikation über einen Webmail-Anbieter abwickeln, ist heute ein Zugriff auf eine große Menge an sensitiven Daten mit einer relativ geringen richterlichen Hürde möglich.

Hamann merkte hierzu an, dass er als Richter angehalten ist, sämtliche möglichen Mittel zu nutzen; hier divergieren inzwsichen aber Technik und Rechtssprechung, so dass es Aufgabe des Gesetzgebers wäre, sich diesen Sachverhalt erneut anzusehen und gegebenenfalls neu zu regeln.


# Mögliche technische Winkelzüge für die Zukunft

Facebook weihte im Juni 2013 ein neues Rechenzentrum in Luleå (Schweden) ein [3]. Dieses Rechenzentrum wurde von Facebook USA gebaut und wird auch von Facebook selbst betrieben. Da es sich auf europäischem Boden befindet wird es interessant, wenn Daten in dem schwedischen Rechenzentrum liegen. Für Richter eröffnet dies eine direktere Zugriffsmöglichkeit.

Bisher völlig unbeachtet sind die Content Delivery Networks -- Server in Rechenzentren rund um den Globus, die von Diensten benutzt werden um deren Inhalte aus Gründen der Lastverteilung möglichst nah beim Kunden zu haben. Bis dato wurden solche Systeme von den Ermittlungsbehörden außer Acht gelassen; es ist eine spannende Frage, was exakt dort gespeichert wird und somit möglicherweise unter Deutscher Jurisdiktion zugreifbar ist.


# Erfahrungen aus diesem Fall

Die widersprüchlichen Aussagen gegenüber den Datenschützern und den Ermittlungsbehörden sind irgendwo zwischen dreist und unverschämt. Im Interesse beider Behörden muss hier Klarheit geschaffen werden.

Hamann sieht Probleme bei der Ermittlung im Internet, da die (inter-)nationale Rechtssprechung nicht auf cloudbasierte Daten anwendbar ist. Sobald die Daten ausserhalb von Deutschland oder gar Europa liegen, ist ein Zugriff schwer, da ein direkter Zugriff deutscher Behörden auf Server im Ausland eine Verletzung hoheitlicher Rechte wäre.
Eine (normale) Suchanfrage in einer Suchmaschine ist möglich, da diese Daten öffentlich sind. Chat-Mitschnitte und ähnliches sind es nicht, daher muss über ein Rechtshilfeersuchen (den oben erwähnten „Elefantenpfad“) angefragt werden. Da ein Richter be- und entlastende Beweise finden muss ist es für ihn bei einigen Fällen schwierig, entsprechendes Material zu bekommen.

Soziale Netz-Anbieter speichern alles, wessen sie habhaft werden können. Geodaten sind immer gerne gesehen. Der Wunsch des Benutzers zur Löschung von Daten wird gerne ignoriert -- die Daten werden zwar als gelöscht markiert, bleiben aber weiterhin gespeichert. Der (deutsche) Gesetzgeber geht davon aus, dass dieser Wunsch respektivert wird. Damit schafft eine Firma Fakten, die klar gegen geltende (deutsche) Gesetze verstoßen - und ignoriert entsprechende Anfragen.

Aus Sicht des Ermittlungsrichters schaden große Firmen der deutschen Rechtssprechung deutlich mehr als die von der Presse gerne hochstilisierten Rockergruppen, da sie einfach deutsches Recht ignorieren und entsprechende Anfragen aussitzen. Damit stellen sich Firmen über das Gesetz.

Äußerst kritisch zeigte sich Hamann sowohl gegenüber den aktuellen Snowden-Enthüllungen als auch gegenüber geheimdienstlichen Methoden wie Stammdatenabfrage, Vorratsdatenspeicherung oder Online-Durchsuchung. Die deutsche Rechtssprechung sei recht präzise und eindringlich, was das Eindringen in den privaten Bereich angeht. Heimliche Ermittlungen, bei denen die Gefahr besteht, dass der Betroffene erst spät oder gar nie von ihnen erfährt, verurteilte er genauso wie die Pauschalüberwachung, welche einem Generalverdacht gegenüber dem gesamten Volk gleichkommt. Es bestünde zwar aktuell ein Defizit, wenn es zu landesübergreifenden Ermittlungen kommt, dies müsse aber so geregelt werden, dass wie bei anderen Ermittlungsmethoden mit „offenem Visier“ gearbeitet würde. Grundsätze, die bei einer Hausdurchsuchung gälten (direkte Benachrichtigung des Betroffenen, Gegenwart von Zeugen, Möglichkeit der Rechtsmittel) müßten genauso bei Ermittlungen im Internet gelten.


# Fazit

Es war für uns Stuttgarter interessant, einmal die Sicht, die Möglichkeiten, aber auch die Sorgen und Nöte der „anderen Seite“ zu sehen. Der Appell, von Richter Hamann, Möglichkeiten für Ermittlungen mit „offenem Visier“ zu ermöglichen und dafür im Gegenzug auf fragliche, geheimdienstliche Methoden wie Vorratsdatenspeicherung und Online-Durchsuchung zu verzichten, stimmt nachdenklich. Seiner Aussage nach ist das „normale“ Verfahren mit Quick Freeze völlig ausreichend.

Und der Fall selbst? Er wurde inzwischen abgeschlossen, da der Haupttäter ein  Geständnis abgelegt hat. Das Verfahren gegen den Mittäter wurde eingestellt, da er inzwischen sozial integriert ist und eine Ausbildung macht.
Richter Hamann hat bis heute die angefragten Daten von Facebook nicht bekommen.


[0] Spiegel: [„Richter beschlagnahmt Facebook-Account“](http://www.stern.de/digital/online/internetrecht-richter-beschlagnahmt-facebook-account-1789200.html)

[1] Internet-Law-Blog: [„Amtsgericht lässt Facebook-Account beschlagnahmen“](http://www.internet-law.de/2012/02/amtsgericht-lasst-facebook-account-beschlagnahmen.html)

[2] Initiative [„Europe versus Facebook“](http://www.europe-v-facebook.org/)

[3] Slashdot: [„Facebook Saves Datacenter Costs with Frigid Arctic Wind“](http://slashdot.org/topic/datacenter/facebook-saves-datacenter-costs-with-frigid-arctic-wind/)

