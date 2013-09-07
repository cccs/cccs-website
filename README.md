# Webseitenquelltext [www.cccs.de](www.cccs.de)

## Lizenzen

Der Inhalt der referenzierten git-Repos steht unter den dort vermerkten
Lizenzen. Der verwendete Webfont „Titillium“ steht unter der [SIL Open Font
License](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).

Soweit nicht anderweitig in den jeweiligen Artikeln vermerkt, stehen die
Inhalte der Webseite (im Verzeichnis `/content`) unter der
Creative-Commons-Lizenz
[by-nc-sa](http://creativecommons.org/licenses/by-nc-sa/3.0/).

Die Konfiguration und die zugehörigen Ruby-Funktionen (Datei `Rules`,
Verzeichnisse `layout` und `lib`) stehen unter der Creative-Commons-Lizenz
[by-sa](http://creativecommons.org/licenses/by-sa/3.0/).

Design und Logos des CCCS bleiben von obigen Regeln unberührt, alle Rechte liegen
hier beim [CCCS](http://www.cccs.de/). Vor einer Verwendung ist die
schriftliche Erlaubnis des Vereinsvorstands.


## Übersetzen der Seite

Die Webseite wird mit [nanoc](http://nanoc.ws/) generiert.

Software-Voraussetzungen:

* ruby
* bundler
* Zum Generieren der PDF-Flyer: inkscape

Sämtliche benötigten Abhängigkeiten werden durch den Aufruf von

    bundle install

installiert. Anschließend kann die Seite mittels

    nanoc
    nanoc view

übersetzt und anschließend durch einen minimalistischen Webserver lokal
angesehen werden. Bitte beachten: Der Webserver behandelt keine
Redirect-Anweisungen, weshalb einige Links aus dem Menü nicht
funktionieren.


## Allgemeine Hinweise für Webseiten-Inhalte

Die Inhalte der Webseite liegen im Verzeichnis `content`. Seiten können
direkt als html-Dateien oder in [Markdown](http://daringfireball.net/projects/markdown/syntax)
(mit der Dateiendung `.md`) geschrieben werden. Zu jeder Datei gehören
Metadatan -- diese stehen endweder als „yaml front matter“ mit
Bindestrichen abgetrennt vor dem eigentlichen Inhalt, oder in einer
separaten Datei mit der Dateiendung `.yaml`.

Jede Seite benötigt mindestens die Angabe des Seitentyps (`kind`). Für
normale Seiten lautet dieser `page`, für Blogeinträge `article`, für
Projektseiten `project`, für Veranstaltungen oder Aktivitäten `event`.
Je nach Typ gibt es eine Reihe weiterer Metadaten-Angaben, die zum
Teil zwingend erforderlich sind (soll heißen: Wenn sie fehlen,
gibt es einen Fehler beim Generieren der Webseite).
Am einfachsten orientiert man sich an den entsprechenden bereits
existierenden Einträgen :-)

Generell werden die URLs aus den Namen der Verzeichnisse (plus ggfs. des
Dateinamens) konstruiert. Daher bitte Verzeichnisse nach der
Veröffentlichung nicht mehr umbenennen, eventuelle Links von anderen
Seiten zeigen sonst ins Leere!

Bezüglich Verzeichnis- und Dateinamen gilt: Eine Datei
`some/directory/some-name/index.md` und eine Datei
`some/directory/some-name.md` ergeben dieselbe URL
`some/directory/some-name/`. Es ist also nicht zwingend nötig, für jede
Seite ein separates Unterverzeichnis anzulegen. Ein Unterverzeichnis
macht dann Sinn, wenn es zur Seite zugehörige Ressourcen wie z.B.
eingebundene Bilder beheimatet.

Mitunter möchte man zu einer Seite weitere Daten (wie z.B. Folien von
Vorträgen, Audiomitschnitte, etc.) hinterlegen. Solche „Archivdateien“
bitte _nicht_ im git-Repo einpflegen -- diese Dateien sind meist sehr
groß und würden die Größe des Repositories rasch explodieren lassen.
Diese Dateien werden direkt auf den Webserver in ein bestimmtes
Verzeichnis geladen.

Für Dateinamen gibt es eine Besonderheit: Dateien und Verzeichnisse, die
mit einem Underscore (`_`) beginnen, werden nicht auf der Webseite
publiziert.


## Howtos

### Blogeinträge

Sämtliche Blogeinträge befinden sich im Verzeichnis `articles`. Um einen
neuen Blogeintrag zu erzeugen, muss für diesen hier ein neues
Verzeichnis mit folgendem Namensschema angelegt werden:

    nnnn-der-url-titel-des-artikels

Die ersten vier Stellen `nnnn` sind eine laufende Nummer der
Artikelverzeichnisse. Der Rest ergibt (zusammen mit dem Artikeldatum)
die URL des Blogartikels. Hier sollte der (verkürzte) Titel des
Blogartikels geändert werden; Leerzeichen werden durch Bindestriche
ersetzt.

Der Inhalt des Blogartikels steht in der Datei `index.md` (für mit
Markdown verfaßte Artikel). Zwingend erforderlich sind die
Metadaten-Angaben:

* `kind` (muss `article` sein)
* `created_at` -- das Erstellungsdatum im Format yyyy-mm-dd
* `title` -- die Überschrift

Optional können folgende Angaben gemacht werden:

* `subtitle` -- eine Unterüberschrift
* `author` -- der Name des Artikelautors
* `refers_to` -- Referenz auf eine Event- oder Projektseite. Dieser
  Artikel erscheint dann dort ebenfalls in der Artikelübersicht.

Ein Teil des Artikeltextes wird als Teasertext in Übersichten angezeigt.
Die Grenze wird durch eine Zeile mit der Markierung `<!--break-->`
markiert; sonst wird der erste Abschnitt benutzt.


### Veranstaltungen und Aktivitäten

Der Ordner `events` beinhaltet Termine, die vom CCCS veranstaltet
werden. Der Ordner `activities` enthält Termine, an denen der CCCS zwar
beteiligt, aber nicht der Veranstalter ist. `events` sind typischerweise
Termine der Vortragsreihe, `activities` Veranstaltungen, an denen jemand
vom CCCS als Sprecher/Diskussionspartner/Referent/... eingeladen ist.

Namensschema der Inhalte beider Ordner ist:

    yyyymm-kurze-beschreibung

Also Jahr und Monat der Veranstaltung sowie ein Extrakt des
Veranstaltungstitels. Nötig sind folgende Metadaten:

* `kind` (muss `event` sein)
* `title` -- die Überschrift
* `startdate` -- Datums- oder Zeitangabe im Format `yyyy-mm-dd` oder
  `yyyy-mm-ddThh:mm:ssZ` (wichtig: Das "T" und das "Z" müssen so
  stehenbleiben!)
* `enddate` oder `duration` -- Endweder ein Enddatum (Format wie
  `startdate`) oder eine Zeitdauer. Bei ganztägigen Ereignissen (also
  ohne Zeitangabe) muss diese im Format n`d` (also n Tage), sonst im
  Format n`h` (n Stunden) oder n`m` (n Minuten) erfolgen.
* `public` -- `true` oder `false`, je nachdem, ob es sich um eine für
  die Öffentlichkeit zugängliche Veranstaltung handelt (ist
  typischerweise nur für Termine, zu denen wir eingeladen sind, false).

Optional sind folgende Angaben:

* `speakers` -- ist eine Liste, wobei jeder Eintrag mindestens die Angabe
  `name` und optional den Zusatz `affiliation` besitzt. Das sieht
  beispielsweise also so aus:

          speakers:
            -
              name: einervonuns
              affiliation: CCC Stuttgart
            -
              name: einervonwoanders
              affiliation: andereorga
            -
              name: jemanddrittes

* `location` -- nochmal ein schwieriges Feld ;-) Eine Location kann eine
  ganze Reihe von Angaben beinhalten: `name`, `url`, `strasse`, `plz`,
  `lon` und `lat` -- oder die erneute Angabe `location`. In letzterem
  Fall werden die Angaben aus der Template-Datei in
  `content/_data/locations.yaml` übernommen.
* `material` -- Beinhaltet eine Liste, welche die Angaben `title` und
  entweder `file` oder `link` enthält. Beispiel:

          material:
            -
              title: Die Folien (PDF)
              file: vortrag.pdf
            -
              title: Quelltext auf github
              link: https://github.com/...

    In ersterem Fall wird auf eine Datei auf unserem Server verwiesen.
  Diese muss in einem Verzeichnis liegen, das _identisch_ zum Pfad des
  Artikels ist.
* `audio` -- Ein Dateiname, dessen zugehörige Datei (wie bei `file`-Angaben im
  Abschnitt `material`) im entsprechenden Datenverzeichnis auf dem
  Server liegen muss.

#### Erzeugen der Flyer

Um zu einem Termin (beispielsweise `events/201301-fahrrad-illumination`)
den zugehörigen Flyer zu erzeugen, gibt es ein spezielles
nanoc-Kommando:

    nanoc create-flyer events/201301-fahrrad-illumination

Dieser erzeugt im Verzeichnis des Artikels SVG- und PDF-Dateien für
Flyer und Aushang. Meistens ist das Ergebnis adäquat, manchmal muss man
nochmals etwas nacharbeiten. Ist das Ergebnis bereits ok, bitte die
SVG-Dateien wieder löschen und _nur_ die PDF-Dateien ins git-Repositroy
aufnehmen. Ansonsten die SVG-Dateien bearbeiten und _sowohl_ SVG _als
auch_ PDF-Daten committen. Da die SVG-Dateien mit einem `_` beginnen,
landen sie nicht auf dem Webserver.

Möchte man die Dateien in einem anderen Verzeichnis erzeugen, kann man
dem obigen nanoc-Kommando einen Ausgabepfad als weiteren Parameter
anhängen.


### Sonstige Chaos-Termine

Diverse weitere Termine erscheinen nur in der Kalenderübersicht und der
iCal-Datei. Diese befinden sich als Liste in der Datei
`content/_data/chaosevents.yaml`. Die einzelnen Einträge haben dieselben
Metadaten wie die oben beschriebenen Events.


### Stammtisch-Termine

Auch die Stammtischtermine befinden sich in einer separaten Datei:
`content/_data/stammtisch.yaml`. Um die Termine für ein Jahr an den
typischen Terminen zu erzeugen, gibt es im Verzeichnis `scripts` das
Skript `generate-stammtisch.rb`. Als Parameter erhält es eine
Jahreszahl. Die Ausgabe kann dann mit der bestehenden
`stammtisch.yaml`-Datei zusammengeführt werden.


