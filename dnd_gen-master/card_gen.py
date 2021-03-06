import csv
from sys import argv

#takes output file as an argument (.tex)
filename = argv[1]

#'i' is the template file, each variable is marked with an @ and
#a single letter code, the dictionary for which is below.
i = open('latex_example_card_short.tex').read()
#'f' is the card data
f = open("programData.csv")
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
"n": 'Component',
"p": 'PageName'
}

#begins file write with the header
#target.write(header+'\n')


target.writelines(['\documentclass[parskip]{scrartcl}',
r'\usepackage[margin=15mm]{geometry}',
r'\usepackage{tikz}',
r'\usepackage{pifont}',
r'\usepackage{anttor}',
r'\usepackage[utf8]{inputenc}',
r'\graphicspath{ {images/}}',
r'\\begin{document}',
r'\pgfmathsetmacro{\cardwidth}{5}',
r'\pgfmathsetmacro{\cardheight}{8}',
r'\pgfmathsetmacro{\stripwidth}{0.6}',
r'\pgfmathsetmacro{\strippadding}{0.1}',
r'\pgfmathsetmacro{\\textpadding}{0.1}',
r'\pgfmathsetmacro{\\ruleheight}{0.15}'])

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
    target.write(curr_card + "\n")

#target.write('\end{document}')

print("Ok.")
