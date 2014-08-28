##Bytespeicher - 3D Drucker

[link to english version](#bytespeicher---3d-printer)

Wir sammeln hier sowohl Dokumente zum 3D Drucker selbst als auch zu druckbaren Objekte.
Im [Wiki](https://github.com/Bytespeicher/3D_Printer/wiki) gibt es eine [Wunschliste](https://github.com/Bytespeicher/3D_Printer/wiki/Wishlist).


Wir haben momentan Zugriff auf einen [Felix 1.5](http://shop.felixprinters.com/) 3D Drucker.

### Um ein neues Druckprojekt anzulegen

1. 'clone' dieses Repository
2. erstelle einen neuen Unterordner, benannt nach deinem Projekt
3. füge eine README.md Datei hinzu, in der du dein Projekt beschreibst
4. lade deine .stl Modelldatei hoch (benutze dabei die Versionierung von Git) (lade oft Zwischenstände hoch, das Diff sieht cool aus!)
5. (optional) lade deine SketchUp-, blender-, gcode-Datei hoch, um anderen das Ändern und schnelle Nachdrucken zu erlauben
6. füge Bilder oder Videos von deinem Druckprozess oder dem fertigen Objekt hinzu
7. 'push' die Änderung wieder hier her (falls du die Rechte dazu hast) oder sende ein 'pull request'

Optional: Bitte beschreibe die Probleme die du hattest, Reparaturen oder Modifikationen die nötig waren oder sonstige Stories rund um die Entwicklung deines Projekts in der README.md. 

### Die übliche Struktur ist:
- `name_deines_projekts/`  
    - *sollte die README.md enthalten*  
- `name_deines_projekts/models`  
    - *für 3D Modelle in verschiedenen Formaten*  
- `name_deines_projekts/images`  
    - *für Fotos, die das Objekt, den Druck- oder Entwicklungsprozess dokumentieren*  
- `name_deines_projekts/references`  
    - *für Referenzdaten wie Zeichnungen, Skizzen, Referenzfotos, etc.*  

### Markierungen
Wenn ihr wollt, dass euch jemand im Space euer Objekt druckt, z.B. weil ihr selten dort seid oder keine Zeit habt,
legt eine Datei namens `PLEASE_PRINT_ME` in euer Projektverzeichnis. In der Datei könnt ihr eure gewünschten Druckparameter angeben. Achtung: Das Material geht auf eure Kosten.

Wenn ihr keine Ahnung vom 3D-Design oder CAD habt, aber gern etwas gedruckt haben möchtet, markiert euer Objekt in der [Wunschliste](https://github.com/Bytespeicher/3D_Printer/wiki/wishlist) mit einem `PLEASE_DESIGN_ME` oder euer Projektverzeichnis mit einer `PLEASE_DESIGN_ME` Datei. Das klappt natürlich nur, wenn ihr genug Referenzmaterial liefert und/oder das Projekt gut beschreibt. (Und jemand Langeweile hat.)

### Lizenz
Alle Bilder, Modelle und Refrenzmaterialien, die hier hochgeladen werden, stehe automatisch unter CC-BY-SA ([Creative Commons Namensnennung - Weitergabe unter gleichen Bedingungen 4.0 International Lizenz](https://creativecommons.org/licenses/by-sa/4.0/)), es sei denn, sie werden im Projektunterverzeichnis anders gekennzeichnet. Diese Kennzeichnung kann am/im File selbst oder in der gemeinsamen README.md erfolgen. Als Namensnennung gilt die Bezeichnung "Bytespeicher Erfurt - 3D Printer Repo" sowie der Name des letzten editierenden Nutzers. Auf Webmedien jeweils mit "Bytespeicher" als Link zu bytespeicher.org und dem Nutzernamen als Link zur Github-Seite.

----------------------------------------------------------------------------------------------------
##Bytespeicher - 3D Printer

[Link zur deutschen Version](#bytespeicher---3d-drucker)

Both the 3D printer development itself + printed parts and projects
There is a [wishlist](https://github.com/Bytespeicher/3D_Printer/wiki/Wishlist) in the [wiki](https://github.com/Bytespeicher/3D_Printer/wiki).

We own a FELIX 1.5 printer. 

### To add a printing projekt, 

1. clone this repo, 
2. add a new folder, named after your project
3. add a README.md into that folder describing your project
4. add the .stl file with your model (and use versioning for the devlopment) (commit often, the diff looks cool!)
5. (Optional) Add the .gcode file for fast reproduction
6. add pictures/videos of the print process and the finished part
7. push here (if you have the rights) or send a pull request

Optional: Please add a description of encountered problems, funny stories, repairs or modifications to the printer to the readme should they happen during your project.

### The usual structure is:
- `name_of_your_project/`  
    - *should contain a README.md*  
- `name_of_your_project/models`  
    - *for 3D model files in various formats*  
- `name_of_your_project/images`  
    - *for photos documenting the design, build and test process*  
- `name_of_your_project/references`  
    - *for reference files like 2D-drawings, CAD-files, reference photos etc.*  

### markings
If you want your object printed by someone in the hackerspace (because e.g. you can't find the time), create a file called
 `PLEASE_PRINT_ME` in your project folder. You can detail your desired print parameters in the file. Beware: The material costs are on you.
 
If you don't know anything about 3D-design or CAD but want an object printed, mark your [wishlist](https://github.com/Bytespeicher/3D_Printer/wiki/wishlist) entry with
the words `PLEASE_DESIGN_ME` or create a file of the same name in your project folder. This only works if you detailed your project enough and/or if you've given enough reference material. (Also there needs to be someone with too much free time.)

### license
All imaged, models or reference material uploaded here is set under CC-BY-SA ([Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/)), except they are marked otherwise either directly in the files or with a README.md in the projects sub-folder. As atribution, please use "Bytespeicher Erfurt - 3D Printer Repo" in addition to the last committers name. If publishing to the web, please link to the license, to bytespeicher.org and to this/the users github page.
