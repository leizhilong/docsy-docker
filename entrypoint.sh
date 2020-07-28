#!/bin/sh

hugo version
hugo env
postcss --version
autoprefixer --version
babel --version
pygmentize -V
asciidoctor --version

pwd

echo "Copying themes"
cp -r /themes/docsy  ./themes/
ls -l

$@