#!/bin/bash

pandoc Notes/cosc445/lec01.md \
  -t html5 \
  --standalone \
  --template templates/notes.html \
  --toc \
  --toc-depth=2 \
  --section-divs \
  --metadata lang=en \
  --mathjax \
  --highlight-style=zenburn \
  --css ../../css/theme.css \
  --css ../../css/tufte.css \
  -o output/cosc445/lec01.html
