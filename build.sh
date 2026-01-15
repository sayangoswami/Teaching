#!/bin/bash

# pandoc Notes/cosc445/lecture01.md \
#   -s \
#   -t html5 \
#   --template templates/notes.html \
#   --css ../../css/accessible-notes.css \
#   --toc \
#   --toc-depth=3 \
#   --section-divs \
#   --metadata title="Lecture 01: Scheduling" \
#   --metadata lang="en" \
#   --mathjax \
#   -o output/cosc445/lecture01.html


pandoc Notes/cosc445/lecture01.md \
  -t html5 \
  --standalone \
  --template templates/notes.html \
  --toc \
  --toc-depth=2 \
  --section-divs \
  --metadata lang=en \
  --css ../../css/theme.css \
  --css ../../css/tufte.css \
  --css ../../css/skylighting-solarized-theme.css \
  --mathjax \
  -o output/cosc445/lecture01.html
