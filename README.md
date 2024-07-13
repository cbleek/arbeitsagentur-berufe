# Berufe der Arbeitsagentur

Die CSV Listen wurden erstellt per:

```
xsltproc convert_to_csv.xsl vam_beruf_kurz.xml |grep ',"a",'  > vam_beruf_kurz_a.csv
```

```
xsltproc convert_to_csv.xsl vam_beruf_kurz.xml |grep ',"t",'  > vam_beruf_kurz_t.csv
```