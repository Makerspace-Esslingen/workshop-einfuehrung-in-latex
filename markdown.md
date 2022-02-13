# Einführung in LaTeX

---
## Warum LaTeX
TODO

---
## Minimales LaTeX-Dokument

```latex[1|3-4]
\documentclass{article}

\begin{document}
\end{document}
```

--
### Dokumentklassen
- **article**
    - für wissenschaftliche Artikel
    - typischer Weise wenige Seiten
    - Überschriften auf mehreren Ebenen
    - Keine Kapitel
    - Standardmäßig wird der Titel nicht auf einer eigenen Seite gedruckt
- **letter**
    - für Briefe

--
- **report**
    - für Seminar/Abschlussarbeiten
    - Seitenzahl typischer Weise unter 100 Seiten
    - Titel wird standardmäßig auf einer eigenen Seite gedruck
- **book**
     - für Bücher
     - typischer Weise >200 Seiten
     - mit Vorwort, Kapiteln, Anhängen, Inhaltsverzeichnis, Stichwortverzeichnis...

--
Der Workshop fokussiert sich auf die **article**-Class.

Weitere Dokumentklassen und deren Optionen siehe Kapitel 3 in [LaTeX2e: An unofficial reference manual](https://ftp.agdsn.de/pub/mirrors/latex/dante/info/latex2e-help-texinfo/latex2e.pdf)

--
### Befehle und Umgebungen

```latex[1|2|3|5-6]
\befehlsname
\befehlsname{erster Parameter}{zweiter Parameter}
\befehlsname[optionaler Parameter]{erster}{zweiter}

\begin{Umgebungsname}
\end{Umgebungsname}
```

--
### Packages

Packages definieren zusätzliche Befehle und Umgebungen für bestimmte Einsatzzwecke.

```latex
\usepackage[Optionen]{Paketname}
```

--
### Standardpakete

- [**amsmath**](https://ctan.org/pkg/amsmath)
    - Ausgerichtetes Setzen von mehrstufigen Berechnungen / Herleitungen / Beweisen
- [**babel**](https://ctan.org/pkg/babel)
    - automatische Silbentrennung
- [**geometry**](https://ctan.org/pkg/geometry)
    - Seitenlayout (z.B. Seitenränder) setzen

--
- [**glossaries**](https://ctan.org/pkg/glossaries)
    - Verschiedene Index-Typen für Stichwortverzeichnis, Glossar, Abkürzungsverzeichnis, ...
- [**hyperref**](https://ctan.org/pkg/hyperref)
    - Klickbare Referenzen innerhalb des PDF Dokuments
- [**makeidx**](https://ctan.org/pkg/makeidx)
    - Erzeugung von Stichwortverzeichnissen
- [**setspace**](https://ctan.org/pkg/setspace)
    - Setzen von Zeilenabständen

--
### Beispiel
```latex[1-7|9-11|13-15|17-18|20-22]
% Dokumentklasse article auswählen
%   Optionen:
%     11pt      - Standardschriftgröße
%     a4paper   - Papierformat
%     titlepage - Titel auf eigener Seite ausgeben
%     twoside   - Seitenlayout auf beidseitigen Druck optimieren
\documentclass[11pt,a4paper,titlepage,twoside]{article}

% "linken" Seitenrand auf 3cm setzen
% - wird durch die Option "twoside" automatisch alterniert
\usepackage[left=3 cm]{geometry}

% Zeichensatz der Eingabedatei festlegen
% erlaubt direktes Tippen von Umlauten
\usepackage[utf8]{inputenc}

% Silbentrennung für die neue deutsche Rechtschreibung laden
\usepackage[ngerman]{babel}

\begin{document}
Dies ist ein Absatz mit Text.
\end{document}
```

---
## Text formatieren und strukturieren
### Absätze

- **\textbf{...}**  
    Text wird fett gedruckt
- **\textit{...}**  
    Text wird kursiv gedruckt
- <b>\\\\</b> oder **\newline**  
    erzwingt einen Zeilenumbruch

--
- **\newpage**  
    erzwingt einen Seitenumbruch
- **\pagebreak**  
    fügt einen Seitenumbruch HINTER dem nächsten Zeilenumbruch ein. 

--
```latex
Der Text eines Absatzes wird von LaTeX automatisch im
Blocksatz ausgerichtet und mit Silbentrennung sowie
eilenumbrüchen versehen. \textbf{Fett-} und
\textit{Kursiv-}Druck sind ebenfalls möglich.
Einzelne Zeilenumbrüche im Quelltext werden im Druck ignoriert.
Zeilenumbrüche können\\
erzwungen \newline
werden.

Ein neuer Absatz beginnt automatisch, wenn im Quelltext zwei
aufeinander folgende Zeilenumbrüche gefunden werden. Die erste
Zeile wird dabei automatisch eingerückt.
```

--
### Zeilenabstand setzen
Das Package [**setspace**](https://ctan.org/pkg/setspace?lang=de) bringt eine Reihe von Befehlen mit, um den Zeilenabstand des Dokuments zu Beginn zu setzen:

- **\singlespacing**  
- **\onehalfspacing**  
- **\doublespacing**  
- **\setstretch{factor}**

```latex
\usepackage{setspace}
\setstretch{1.7}
```

--
Alternativ führt das **setspace** Package Umgebungen ein, innerhalb derer ein bestimmte Zeilenabstand vorgegeben werden kann.  
  
- **singlespacing**  
- **onehalfspacing**  
- **doublespacing**  
- **spacing{Faktor}**

--
```latex[2,5-7,9-11]
...  
\usepackage{setspace}  

\begin{document}
    \begin{singlespacing}
        Absatz mit einfachem Zeilenabstand.
    \end{singlespacing}

    \begin{spacing}{1.7}
        Absatz mit 1,7-fachem Zeilenabstand.
    \end{spacing}
\end{document}
```

--
### Schriftart wählen
- PdfLaTeX unterstützt die Schriftarten des **fontenc** Packages (siehe Kapitel 4 in [latex2e](https://ftp.agdsn.de/pub/mirrors/latex/dante/info/latex2e-help-texinfo/latex2e.pdf)).
- Liste aller Schriftarten:    
    [https://tug.org/FontCatalogue/](https://tug.org/FontCatalogue/)  

z.B.
```latex[2-3]
...
\usepackage{fontspec}
\setmainfont{QTCasual}  
...
\begin{document}
    Dies ist ein Test-Absatz.
\end{document}
```

--
Schriftart Times
```latex
\usepackage[T1]{fontenc}
\usepackage{mathptmx}
```

Schriftart Helvetica
```latex
\usepackage[T1]{fontenc}
\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
```

--
### horizontale Ausrichtung
TODO (flushleft, ...)

--
### Aufzählungen, Listen
TODO (itemize, ...)

--
### Überschriften und Inhaltsverzeichnis
Die article-Class definiert 5 Standardebenen für Überschriften
- **\section**
- **\subsection**
- **\subsubsection**
- **\paragraph**
- **\subparagraph**

--
Über Variablen lässt sich steuern, wieviele Ebenen nummeriert werden sollen:
- **secnumdepth**  
    Anzahl der Ebenen, für die eine Nummerierung in den Überschriften angezeigt werden soll
- **tocdepth**
    Anzahl der Ebenen für die eine Nummerierung in den Inhaltsverzeichnis-Einträgen angezeigt werden soll

--
- Es empfiehlt sich ausserdem, seinen Quelltext in mehrere Dateien aufzuteilen
    - z.B. eine Datei pro **\section**.
- Eine externe Datei *Beispielabschnitt.tex* kann mit dem Befehl
    ```
    \input[Beispielabschnitt]
    ```
    eingebunden werden.

--
Beispiel
```latex[1-5|7-8|10,13,15,17,19|11-12,14,16,18,20]
% Automatische Nummerierung für Überschriften bis Ebene 3
\setcounter{secnumdepth}{3}

% Automatische Nummerierung für Überschriften im Inhaltsverzeichnis bis Ebene 3
\setcounter{tocdepth}{3}

% Inhaltsverzeichnis platzieren
\tableofcontents

\section{Überschrift Ebene 1}
% Quelltext aus externer Datei Beispielabschnitt.tex einbinden
\input{Beispielabschnitt}
\subsection{Überschrift Ebene 2}
\input{Beispielabschnitt}
\subsubsection{Überschrift Ebene 3}
\input{Beispielabschnitt}
\paragraph{Überschrift Ebene 4}
\input{Beispielabschnitt}
\subparagraph{Überschrift Ebene 5}
\input{Beispielabschnitt}
```

---
## Mathematische Symbole
TODO (math mode, text mode)

---
## Tabellen
TODO

---
## Bilder / Zeichnungen
TODO

---
## Kopf- und Fußzeilen
TODO

---
## Frontblatt
TODO ( Was unterscheidet ein Frontblatt von normalen Seiten? )
