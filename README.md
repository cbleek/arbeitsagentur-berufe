# Berufe der Arbeitsagentur

## vam_beruf_kurz.csv

Die CSV Listen wurden erstellt per:

```
xsltproc convert_to_csv.xsl vam_beruf_kurz.xml |grep ',"a",'  > vam_beruf_kurz_a.csv
```

```
xsltproc convert_to_csv.xsl vam_beruf_kurz.xml |grep ',"t",'  > vam_beruf_kurz_t.csv
```
Die CSV kann einfach in zB eine MySQL Tabelle umgewandelt werden. Sofern man
Rechte auf `LOAD DATA INFILE` hat und eine entsprechend Tabelle existiert
funktioniert ein import per: 

```
mysql> load data infile "vam_beruf_kurz.csv" into table berufe fields terminated by "," enclosed by '"';
Query OK, 15242 rows affected (0.30 sec)
Records: 15242  Deleted: 0  Skipped: 0  Warnings: 0
```


```
CREATE TABLE `berufe` (
  `id` int(11) NOT NULL,
  `bkz` varchar(20) DEFAULT NULL,
  `type` char(1) NOT NULL,
  `lbkgruppe` set('1110','1120','1130','1140','1150','1210','1220','1310','1410','1910','2110','2120','2130','2210','2310','2320','2330','2340','2410','2420','2430','2440','2450','2460','2470','2480','2910','2920','2930','2940','3110','3120','3130','3210','3220','3910','3920','4910','5110','5120','5130','5140','5910','5920','5930','5940','6110','6120','6130','6140','6910','6920','6930','6940','7910','9910') DEFAULT NULL,
  `qualifikationsNiveaus` set('1','2','3','4') DEFAULT NULL,
  `hochschulberuf` tinyint(1) DEFAULT NULL,
  `ebene` int(11) DEFAULT NULL,
  `zustand` enum('A','E','L','M','R','S') DEFAULT NULL,
  `kuensteler` tinyint(1) DEFAULT NULL,
  `bezeichnungNeutral` varchar(200) DEFAULT NULL,
  `bezeichnungKurzNeutral` varchar(200) DEFAULT NULL,
  `suchnameNeutral` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
```

## vam_beruf_kurz.sql

`mysqldump --skip-opt ba berufe > vam_beruf_kurz.sql`

## vam_beruf_kurz.json

`node csv2json.js`

