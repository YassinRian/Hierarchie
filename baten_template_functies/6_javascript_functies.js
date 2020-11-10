// Auteur: Yassin Rian
// Email/Tel: yassin.rian@rianconsulting.nl/0615674495
// Datum ontwikkeling: 21/03/2020

/************************************************* aanmaken filter panel ************************************************/

// <script language="javascript"> 
$x(document).ready(function () {
  $x(".wrapper").prepend( parent.canvas_html() );
});
// </script>

/************************************************* aanmaken tab en prompt structuren ************************************************/

// <script language="javascript">
/*------------------------------------------------------------------------------------------------------------------*/
$x(document).ready(function () {

    //**********
    // Procedure/Functie: aanmaken_grid_layout()
    // Beschrijving: 'Deze functie maakt de grid layout aan zoals deze is gedefinieerd in de grid datastructuur'
    //**********

    function aanmaken_grid_layout() {
        var nummer = 0;
        var kolom__struct = '';
        var grid__struct = '';

        for (rij = 0; rij < grid_struct__obj.aantal_rijen; rij++) {
            kolom__struct = '';
            for (kolom = 0; kolom < grid_struct__obj.aantal_kolommen; kolom++) {
                nummer = nummer + 1
                kolom__struct += `<div class="grid_${nummer} grid_kolom ${ kolom ? 0 : 'grid_kolom_1' }"></div>`;
            }
            grid__struct += `<div class="uk-child-width-expand@m" style="margin-top:5px;" uk-grid>${kolom__struct}</div>`;
        }
        return grid__struct; // geeft de grid structuur als resultaat terug
    }
/*------------------------------------------------------------------------------------------------------------------*/
    //**********
    // Procedure/Functie: aanmaken_card_tabs()
    // Beschrijving: 'Deze functie maakt de card tab stuructuur aan waarin de visualisaties worden geplaatst'
    //**********

    function aanmaken_card_tabs(idx)
    {
            var v_card_tab__html = ''; // deze variable zal de volledige tab structuur bevatten
            var v_card_tab_pgnaam__html = ''; // deze variable bevat de html voor de tab pagina namen
            var v_card_tab_pgcnt__html = ''; // deze variable bevat de html voor de tab content
            var v_card_tab_naam__str = card_tabs_data__arr[idx].card_tab_naam__str; // hier wordt de card tabnaam opgeslagen
    	    var v_card_tab_nr__str = idx + 1;

            card_tabs_data__arr[idx].card_tab_pg__arr.map((card_tab_pg__obj, idx2) => {

            var titel = card_tab_pg__obj.card_tab_pg_data__obj.titel;
            var viz = card_tab_pg__obj.card_tab_pg_data__obj.visualisatie;
            var info = card_tab_pg__obj.card_tab_pg_data__obj.info;
	    var iframe_ref = (typeof card_tab_pg__obj.card_tab_pg_data__obj.iframe_ref !== 'undefined') ? card_tab_pg__obj.card_tab_pg_data__obj.iframe_ref : '';

                var v_card_tab_pgnr__str = idx2 + 1;
                // deze variable bevat de volledige prmt groepen structuur uit de aanmaken_prmt_groep functie
		if (typeof card_tab_pg__obj.card_tab_pg_naam__str !== 'undefined') {
			v_card_tab_pgnaam__html += `<li class='${v_card_tab_naam__str}_${v_card_tab_pgnr__str}_pgnaam'><a href="#" class="${iframe_ref}">${card_tab_pg__obj.card_tab_pg_naam__str}</a></li>`;
		}
                	v_card_tab_pgcnt__html += `<li class="${v_card_tab_naam__str}_${v_card_tab_pgnr__str}_pgcnt">${card_struct(v_card_tab_nr__str, viz(v_card_tab_nr__str, iframe_ref), titel, info)}</li>`;
            })
            // dit is de volledige tab structuur
            v_card_tab__html += `<div class='${v_card_tab_naam__str}_cnt' style='padding:10px;'><ul class='${v_card_tab_naam__str}_pgnaam'  style="${v_card_tab_pgnaam__html ? '' : 'display:none;'}" uk-tab>${v_card_tab_pgnaam__html ? v_card_tab_pgnaam__html : '<li><div></div></li>'}</ul><ul class='uk-switcher ${v_card_tab_naam__str}_pgcnt'>${v_card_tab_pgcnt__html}</ul></div>`;
        return v_card_tab__html; // geeft als resultaat de tab structuur terug
    }
/*------------------------------------------------------------------------------------------------------------------*/
    //**********
    // Procedure/Functie: toevoegen_tabs_in_grid()
    // Beschrijving: 'Deze functie voegt elke card tab aan de daarvoor bestemde grid'
    //**********

 function toevoegen_card_tabs_in_grid() {
        card_tabs_data__arr.map( (card_tab__obj, idx) => {
            $x('.grid_' + eval(idx + 1)).append( aanmaken_card_tabs(idx))
        })
    }
/*------------------------------------------------------------------------------------------------------------------*/
    //**********
    // Procedure/Functie: aanmaken_prmt_groepen() : subfunctie
    // Beschrijving: 'Deze functie creert een prmt groep uit de ingegeven prmt groep parameter, adv de ingegeven parameter wordt de juist prmt groep data geselecteerd uit prmt_groepen_data__arr data structuur'
    //**********

    function aanmaken_prmt_groep(p_prmt_groep_naam__str)
    {
        // ************
        // 'Hier wordt onder andere de input structuur opgeslagen in een variabele, verder wordt het prmt_groep object gefilterd obv de ingegeven parameter.'
        // ************
        var v_prmt_groep_naam__str = p_prmt_groep_naam__str;
        var input_struct__func = (id, name, label) => `<input id="input_${id}" name="${name}" class="uk-input uk-form-small" type="text" placeholder="${label}" required autocomplete="off">`;
        var v_prmt_groep_cnt__html = '';
        var v_prmt_data__arr = prmt_groepen_data__arr.filter(prmt__obj => Object.keys(prmt__obj)[0] === v_prmt_groep_naam__str); // op basis van de ingegeven parameter wordt de juist prmt groep opgehaald, Object.Keys(prmt__obj) geeft een array terug vandaar de [0] !

        // ************
        // 'Hier wordt de gefilterde prmt_groep data object doorlopen, de verschillende data elementen in het object worden voor het gemak in variabelen opgeslagen.'
        // 'Open data element wordt obv van aanwezigheid omgezet naar een class naam die de UIKIT framework gebruikt om een deel van de accordion open te houden.'
        // ************

        v_prmt_data__arr[0][v_prmt_groep_naam__str /* referentie naar een prmt_groep */ ].map((prmt__obj, idx) => { // De benodigde Object zit in een array vandaar v_prmt_data__arr[0]
            var v_titel__str = prmt__obj.titel;
            var v_classnm__str = prmt__obj.classnm;
            var v_open__str = typeof prmt__obj.open !== 'undefined' ? 'class="uk-open"' : '';

            // ************
            // 'Hier wordt geverifieerd of het input data object bestaat, als deze bestaat wordt zowel de input als een prompt container aangemaakt.'
            // 'verder wordt een data object aan zowel de input als de classnm toegevoegd die de relatie geven tussen de twee elementen'
            // ************

            if (typeof prmt__obj.input_data !== "undefined") {
                var v_input_id__str = prmt__obj.input_data.id;
                var v_input_name__str = prmt__obj.input_data.name;
                var v_input_label__str = prmt__obj.input_data.label;

                v_prmt_groep_cnt__html += `<li ${v_open__str}><a class='uk-accordion-title' href='#'>${v_titel__str}</a><div class='uk-accordion-content'><div class="uk-margin">${input_struct__func(v_input_id__str, v_input_name__str, v_input_label__str)}</div><div class='${v_classnm__str}_cnt'></div></div></li>`;

                $x('.' + v_classnm__str).data({
                    'prmt_groep': prmt__obj.prmt_groep,
                    'tab_groep': prmt__obj.tab_groep
                });
                $x("#input_" + v_input_id__str).data({
                    'prmt_groep': prmt__obj.prmt_groep,
                    'tab_groep': prmt__obj.tab_groep
                });

            } else {
                // Hier wordt alleen de container voor de prompt aangemaakt.
                v_prmt_groep_cnt__html += `<li ${v_open__str}><a class='uk-accordion-title' href='#'>${v_titel__str}</a><div class='uk-accordion-content'><div class='${v_classnm__str}_cnt'></div></div></li>`;
                $x('.' + v_classnm__str).data({
                    'prmt_groep': prmt__obj.prmt_groep,
                    'tab_groep': prmt__obj.tab_groep
                });
            }
        });
        // ************
        // 'Hier wordt de aangemaakte v_prmt_groep_cnt toegevoegd aan de v_prmt_groep_struct en deze wordt teruggegeven als de functie wordt uitgevoerd'
        // ************
        var v_prmt_groep_struct__html = `<div class="prmt_groep ${v_prmt_groep_naam__str}_cnt"><ul uk-accordion>${v_prmt_groep_cnt__html}</ul></div>`;
        return v_prmt_groep_struct__html;
    }
/*------------------------------------------------------------------------------------------------------------------*/
    function aanmaken_filter_tabs()
    //**********
    // Procedure/Functie: aanmaken_tabs()
    // Beschrijving: 'Deze functie maakt de filter tab structuur aan obv de filter_tabs_data__arr data structuur
    //**********
    {
        var v_filter_tab__html = '';
        filter_tabs_data__arr.map(filter_tab_data__obj => {

            var v_filter_tab_pgnaam__html = '';
            var v_filter_tab_pgcnt__html = '';
            var v_filter_tab_naam__str = filter_tab_data__obj.filter_tab_naam__str; // hier wordt de filter tab naam opgehaald

            // de loop die de filter_tab_pagina_naam_data__arr leest
            filter_tab_data__obj.filter_tab_pg__arr.map((filter_tab_pg__obj, idx) => {
                var idx = idx + 1;
                // de functie aanmaken_prmt_groep wordt aangeroepen voor het aanmaken van de prmt groepen containers die onderdeel zijn van bepaalde tabs
                var v_prmt_groep__html = filter_tab_pg__obj.prmt_groepen__arr.map(prmt_groep__str => aanmaken_prmt_groep(prmt_groep__str));
                v_filter_tab_pgnaam__html += `<li class='${v_filter_tab_naam__str}_${idx}_pgnaam uk-text-bold'><a href="#">${filter_tab_pg__obj.filter_tab_pgnaam__str}</a></li>`;
                v_filter_tab_pgcnt__html += `<li class="${v_filter_tab_naam__str}_${idx}_pgcnt uk-text-bold"><div>${v_prmt_groep__html}</div></li>`;
            });
            // Adv bovenstaande html variablen wordt de volledige tab structuur aangemaakt.
            v_filter_tab__html += `<div class='card_tab_cnt ${v_filter_tab_naam__str}_cnt' style='padding:20px;'><ul class='${v_filter_tab_naam__str}_pgnaam uk-flex-center' uk-tab>${v_filter_tab_pgnaam__html}</ul><div class="${v_filter_tab_naam__str}_out"></div><ul class='uk-switcher ${v_filter_tab_naam__str}_pgcnt'>${v_filter_tab_pgcnt__html}</ul></div>`;
        });
        return v_filter_tab__html; // geeft als resultaat de tab structuur terug
    }
/*------------------------------------------------------------------------------------------------------------------*/
    function toevoegen_prmts() {
    //**********
    // Procedure/Functie: toevoegen_prmts()
    // Beschrijving: Deze functie voegt de verschillende cognos prmts toe aan de eerder aangemaakte prmt_groep containers
    //**********
        prmt_groepen_data__arr.map(prmt_groep__obj => {
            Object.values(prmt_groep__obj).forEach((prmt_grp) => {
                prmt_grp.map(prmt => {
                    $x('.' + prmt.classnm + '_cnt').append($x('.' + prmt.classnm));
                });
            });
        });
    }
/*------------------------------------------------------------------------------------------------------------------*/
    function filter_pagina_opmaak() {
    //**********
    // Procedure/Functie: filter_pagina_opmaak()
    // Beschrijving: Deze functie voegt de aangemaakte tabs aan de filter container (bevat classnaam "filter_cnt"), tevens worden bepaalde groepen (zowel tabs, als prmt-groepen) geplaatst zoals deze zijn gedefinieerd in de filter_pagina__arr data structuur (zie data bestand)
    //**********
        $x('.filters_cnt').append(aanmaken_filter_tabs());
        if (filter_pagina__arr.length > 0) {

            filter_pagina__arr.map((filter_pagina__obj) => {
                var classnm = filter_pagina__obj.classnm__str;

                if (filter_pagina__obj.filter_cnt_groepen__arr.length > 0) {
                    filter_pagina__obj.filter_cnt_groepen__arr.map(filter_cnt_groep__obj => {
                        if (filter_cnt_groep__obj.type === 'prmt_groep') {
                            if (filter_cnt_groep__obj.positie === 'begin') {
                                $x('.' + classnm).prepend(aanmaken_prmt_groep(filter_cnt_groep__obj.naam))
                            } else {
                                $x('.' + classnm).append(aanmaken_prmt_groep(filter_cnt_groep__obj.naam))
                            }
                        } else {
                            if (filter_cnt_groep__obj.positie === 'begin') {
                                $x('.' + classnm).prepend($x('.' + filter_cnt_groep__obj.naam + '_cnt'))
                            } else {
                                $x('.' + classnm).append($x('.' + filter_cnt_groep__obj.naam + '_cnt'))
                            }
                        }
                    });
                };
            });
        }
    }
/*------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------*/
/*---- aanroepen van bovenstaande functies --------------------------------------------------------------------------------------------------------------*/

    $x('.grid_cnt').prepend(aanmaken_grid_layout())
    filter_pagina_opmaak();
    toevoegen_prmts();
    toevoegen_card_tabs_in_grid();
});


  // </script>


/* <script> */

// ********************************************************** functies voor de verschillende "buttons" in het dashboard *******************************************************//
$x(document).ready(function() {

$x('#button_prmt_1, #button_prmt_2').on('click', function (e) {
    e.preventDefault();
    parent.spinner_filter();
    $x('#offcanvas-usage').remove();
    var oCR = cognos.Report.getReport("_THIS_");
    oCR.sendRequest(cognos.Report.Action.REPROMPT);
  });



pdfBTN = function (e) {
 setTimeout(function () {  
   window.print();
 },100)  
}


UIkit.util.on('#offcanvas-usage', 'hide', function () {
    $x('.subheader').slideDown();
});

$x('.canvas_sb').on('click', function(){ 
UIkit.offcanvas('#offcanvas-usage').show();
})



$x('.uk-offcanvas-bar').scroll(function() {
if($x(this).scrollTop() === 0) {
  $x('#button_prmt_2').hide();
  $x('#button_prmt_1').show();
}
if ($x(this).scrollTop() + $x(this).innerHeight() >= $x(this)[0].scrollHeight) {
  $x('#button_prmt_2').show()
  $x('#button_prmt_1').hide()
}
});

});

// </script>


// ********************************************************** functies voor het weergeven van de filter selecties in de Subheader *******************************************************//

// <script> 

$x(document).ready(function() {


var kpl_prmts = ['p_jaar', 'par_kpl1', 'par_kpl2', 'par_kpl3', 'par_kostenpl'];
var kdr_prmts = ['p_jaar', 'par_kdr1', 'par_kdr2', 'par_kdr3', 'par_kostendr'];

var prompts = cognos.Report.getReport().prompt._ht.map( (x)=> { 
var filters = {};
filters.naam = x["@refQuery"];
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

});


// </script>


// ********************************************************** functies voor het dynamisch filteren van prompts via invoervelden  *******************************************************//

// <script language="javascript"> 


$x(document).ready(function () {

var selectie_Allewaarden_kpl = $x(".allewaarden_kpl").find("select > option").val();
var selectie_Allewaarden_kdr = $x(".allewaarden_kdr").find("select > option").val();
prmt_waarden_arr = [];

/*======================================== HULP FUNCTIES 1 ==========================================*/
 
 $x.extend($x.expr[":"], {
   data: $x.expr.createPseudo ?
     $x.expr.createPseudo(function(dataName) {
       return function(elem) {
         return !!$x(elem).data(dataName);
       };
     }) : function(elem, i, match) {
       return !!$x(elem).data(match[3]);
     }
 });



function isEmpty(obj) {
    for(var key in obj) {
        if(obj.hasOwnProperty(key))
            return false;
    }
    return true;
}


var delay = (function () {
  var timer = 0;
  return function (callback, ms) {
  clearTimeout(timer);
  timer = setTimeout(callback, ms);
 };
 })();

/*======================================== // HULP FUNCTIES 1 ==========================================*/


/*======================================== FUNCTION 3  ==========================================*/

// Deze functie filtert de lijst op basis van de input waarde  
function filter_lijst(e) {
  var in_val = $x.trim($x(e.currentTarget).val().replace(/\s+/g, '').toUpperCase()); // waarde een input element getrimmed
  var classnm = e.currentTarget.name; // ! class naam van selectie prompt bijhorend met de input
  var selec_vals = $x("." + classnm).find("select > option"); //option waarden van de select element
  var level_ = e.currentTarget.className.split(' ')[1]; // level van selectie prmt

  if (in_val.length < 2) {
    if (classnm === 'prmt_jaar') {
      selec_vals.slice(0, 2).hide().prop('selected', false).show();
    } else {
      selec_vals.prop('selected', false).show();
    }
  } else {
    selec_vals.hide().filter(function() {
      return $x(this).text().replace(/\u00A0/g, '').toUpperCase().indexOf(in_val) > -1
    }).show().prop('selected', true).get();
  }
}

/*======================================== // FUNCTION 3  ==========================================*/

/*======================================== FUNCTION 4  ==========================================*/

function legen_van_prmts (e, groep_key, groep_value, groep_soort) {
var arr_groep = [];
var nodename = e.currentTarget.nodeName;
var groep_elems = eval( "$x(':data("+ groep_key +")')" ); // de groep naam voor een aantal prompts

if (groep_soort === 'prmt'){
groep_elems.each( (idx, elem) => {
if ( $x(elem).data(groep_key) === groep_value ) {
arr_groep.push(elem);
}
});

} else {
groep_elems.each( (idx, elem) => {
if ( $x(elem).data(groep_key) !== groep_value ) {
arr_groep.push(elem);
}
});
}

if (nodename === 'SELECT') 
{
//---
 var selec_elem = $x("#" + e.currentTarget.id).parents().get(6);
 var curr_inp_elem_classnm = $x(selec_elem).attr('class').split(' ')[1];
 var curr_inp_elem_id = $x("input[name="+curr_inp_elem_classnm+"]").attr('id');
}
//---
else
{
//--
 var curr_inp_elem_id = e.currentTarget.id; // de id van de huidige input element
 var curr_inp_elem_classnm = e.currentTarget.name; // de naam attr van de huidige input element, nodig om de bijbehorende selectie prmpt op te halen 
//--
}

arr_groep.map( function(prmt){
 var sel_inp_elem = $x(prmt).attr('id') ? $x(prmt).attr('id') : $x(prmt).attr('class').split(' ')[1]; // alle id's of classes voor de groep_
 if( sel_inp_elem !== curr_inp_elem_id && sel_inp_elem !== curr_inp_elem_classnm ) {
  $x(prmt).val(null) && $x(prmt).find("select > option").prop("selected", false).show();
 }
});

} // einde functie

/*======================================== // FUNCTION 4  ==========================================*/

/*========================================   FUNCTION 5  ==========================================*/

$x('input').bind('change keyup', (e) => {

  delay(() => {
    var obj_data = $x("#" + e.currentTarget.id).data();
    var groep_key = Object.keys(obj_data);
    var groep_value = Object.values(obj_data);
    prmt_waarden_arr = []; // bij elke nieuwe zoekactie wordt de array geleegd, nodig voor functie filter_lijst;

    if (!isEmpty(obj_data)) {

      for (var i = 0; i < groep_key.length; i++) {
        filter_lijst(e);
        (function(index) {
        var groep_key_ = groep_key[index];
        var groep_value_ = groep_value[index]
        var soort_groep_ = groep_key_.split('_')[0];      
        setTimeout(function() {legen_van_prmts(e, groep_key_, groep_value_, soort_groep_)},500)
        })(i);
      }
    } else {
      filter_lijst(e);
    }
  }, 200)
}); // input


/*========================================  // FUNCTION 5  ==========================================*/

/*========================================    FUNCTION 6  ==========================================*/

$x('select').on('change', (e) => {

  delay(() => {

var elem = $x('#' + e.currentTarget.id).parents().get(6);
var obj_data = $x(elem).attr('class').split(' ')[1];
var obj_data_ = $x('.' + obj_data).data();
    

var groep_key = Object.keys(obj_data_);
var groep_value = Object.values(obj_data_);
prmt_waarden_arr = []; // bij elke nieuwe zoekactie wordt de array geleegd, nodig voor functie filter_lijst;

    for (var i = 0; i < groep_key.length; i++) {

      var groep_key_ = groep_key[i];
      var groep_value_ = groep_value[i]
      var soort_groep_ = groep_key_.split('_')[0];
      if (soort_groep_) {
        // ------
        legen_van_prmts(e, groep_key_, groep_value_, soort_groep_);
        // ------
      }
    }
  }, 200)
}); // select

/*========================================    FUNCTION 6  ==========================================*/

}); // document.ready()


// </script>


// ********************************************************** functies voor het opslaan van de filter selecties  *******************************************************//

// <script>

var cognosURL = window.location.pathname;
var basicInfo_ = [];
var arr_ = [];
var oCR = cognos.Report.getReport("_THIS_");

// functie geeft alle geselecteerde waarden weer in array vorm 
getPrompts = function(){
    var aPromptControls = oCR.prompt.getControls(),
    prompts = [];
    for(i=0;i<aPromptControls.length;i++)
    {
      if(aPromptControls[i].getValues().length == 0) continue;
      prompts.push(aPromptControls[i].getParameterName());
      prompts.push(URLEncode (aPromptControls[i]));
    }
      return  prompts;
  }

// URLEncode zet alle geslecteerde waarden in een xml formaat
URLEncode = function(promptControl){
    var urlData = '<selectChoices>'
      , aPromptValues = promptControl.getValues()
      , nonRange = []
      , range =[];

    if (aPromptValues.length == 0) {return false}
   
    for (var j=0; j< aPromptValues.length; j++) {
      var promptValue =  aPromptValues[j];
     
      if (promptValue.use) {// Non Range value
        nonRange.push("<selectOption useValue='"+promptValue.use + "' displayValue='"+ promptValue.display + "'/>");
        }
      else { // Range value   
        var rangeStart = promptValue.start
          , rangeEnd = promptValue.end
          , start, end, startDisp, endDisp;
        if (rangeStart && rangeEnd) { //has both Start and End (bounded)
          rangeStart.display?startDisp = " displayValue='"+ rangeStart.display+"'":"";
          rangeEnd.display?endDisp = " displayValue='"+ rangeEnd.display+"'":"";
          range.push("<selectBoundRange><start useValue='"+rangeStart.use +"'" + startDisp +"/><end useValue='"+rangeEnd.use +"'" + endDisp +"/></selectBoundRange>")
        }
        else if (rangeStart && !rangeEnd) {//unboundedEndRange
          rangeStart.display?startDisp = " displayValue='"+ rangeStart.display+"'":"";
          range.push("<selectUnboundedEndRange><start useValue='"+rangeStart.use +"'" + startDisp +"/></selectUnboundedEndRange>");
        }
        else if (!rangeStart && rangeEnd) {
          rangeEnd.display?endDisp = " displayValue='"+ rangeEnd.display+"'":"";
          range.push("<selectUnboundedStartRange><end useValue='"+rangeEnd.use +"'" + endDisp +"/></selectUnboundedStartRange>");
        }
        else {
          alert ("Range not set.");
        } // end if
      } // end if
    } // end for
    if(nonRange.length>0) urlData += nonRange.join();
    if(range.length>0) urlData += range.join();
    urlData+='</selectChoices>';
    return urlData.replace(/&/g,'&amp;');
  };

// verplaatsen van deze functie zorgt ervoor dat getPrompts niet wordt herkend

$x('#button_storage').click( function (e) {
     e.preventDefault();
     localStorage.setItem('lasten_baten', JSON.stringify(getPrompts()));
     e.target.blur();
     UIkit.modal.dialog('<p class="uk-modal-body">Selecties opgeslagen</p>');
  });



// </script>



// ********************************************************** functies voor voor het dynamisch aanroepen van tabellen  *******************************************************//
{/* <script> */}

var cognosURL = window.location.pathname;
var classnm = '';

var url_db = '';
var rapport_dir = $x('.rapport_dir').text(); // deze wordt geinstantieerd op het moment dat jquery laad !!
rapport_dir_1 = rapport_dir.replace(/(?<=report\[@name=).*/, '')
url_db = rapport_dir.replace(/(?<=report\[@name=).*/, '')


var URLs = {
tabel_kpl: url_db + "'tbl_baten_lijngrafiek_box3']",
tabel_kdr: url_db + "'tbl_baten_lijngrafiek_box4']"
}

var basicInfo = ['','scrollbars=yes,resizable=yes','Report','toolbar=no','ui.gateway',cognosURL,'ui.tool', 'CognosViewer','ui.action', 'run', 'ui.object','',"run.prompt","false","ui.toolbar","false","ui.header","false","cv.toolbar","false","cv.header","false"]

function iframe_aanmaken (naam_, ref_) {
          var iframe = document.createElement('iframe');
          iframe.className = naam_;
          iframe.name = naam_;
          $x(ref_).append( $x(iframe) );
          $x('iframe.' + naam_).css("display","none");
}

iframe_func = function () {
  var basicInfo_ = basicInfo.concat( getPrompts() );
  cognosLaunchInWindow.apply( this, basicInfo_ );
}


function aanroepen_tbl (classnm) {
	var x = classnm;
	if ( $x( document.querySelector("iframe." + x)).length === 0 ) {
	$x('.lijst.' + x).prepend("<div class='inner_spinner'><h2>Wordt geladen ...</h2><div style='display: flex;justify-content: center;min-height: 300px;'><div uk-spinner='ratio: 4' style='margin-top: 100px;'></div></div></div>")

	iframe_aanmaken(x, ".lijst." + x);
	document.querySelector("iframe." + x).setAttribute("style","display:none")
	var iframe = document.querySelector("iframe." + x),
    	iframeWin = iframe.contentWindow || iframe,
    	iframeDoc = iframe.contentDocument || iframeWin.document;
	$x(iframeDoc).ready(function () {
		basicInfo[0] = x;
		basicInfo[11] =  URLs[x];
    		iframeDoc.open();
    		iframeDoc.write('\<script>parent.iframe_func();\<\/script>');
    		iframeDoc.close();
		});
	$x('.spinner').remove();
}} 

function wijzig_tab_titel (classnm) {
var x = classnm;
if (x === 'tabel_kpl') {
  $x('.grid_1, .grid_2, .grid_4').css('display','none');
  $x( '.card_tab_3_1_pgnaam > a').empty().append("< Terug");

} else {
  $x('.grid_1, .grid_2, .grid_3').css('display','none');
  $x('.card_tab_4_1_pgnaam > a').empty().append( " < Terug " );
 
}}

$x(document).ready(function(){

$x(".tabel_kpl, .tabel_kdr").click(function(e) {
 classnm = e.currentTarget.className;
 wijzig_tab_titel(classnm);
 aanroepen_tbl(classnm);
});


$x(".card_tab_3_1_pgnaam > a, .card_tab_4_1_pgnaam > a").click( function() { // on is nodig here omdat de class naam "terug" dynamisch wordt aangemaakt
 $x(this).empty().append("Lijngrafiek");
 $x('.grid_1, .grid_2, .grid_3, .grid_4').css('display','block');
});


});
// </script>
