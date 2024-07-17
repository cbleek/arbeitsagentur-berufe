var fs = require('fs');
const path = require('path');
var csvjson = require('csvjson');

var options = {
    headers : "id,bkz,type,lbkgruppe,qualifikationsNiveaus,hochschulberuf,ebene,zustand,kuenstler,bezeichnungNeutral,bezeichnungKurzNeutral,suchnameNeutral",
    delimiter : ',',
    quote     : '"'
};

var read = fs.createReadStream(path.join(__dirname, 'vam_beruf_kurz.csv'), { encoding : 'utf8'} );
var write = fs.createWriteStream(path.join(__dirname, 'vam_beruf_kurz.json'));
var toObject = csvjson.stream.toObject(options);
var stringify = csvjson.stream.stringify();
read.pipe(toObject).pipe(stringify).pipe(write);



  
