#!/bin/sh

echo "Convert Ausbildungsberufe"
xsltproc convert_to_csv.xsl vam_beruf_kurz.xml |grep ',"a",'  | sed 's/"ja"/"1"/g' | sed 's/"nein"/"0"/g' > vam_beruf_kurz_a.csv

echo "Convert Berufe"
xsltproc convert_to_csv.xsl vam_beruf_kurz.xml |grep ',"t",'  | sed 's/"ja"/"1"/g' | sed 's/"nein"/"0"/g' > vam_beruf_kurz_t.csv

echo "Convert All"
xsltproc convert_to_csv.xsl vam_beruf_kurz.xml | sed 's/"ja"/"1"/g' | sed 's/"nein"/"0"/g' > vam_beruf_kurz.csv