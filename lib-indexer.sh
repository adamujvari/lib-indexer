#!/bin/bash
extract_plaintext () {
  echo " --- Extract plaintext from PDFs --- ";
  for sub_folder in Collection/*
  do
    mkdir -p plaintext
    for pdf in $sub_folder/*.pdf
    do
      java -jar pdfbox-app-2.0.8.jar ExtractText $pdf
    done
    mv $sub_folder/*.txt plaintext/
  done
}

build_index () {
  echo " --- Build Search Index --- ";
  java org.apache.lucene.demo.IndexFiles -docs plaintext/
}

search_query () {
  echo " --- Enter Search Query --- ";
  java org.apache.lucene.demo.SearchFiles
}

while true; do
  clear
  echo " --- Document indexing and retrieval using text and images. ---";
  echo " Mode | Description"
  echo "  1   | Extract PDFs into plaintext";
  echo "  2   | Build Search Index";
  echo "  3   | Enter Search Query";
  echo "  4   | Quit";
  echo " --- Please enter operation mode: ";
  read input

  if [ $input == '1' ]; then
    extract_plaintext

  elif [ $input == '2' ]; then
    build_index
  
  elif [ $input == '3' ]; then
    search_query

  elif [ $input == '4' ]; then
    clear
    exit 0
  fi

done

