
"""
	This script recives path to folder with markdown files and
	converts them to xelatex format
"""

import sys
import glob
import subprocess

path = sys.argv[1]
files = glob.glob(path + "*.md")

def process(out):
	out = out.replace("\r","").replace("`","'")
	return out

output = ""
for f in files:
	output += process(subprocess.check_output("pandoc -f markdown -t latex '" + f + "'", shell=True))

template = open("template.latex").read()
print template.replace("[:BODY:]", output)
