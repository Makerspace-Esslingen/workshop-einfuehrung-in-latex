# Einführung in LaTeX

---
## Warum LaTeX
- Bearbeiten sehr umfangreicher Dokumente auf schwachen Rechnern
- Eingabe von Quellcode statt umfangreicher Menüs und Untermenüs und Formeleditoren

---
## LaTeX-Editor
1. Texteditor + Installation einer LaTeX-Distribution  
z.B. TexLive - [https://tug.org/texlive/](https://tug.org/texlive/)
2. oder online im Browser:  
Overleaf - [https://de.overleaf.com/](https://de.overleaf.com/)

---
## Minimales LaTeX-Dokument

```latex[1-2|4-6]
% setzen der Dokumentklasse
\documentclass{article}

% umschliesst den Inhalt des Dokuments
\begin{document}
\end{document}
```

--
### Dokumentklassen
- **article**
    - für wissenschaftliche Artikel
    - typischer Weise wenige Seiten
    - mehrstufige Überschriften (5 Ebenen)
    - Standardmäßig wird der Titel nicht auf einer eigenen Seite gedruckt
- **letter**
    - für Briefe

--
- **report**
    - für Seminar/Abschlussarbeiten
    - Seitenzahl typischer Weise unter 100 Seiten
    - Titel wird standardmäßig auf einer eigenen Seite gedruck
- **book**
     - zusätzliche Überschriftenebene für Kapitel
     - typischer Weise >200 Seiten
     - mit Vorwort, Kapiteln, Anhängen, Inhaltsverzeichnis, Stichwortverzeichnis...

--
Der Workshop fokussiert sich auf die **article**-Class.

Weitere Dokumentklassen und deren Optionen siehe Kapitel 3 in [LaTeX2e: An unofficial reference manual](https://ftp.agdsn.de/pub/mirrors/latex/dante/info/latex2e-help-texinfo/latex2e.pdf)

--
### Befehle und Umgebungen

```latex[1|2|3|5-6|8-9]
\befehlsname
\befehlsname{erster Parameter}{zweiter Parameter}
\befehlsname[optionaler Parameter]{erster}{zweiter}

% Befehle können zusätzlich mit { } umschlossen werden
{\befehlsname}

\begin{Umgebungsname}
\end{Umgebungsname}
```

--
### Formatierung und Absätze
- **\textbf{...}**  
    Text wird fett gedruckt
- **\textit{...}**  
    Text wird kursiv gedruckt
- <b>\\\\</b> oder **\newline**  
    erzwingt einen Zeilenumbruch

```latex[4-5]
\documentclass{article}

\begin{document}
Text mit \textbf{fett} oder \textit{kursiv} formatierten Wörtern.
Hinter diesem Wort \\ kommt ein erzwungener Zeilenumbruch
\end{document}
```

--
### Formatierung und Absätze
- **\newpage**  
    erzwingt einen Seitenumbruch
- **\pagebreak**  
    fügt einen Seitenumbruch HINTER dem nächsten Zeilenumbruch ein.

```latex[4]
\documentclass{article}

\begin{document}
\pagebreak Am Ende dieses Absatzes wird ein Zeilenumbruch gemacht.
\end{document}
```

--
### Umlaute und Sonderzeichen

 als Befehl
 - **\\"a** bzw. **\\"A"** für ä bzw. Ä
 - **\\"o** bzw. **\\"O"** für ö bzw. Ö
 - **\\"u** bzw. **\\"U"** für ü bzw. Ü
 - **{\\ss}** für ß

 ```latex[4]
 \documentclass{article}

 \begin{document}
 \"a \"A \"o \"O \"u \"u {\ss}
 \end{document}
 ```

--
# Umlaute und Sonderzeichen

direkt verwenden durch Einbinden des *inputenc* Packages (ab TexLive >=2018 nicht mehr notwendig)
```latex[3,6]
\documentclass{article}

\usepackage[utf8]{inputenc}

\begin{document}
äöüÄÖÜß
\end{document}
```

--
### Packages

Packages definieren zusätzliche Befehle und Umgebungen für bestimmte Einsatzzwecke.

```latex
\usepackage[Optionen]{Paketname}
```

--
### Standardpakete

- [**babel**](https://ctan.org/pkg/babel)
    - automatische Silbentrennung
- [**geometry**](https://ctan.org/pkg/geometry)
    - Seitenlayout (z.B. Seitenränder) setzen
- [**graphics**](https://ctan.org/pkg/graphics)
    - Laden und einfügen von Grafiken

--
- [**inputenc**](https://ctan.org/pkg/inputenc)
    - Setzen der Quelltext-Kodierung für korrekte Verwendung von Sonderzeichen
- [**setspace**](https://ctan.org/pkg/setspace)
    - Setzen von Zeilenabständen
<!-- - [**amsmath**](https://ctan.org/pkg/amsmath)   
    - Ausgerichtetes Setzen von mehrstufigen Berechnungen / Herleitungen / Beweisen
- [**glossaries**](https://ctan.org/pkg/glossaries)
    - Verschiedene Index-Typen für Stichwortverzeichnis, Glossar, Abkürzungsverzeichnis, ...
- [**hyperref**](https://ctan.org/pkg/hyperref)
    - Klickbare Referenzen innerhalb des PDF Dokuments
- [**makeidx**](https://ctan.org/pkg/makeidx)
    - Erzeugung von Stichwortverzeichnissen -->

--
### Beispiel-Dokumentkopf
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
Paragraphen können links oder rechtsbündig gesetzt werden mit den Umgebungen **flushleft** bzw. **flushright**

```latex[4-10]
\documentclass{article}

\begin{document}
  \begin{flushleft}
    Dieser Absatz wird linksbündig gesetzt.
  \end{flushleft}

  \begin{flushright}
    Dieser Absatz wird rechtsbündig gesetzt.
  \end{flushright}
\end{document}
```

---
Mit Hilfe der Umgebung **center** lassen sich Absätze zentriert ausrichten

```latex[4-6]
\documentclass{article}

\begin{document}
  \begin{center}
    Dieser Absatz wird zentriert gesetzt.
  \end{center}
\end{document}
```

--
### Listen
Stichpunkte von Listen lassen sich innerhalb der **itemize** Umgebung mit dem **\item** Befehl setzen.

```latex[4-7]
\documentclass{article}

\begin{document}
  \begin{itemize}
    \item Äpfel
    \item Birnen
  \end{itemize}
\end{document}
```

--
### verschachtelte Listen

```latex[4-7,12|8-11]
\documentclass{article}

\begin{document}
  \begin{itemize}
    \item Äpfel
    \item Birnen
    \item Gemüse:
        \begin{itemize}
            \item Tomaten
            \item Gurken
        \end{itemize}
  \end{itemize}
\end{document}
```

--
### Aufzählungen
Aufzählungspunkte lassen sich analog innerhalb der **enumerate** Umgebung mit dem **\item** Befehl setzen.

```latex[4-7]
\documentclass{article}

\begin{document}
  \begin{enumerate}
    \item Äpfel
    \item Birnen
  \end{enumerate}
\end{document}
```

--
### verschachtelte Aufzählungen

```latex[4-7,12|8-11]
\documentclass{article}

\begin{document}
  \begin{enumerate}
    \item Äpfel
    \item Birnen
    \item Gemüse:
        \begin{enumerate}
            \item Tomaten
            \item Gurken
        \end{enumerate}
  \end{enumerate}
\end{document}
```

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
## Kopf- und Fußzeilen
TODO

---
## Deckblatt
- kann mit der Umgebung **titlepage** eingefügt werden
- hat keine eigene Seitennummer
- keine Kopf- oder Fußzeilen

```latex[2-10]
...
\begin{titlepage}
  % Informationen für Titel setzen
  \title{Meine Arbeit}
  \author{Ich}
  \date{Heute}

  % Titel generieren
  \maketitle
\end{titlepage}
```

---
## Mathematische Symbole und Formeln
- Siehe Kapitel 16 [latex2e](https://ftp.agdsn.de/pub/mirrors/latex/dante/info/latex2e-help-texinfo/latex2e.pdf)  
- Befehle für Formeln und Symbole funktionieren entweder im **Math mode** oder in einer **displaymath**-Umgebung

--
### Math mode
- für mathematische Ausdrücke im Fliesstext
-
```latex
$ ... $
```
-
```latex
\( ... \)
```
-
```latex
\begin{math} ... \end{math}
```

```latex[5|7|9]
...

\begin{document}
  Die Funktionen
  $ \sin x$
  und
  \( \cos \)
  sowie
  \begin{math} \tan x \end{math}
  sind Winkelfunktionen.
\end{document}
```
--
### displaymath Umgebung
- platziert mathematische Formeln zentriert ausserhalb des Textes

```latex[5|7|9]
...

\begin{document}
  Ein Beispiel für ein bestimmtes Integral eines Polynoms ist dieses.

  \begin{displaymath}
    \int_{i=0}^k x^2 + x = \bigl[ \frac{1}{3} x^3 + \frac{1}{2} x^2 \bigr]_0_k
  \end{displaymath}
\end{document}
```

--
### Symbole, Brüche, Funktionen
- Pi **\\pi**
- Bruch **\\frac{1+x}{13}**
- Kubikwurzel **\\sqrt[3]{x}**

--
- Subscript **a_k**
- Exponent/Superscript **x^{3+i}**
- Integrale **\\int_{n=0}^{k} x**

---
## Tabellen

### tabular-Umgebung
- richtet Text Tabellen-artig aus
```latex[2-4]
...
\begin{tabular}{Spaltendefinition}
  ...
\end{tabular}
```
- erster Parameter bestimmt für die Spalten
    - die Textausrichtung
    - sowie die Platzierung vertikaler Ränder

--
- Verwendung folgender Zeichen für den Parameter *Spaltendefinition*
    - c zentriert
    - l linksbündig
    - r rechtsbündig
    - | vertikalen Rand einfügen
```latex[2-4]
...
\begin{tabular}{|cc|}
  ...
\end{tabular}
```

--
- innerhalb der tabular-Umgebung werden
  - Zeilen mit <b>\\\\</b> abgeschlossen
  - Zell-Inhalte mit **&** getrennt
  - horizontale Linien mit **\\hline** platziert

```latex[2-9]
...
% Tabelle mit vertikalen Rändern | aussen
% ... und horizontalen Rändern ganz oben und ganz unten
\begin{tabular}{|ll|}
    \hline
    Äpfel & 37,33 \\
    Birnen & 16,00 \\
    \hline
\end{tabular}
```

--
#### Spalten verbinden
- ist mit dem Befehl **\multicolumn** möglich
- Syntax für den Parameter *Spaltendefinition* ist identisch zu dem der tabular-Umgebung

```latex[]
\multicolumn{Anzahl}{Spaltendefinition}
```

--
- mit **\\multicolumn** ist es auch möglich, die Textausrichtung für einzelne Zellen zu überschreiben

```latex[2-12]
...
% Tabelle mit vertikalen Rändern | aussen
% ... und horizontalen Rändern ganz oben und ganz unten
\begin{tabular}{|ll|}
    \hline
    \multicolumn{1}{|c}{\textbf{Titel 1. Spalte}}
    & \multicolumn{1}{c|}{\textbf{Titel 1. Spalte}} \\
    \hline
    Äpfel & 37,33 \\
    Birnen & 16,00 \\
    \hline
\end{tabular}
```

--
#### Tabellen
- sind **Gleitobjekte** und werden durch LaTeX automatisch positioniert
- werden um eine Tabular-Umgebung herum im Code platziert
- werden automatisch durchnummeriert
- haben einen Titel


```latex[2-7]
...
\begin{table}
    \caption{Tabellentitel}
    \begin{tabular}{...}
      ...
    \end{tabular}
\end{table}
```

---
## Bilder / Zeichnungen
### Grafiken
- Können mit dem Paket **graphics**
- ... und dem Befehl **\\includegraphics** eingefügt werden

```latex[1,5]
\usepackage{graphics}
...
\begin{document}
  ...
  \includegraphics{Pfad zur Bilddatei}
  ...
\end{document}
```

--
### figure Umgebung
- sind **Gleitobjekte** und werden durch LaTeX automatisch positioniert
- werden um Grafiken herum im Code platziert
- werden automatisch durchnummeriert
- haben einen Titel

```latex[2-5]
...
\begin{figure}
  \caption{Titel der Grafik}
  \includegraphics{sample.jpg}
\end{figure}
```

TODO \includegraphics[width=10cm]{sample.jpg} wirft Fehler im overleaf!

---
# Fragen
