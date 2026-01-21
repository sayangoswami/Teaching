#!/bin/bash

name="cosc445/lec01"

pandoc Notes/$name.md \
  -t html5 \
  --standalone \
  --template templates/notes.html \
  --toc \
  --toc-depth=2 \
  --section-divs \
  --metadata lang=en \
  --mathjax \
  --css ../../css/theme.css \
  --css ../../css/tufte.css \
  --css ../../css/skylighting-solarized-theme.css \
  -o output/$name.html
