import csv
from sys import argv

#header to put at the top of each file
header =r"""\documentclass[parskip]{scrartcl}
\usepackage[margin=5mm]{geometry}
\usepackage{tikz}
\usepackage{pifont}
\usepackage{anttor}
\usepackage[utf8]{inputenc}
\newcommand*\subclass[2]{\tikz[baseline=(char.base)]{\node[shape=circle,black,fill=#1,draw,inner sep=.5pt] (char) {\small #2};}}
\newcommand*\class[1]{\tikz[baseline=-.6ex]\draw[black,fill=#1] (0,0) circle (1ex);}
\newcommand*\rsc[2]{\rotatebox[origin=c]{-90}{\subclass{#1}{#2}}}
\graphicspath{ {images/} }
\begin{document}
\pgfmathsetmacro{\cardwidth}{6.6}
\pgfmathsetmacro{\cardheight}{9.2}
\pgfmathsetmacro{\stripwidth}{0.6}
\pgfmathsetmacro{\strippadding}{0.1}
\pgfmathsetmacro{\textpadding}{0.1}
\pgfmathsetmacro{\ruleheight}{0.15}
\definecolor{Abj}{rgb}{0.0, 0.44, 0.87}
\definecolor{Con}{rgb}{0.85, 0.65, 0.13}
\definecolor{Div}{rgb}{1.0, 0.98, 0.94}
\definecolor{Enc}{rgb}{0.41, 0.16, 0.38}
\definecolor{Evo}{rgb}{0.89, 0.15, 0.21}
\definecolor{Ill}{rgb}{0.75, 0.75, 0.75}
\definecolor{Nec}{rgb}{0, 0, 0}
\definecolor{Tra}{rgb}{0.12, 0.3, 0.17}
\definecolor{dAbj}{rgb}{1, 1, 1}
\definecolor{dCon}{rgb}{0, 0, 0}
\definecolor{dDiv}{rgb}{0, 0, 0}
\definecolor{dEnc}{rgb}{1, 1, 1}
\definecolor{dEvo}{rgb}{1, 1, 1}
\definecolor{dIll}{rgb}{0, 0, 0}
\definecolor{dNec}{rgb}{1, 1, 1}
\definecolor{dTra}{rgb}{1, 1, 1}
\definecolor{red}{HTML}{C41F3B}
\definecolor{blue}{HTML}{69CCF0}
\definecolor{yellow}{HTML}{FFF569}
\definecolor{orange}{HTML}{FF7D0A}
\definecolor{pink}{HTML}{F58CBA}
\definecolor{green}{HTML}{ABD473}
\definecolor{purple}{HTML}{9482C9}
"""

#takes output file as an argument (.tex)
filename = argv[1]

#'i' is the template file, each variable is marked with an @ and
#a single letter code, the dictionary for which is below.
i = open('latex_example_card_short.tex').read()
#'f' is the card data
#f = open("programData.csv")
f = open("test.csv")
#parses the csv and creates an iterable dictionary called 'reader'
reader = csv.DictReader(f)

#begins writing the file
target = open(filename, 'w')
target.truncate()

#empty utility arrays, mostly there for debugging
at = []
new = []

#dictionary of single letter codes and their cooresponding key in
#the main CSV dictionary
defi = {
"b": 'Class',
"s": 'SpellName',
"l": 'Level',
"t": 'AttackSavingThrow',
"a": 'TargetArea',
"r": 'Range',
"d": 'DamageHeal',
"k": 'DAMType',
"e": 'AdditionalDetail',
"h": 'PerHigherLevel',
"0": 'School',
"1": 'PageName',
"2": 'id',
"3": 'V',
"4": 'S',
"5": 'M',
"6": 'Component',
"7": 'Concentration',
"8": 'Ritual',
"9": 'CastingTime',
"c": 'Duration',
"f": 'Cost',
"g": 'Concentration'
}

#begins file write with the header
target.write(header+'\n')

target.write("\\begin{tabular}{@{}c@{\,\,\,\,}c@{\,\,\,\,}c@{}}" + "\n" + "\n")

for card, count in enumerate(reader):
    #resets to template each time
    curr_card = i

    #iterates through each letter looking for @ signs
    for spot, c in enumerate(curr_card):
        if curr_card[spot] == "@":
            #looks 1 space ahead of the @ for dict value
            #then replaces @x with the dictionary value (dict referencing another dict)
            curr_card = curr_card.replace("@"+curr_card[spot+1], count[defi[curr_card[spot+1]]])
    #writes before the loop clears edited values
    target.write(curr_card + "\n" + "\n")
    if (card)%3 == 2:
        target.write("\n" + "%True" + str(card) + "\n" + "\\end{tabular}" + "\n" + "\\newline" + "\\begin{tabular}{@{}c@{\,\,\,\,}c@{\,\,\,\,}c@{}}" + "\n" + "\n")
    else:
        target.write("\n" + "&" + "%False" + str(card) + "\n" + "\n")

target.write('\\end{tabular}' + "\n" + '\end{document}')

print("Ok.")