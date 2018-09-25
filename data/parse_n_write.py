import csv
from sys import argv

filename = argv[1]

header = """\documentclass[parskip]{scrartcl}
\usepackage[margin=15mm]{geometry}
\usepackage{tikz}
\usepackage{pifont}
\usepackage{anttor}
\usepackage[utf8]{inputenc}

\graphicspath{ {images/} }

\\begin{document}
\pgfmathsetmacro{\cardwidth}{5}
\pgfmathsetmacro{\cardheight}{8}
\pgfmathsetmacro{\stripwidth}{0.6}
\pgfmathsetmacro{\strippadding}{0.1}
\pgfmathsetmacro{\\textpadding}{0.1}
\pgfmathsetmacro{\\ruleheight}{0.15}

"""
tabular = "\\begin{tabular}{ccc}"
begin_open = """\\begin{tikzpicture}
\draw[rounded corners=0.2cm] (0,0) rectangle (\cardwidth,\cardheight);
\\fill[@color,rounded corners=0.1cm] (\strippadding,\strippadding) rectangle (\strippadding+\stripwidth,\cardheight-\strippadding) node[rotate=90,above left,white,font=\large] {\\rotatebox[origin=c]{-90}{"""
begin_mid = "} \\bf "
begin_end = " \\rotatebox[origin=c]{-90}{"
level_close = "}};\n"

node_open = """\\node[text width=(\cardwidth-\strippadding-\stripwidth-2*\\textpadding-0.3)*1cm,below right] at (\strippadding+\stripwidth+\\textpadding,\cardheight-\\textpadding) {
    {\Large """
node_close = " \\}"

throw_open = '{\scriptsize \it if'
throw_close = '\\\*\\}'

target_open = '{\scriptsize \\bf Target:\,\,}{\scriptsize '
target_close = '\\}'

range_open = '{\scriptsize \\bf Range:\,\,}{\scriptsize '
range_close = '\\}'

damage_open = '{\scriptsize \\bf Roll:\,\,}{\scriptsize '
damage_close = '\,\,}{\scriptsize \it if'

damageType_close = '}'

detail_open = """\\vrule width \\textwidth height 1pt \\[-3pt]
\\\hspace\\
{\scriptsize \it """
detail_close = ' \\}'

higherLv_open = '        {\scriptsize if'
higherLv_close = '}'

components_open = """\\vfill
{\scriptsize if"""
components_close = ' ('

pageNumber_close = """)} };

\end{tikzpicture}"""

f = open("programData.csv")
reader = csv.DictReader(f)

target = open(filename, 'w')
target.truncate()

target.write(header)
target.write('\n')

for card in reader:
    target.write(begin_open)
    target.write(card['Class'])
    target.write(begin_mid)
    target.write(begin_end)

    target.write(node_open)
    target.write(card['SpellName'])
    target.write(node_close)

    target.write(card['Level'])
    target.write(level_close)

    target.write(throw_open)
    target.write(card['AttackSavingThrow'])
    target.write(throw_close)

    target.write(target_open)
    target.write(card['TargetArea'])
    target.write(target_close)

    target.write(range_open)
    target.write(card['Range'])
    target.write(range_close)

    target.write(damage_open)
    target.write(card['DamageHeal'])
    target.write(damage_close)

    target.write(card['DAMType'])
    target.write(damageType_close)

    target.write(detail_open)
    target.write(card['AdditionalDetail'])
    target.write(detail_close)

    target.write(higherLv_open)
    target.write(card['PerHigherLevel'])
    target.write(higherLv_close)

    target.write(components_open)
    target.write(card['Component'])
    target.write(components_close)

    target.write(card['PageName'])
    target.write(pageNumber_close)

target.write('\end{document}')


print("Ok.")
