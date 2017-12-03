# lib-indexer
## Document indexing and retrieval using text and images, supporting literature search in the visualization domain.

Practical Assignment for Digital Libraries (711.010)

Group details:
- Adam Ujvari, 01232056, adam.ujvari@student.tugraz.at
- Nikita Lvov, 01639595, lvov@student.tugraz.at

# Description
- We build a script that uses _pdfbox_ to obtain the plaintexts, _lucene_ to build and search an index of the collection. 

# How to run
- Copy all jars from the dependencies folder into your Java CLASSPATH folder
- Run the _lib-indexer.sh_ script
- Select desired operation mode

# Documentation of the tasks implemented
## 1.1 - Text extraction
We used pdfbox-app to extract the plaintext of a pdf. To extract all pdf-s we built a bash function that loops through all the sub folders and processess every pdf. After each subfolder is done the new plaintext files are copied into the root/plaintext folder.
During extraction a number of warnings are shown, these are mostly for some unknown fonts that were used. This has little to no inpact on the resulting plaintext. 
The extraction of the 1.5 GB pdf collection took about 15 minutes to complete on a 2core/4thread cpu.

## 1.2 - Text indexing
We used _lucene_ to build an index from the extracted data. This has to happen before anything can be searched. If later more files are added to the existing plaintext library an index update has to be performed to include them in the search results.

## 1.3 Interactive Seach
For the simple query interface we decided to keep using the terminal and adjusted the existing script for it. After there exists an index one can select the search operation mode. This allows to enter keywords the user wants to find.
First the number of search results are shown, then results are listed in pages. Each page displays 10 hits which are displayed with the names of the corresponding files. 
To exit search simply hit enter when prompted for entering a keyword.

Supported search formats:
- Single keywords: returns all the documents where the keyword appears. [eg.: binary]
- Listing of keywords: returns documents where either one of the terms was found. [eg.: binary bus]
- Simple logic: returns according to the input logic. [eg.: (auto AND bus) OR binary]
  (this would return all the documents where both _auto_ and _bus_ or where _binary_ appears)

## 1.4 Ranking functions


# Misc
- use rights _chmod 755_ to be able to run the scripts

