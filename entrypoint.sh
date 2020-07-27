#!/bin/sh

hugo version
hugo env
postcss --version
autoprefixer --version
babel --version
pygmentize -V
asciidoctor --version

pwd

npm install
cp -r /themes/docsy  ./themes/

hugo $@