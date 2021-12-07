#!/bin/bash

wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/hg19.fa.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/refMrna.fa.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/mrna.fa.gz

gunzip -c hg38.fa.gz | makeblastdb -in - -dbtype nucl -out hg38.fa -title "UCSC Genome hg38"
gunzip -c hg19.fa.gz | makeblastdb -in - -dbtype nucl -out hg19.fa -title "UCSC Genome hg19"
gunzip -c mrna.fa.gz | makeblastdb -in - -dbtype nucl -out mrna.fa -title "GenBank mRNA"
gunzip -c refMrna.fa.gz | makeblastdb -in - -dbtype nucl -out refMrna.fa -title "RefSeq mRNA"
