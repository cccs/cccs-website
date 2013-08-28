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

Sämtliche benötigten Abhängigkeiten werden durch den Aufruf von

    bundle install

installiert. Anschließend kann die Seite mittels

    nanoc
    nanoc view

übersetzt und anschließend durch einen minimalistischen Webserver lokal
angesehen werden. Bitte beachten: Der Webserver behandelt keine
Redirect-Anweisungen, weshalb einige Links aus dem Menü nicht
funktionieren.


