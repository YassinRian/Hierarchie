
var kpl_prmts = ['p_jaar', 'par_kpl1', 'par_kpl2', 'par_kpl3', 'par_kostenpl'];
var kdr_prmts = ['p_jaar', 'par_kdr1', 'par_kdr2', 'par_kdr3', 'par_kostendr'];

var prompts = cognos.Report.getReport().prompt._ht.map( (x)=> { 
var filters = {};
filters.naam = x["@naam"];
filters.parameter = x["@parameter"]
if (typeof x.c[0].n != 'undefined' && x.c[0].n === 'selectChoices') {
Object.assign(filters, {waarde: x.c[0].c.map( (x) => {return ( x["@displayValue"] ? x["@displayValue"] : x["@useValue"] )} )})
} else {
Object.assign(filters, {waarde: null})
} 
return filters;
});

// ALLE
var prompt_waarden_alle = prompts.filter( (x) => { return x.waarde}).map( (x) => {
 var waarde = "<p style='margin: 0.3em 0;'>" + x.naam + ": " + x.waarde + "</p>"
return waarde
});

// KPL
var prompt_waarden_kpl = prompts.filter( x => {return x.waarde}).filter( x => kpl_prmts.some( y => y === x.parameter) ).map( (prmt) => { 
var waarde = "<p style='margin: 0.3em 0;'>" + prmt.naam + ": " + prmt.waarde + "</p>"; 
return waarde });

// KDR
var prompt_waarden_kdr = prompts.filter( x => {return x.waarde}).filter( x => kdr_prmts.some( y => y === x.parameter) ).map( (prmt) => { 
var waarde = "<p style='margin: 0.3em 0;'>" + prmt.naam + ": " + prmt.waarde + "</p>"; 
return waarde });

$x('.ctr_ftr_2_2_1, .ctr_ftr_2_2_3').append( prompt_waarden_kpl.map( (x) => { return x } ));
$x('.ctr_ftr_2_2_2, .ctr_ftr_2_2_4').append( prompt_waarden_kdr.map( (x) => { return x } ));
$x('.selectie_jaar').append( prompt_waarden_alle.map( (x) => { return x } ));