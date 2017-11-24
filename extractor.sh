#!/bin/bash
clear
echo " --- PDF Text Extractor --- ";
for f in Collection/*
do
  for sub_f in $f/*.pdf
  do
    java -jar pdfbox-app-2.0.8.jar ExtractText $sub_f

  done

done
