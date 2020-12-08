
<script language="javascript">

/***********************************************************   CARDS ***********************************************************************/
var i_tabel = () => { return `<svg xmlns="http://www.w3.org/2000/svg" height="16" viewBox="0 0 24 24" width="16"><path d="M0 0h24v24H0V0z" fill="none"/><path style="fill:var(--thema-kleur);" d="M10 10.02h5V21h-5zM17 21h3c1.1 0 2-.9 2-2v-9h-5v11zm3-18H5c-1.1 0-2 .9-2 2v3h19V5c0-1.1-.9-2-2-2zM3 19c0 1.1.9 2 2 2h3V10H3v9z"/></svg>`};
var i_grafiek = () => {return `<svg xmlns="http://www.w3.org/2000/svg" height="18" viewBox="0 0 24 24" width="18"><path style="fill:var(--thema-kleur);" d="M5 9.2h3V19H5zM10.6 5h2.8v14h-2.8zm5.6 8H19v6h-2.8z"/><path d="M0 0h24v24H0z" fill="none"/></svg>`};
var i_pijl = () => {return `<svg xmlns="http://www.w3.org/2000/svg" height="18" viewBox="0 0 24 24" width="18"><path style="fill:var(--thema-kleur);" d="M11.67 3.87L9.9 2.1 0 12l9.9 9.9 1.77-1.77L3.54 12z"/><path d="M0 0h24v24H0z" fill="none"/></svg>`};
var i_lijn_grafiek = () => {return `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="18" height="18" viewBox="0 0 24 24"><path style="fill:var(--thema-kleur);" d="M16,11.78L20.24,4.45L21.97,5.45L16.74,14.5L10.23,10.75L5.46,19H22V21H2V3H4V17.54L9.5,8L16,11.78Z" /></svg>`};

var info_html = (info) => { return `<span class="uk-animation-slide-top-medium"><i id="tooltip" uk-tooltip="title:${info}" style="font-size:21px;color:white;vertical-align:text-center;margin-left:10px;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" class="feather feather-info"><circle cx="12" cy="12" r="10"/><line x1="12" y1="16" x2="12" y2="12"/><line x1="12" y1="8" x2="12.01" y2="8"/></svg></i></span>` };

var card_ = (nummer,visualisatie,titel,info) => { return `<div class="crd_ctr_1_1 crd_ctr_1_1_${nummer}"> <div class="ctr_hdr_2_1 ctr_hdr_2_1_${nummer}"><span class="uk-animation-slide-top-medium">${titel}</span>${info_html(info)}</div><div class="ctr_hdr_2_2 ctr_hdr_2_2_${nummer}"></div>${visualisatie}<hr> <div class="ctr_ftr_2_1 ctr_ftr_2_1_${nummer}"><strong>Geselecteerde filters<span class="uk-animation-slide-top-medium"></strong></div><div class="ctr_ftr_2_2 ctr_ftr_2_2_${nummer}"></div></div>`};

var matrix = (nummer, ...args) => {return `<div class="matrix ctr_con_2_1 ctr_con_2_1_${nummer} uk-animation-slide-top-medium"><div class="matrix con_box_3_1 con_box_3_1_${nummer}"><div class="matrix ${args[0] ? args[0] : null } box_viz_4_1 box_viz_4_1_${nummer}"></div></div><div class="matrix con_box_3_2 con_box_3_2_${nummer}"><div class="matrix ${args[0]} box_leg_4_1 box_leg_4_1_${nummer}"></div></div></div>`}

var lijst = (nummer, ...args) => {return `<div class="lijst ctr_con_2_1 ctr_con_2_1_${nummer} uk-animation-slide-top-medium"><div class="lijst con_box_3_1 con_box_3_1_${nummer}"><div class="lijst ${args[0]?args[0]: null} ${ args[1] ? args[1] : null } box_viz_4_1 box_viz_4_1_${nummer}"></div></div></div>`}

var grafiek  = (nummer, ...args) => { return `<div class="grafiek ctr_con_2_1 ctr_con_2_1_${nummer} uk-animation-slide-top-medium"><div class="grafiek con_box_3_1 con_box_3_1_${nummer}"><div class="grafiek ${args[0]} box_viz_4_1 box_viz_4_1_${nummer}"></div></div><div class="grafiek con_box_3_2 con_box_3_2_${nummer}"><div class="grafiek ${args[0]} box_leg_4_1 box_leg_4_1_${nummer}"></div></div></div>` }

var bullet = (nummer, ...args) => {return `<div class="bullet ctr_con_2_1 ctr_con_2_1_${nummer} uk-animation-slide-top-medium"><div class="bullet con_box_3_1 con_box_3_1_${nummer}"><div class="bullet ${args[0]} box_lbl_4_1 box_lbl_4_1_${nummer}"></div><div class="bullet ${args[0]} box_viz_4_2 box_viz_4_2_${nummer}"></div></div><div class="bullet con_box_3_2 con_box_3_2_${nummer}"><div class="bullet ${args[0]} box_leg_4_1 box_leg_4_1_${nummer}"></div></div></div>`}

var tab_switcher = (sw_class,tab_class) => {return `<ul class="${sw_class}" uk-tab></ul><ul class="${tab_class} uk-switcher uk-margin"></ul>`};

var tab_titel = (titel, icoon, ...args) => {return `<li class="uk-text-bold"><a href="#" class="${ args[0] ? args[0] : null }"><span><i style='margin-right:5;'>${icoon()}</i></span><span class="uk-text-capitalize">${titel}</span></a></li>`};

var tab_cnt = (class_) => {return `<li class="${class_}"></li>`};

/***********************************************************   // CARDS ***********************************************************************/

/***********************************************************   // PROMPTS  ***********************************************************************/

var input_ = (id, name, label) => `<div class='uk-margin'><input id="input_${id}" name="${name}" class="uk-input uk-form-small" type="text" placeholder="${label}" required autocomplete="off"></div>`;
var accor_content_ = (titel, nr, open) => `<li class="${open?"uk-open":""}"><a class="uk-accordion-title" href="#">${titel}</a><div class="accor_row accor_row${nr} uk-accordion-content"></li>`;

/***********************************************************   // PROMPTS  ***********************************************************************/

var filters = {
    accordion: {
       accor_1: {
          prompt1: {
            titel: "Jaar",
            classnm: ".prmt_jaar",
            open: true,
            input_: {
              id: "jaar",
              name: "prmt_jaar",
              label: "selecteer jaar"
            }
          }},
         accor_3: {
          prompt1: {
            titel: "HR organisatie niveaus",
            classnm: ".prmt_org",
            open: true,
            tab_groep: 'tab_1_2',
            input_: {
              id: "org",
              name: "prmt_org",
              label: "selecteer HR organisatie"
            }
          }}}}
      

/* =================================  TABS structuur =============================== */
var tabs_overige = {
     accors: 
     [
       {
        prmts: ['accor_3','accor_1']
       }
     ]
   };

/* ------------------------------------------------------- */


var card_info = {
  card1: {
    tab_info: {
      tab1: {
        titel: "Ziekteverzuim percentage (1 maand)",
        tab_titel: "Maand",
        visualisatie: grafiek,
        info: "Het aantal kalenderdagen dat in de genoemde maand is verzuimd als een percentage van het totaal aantal beschikbare kalenderdagen van de betreffende maand. Bij de berekening is rekening gehouden met de deeltijdfactor van medewerkers en met het percentage waarvoor medewerkers ziek zijn gemeld. Ter vergelijking is de streefwaarde/norm opgenomen voor het voortschrijdend jaargemiddelde dat aan het einde van de raadsperiode gerealiseerd moet zijn.",
        icoon: i_grafiek
      },
      tab2: {
        titel: 'Ziekteverzuim percentage (voortschrijdend jaargemiddelde)',
        tab_titel: "12 Maanden (voortschrijdend jaargemiddelde)",
        visualisatie: grafiek,
        info: "Het aantal kalenderdagen dat in de voorgaande 12 maanden is verzuimd als een percentage van het totaal aantal beschikbare kalenderdagen van de voorgaande 12 maanden. Bij de berekening is rekening gehouden met de deeltijdfactor van medewerkers en met het percentage waarvoor medewerkers ziek zijn gemeld. Ter vergelijking is de streefwaarde/norm opgenomen voor het voortschrijdend jaargemiddelde dat aan het einde van de raadsperiode gerealiseerd moet zijn.",
        icoon: i_grafiek
      }
    }
  },
  card2: {
tab_info: {
tab1: {
	tab_titel: "Maand",
        titel: "Ziekteverzuim mutaties (1 maand)",
        visualisatie: lijst,
        info: "Het aantal (gedeeltelijk) ziek gemelde medewerkers op de 1e van de genoemde maand, het aantal ziek- en hersteldmeldingen gedurende de betreffende maand en het aantal (gedeeltelijk) ziek gemelde medewerkers van het geselecteerde onderdeel op de laatste kalenderdag van de betreffende maand.",
        icoon: i_tabel,
}
}

      },      
  card3: {
    tab_info: {
      tab1: {
        titel: "Verzuimfrequentie (1 maand)",
        tab_titel: "Maand",
        visualisatie: grafiek,
        info: "Het gemiddeld aantal verzuimmeldingen per medewerker in de genoemde maand. Ter vergelijking is de streefwaarde/norm opgenomen voor het voortschrijdend jaargemiddelde dat aan het einde van de raadsperiode gerealiseerd moet zijn.",
        icoon: i_lijn_grafiek,
      },
      tab2: {
        titel: "Verzuimfrequentie (voortschrijdend jaargemiddelde)",
        tab_titel: "12 Maanden (voortschrijdend jaargemiddelde)",
        visualisatie: grafiek,
        info: "Het gemiddeld aantal verzuimmeldingen per medewerker in de voorgaande 12 maanden teruggerekend vanaf de genoemde maand. Ter vergelijking is de streefwaarde/norm opgenomen voor het voortschrijdend jaargemiddelde dat aan het einde van de raadsperiode gerealiseerd moet zijn.",
        icoon: i_lijn_grafiek,
      }
    }
  },
  card4:
  			{
tab_info: {
tab1:{
        titel: "Frequent verzuimers",
        tab_titel: "12 Maanden (voortschrijdend jaargemiddelde)",
        visualisatie: lijst,
        info: "Medewerkers die zich drie keer of vaker hebben ziek gemeld in de voorgaande 12 maanden, teruggerekend vanaf de meest recente afgeronde maand. Uit privacy overwegingen vermelden we momenteel geen namen van medewerkers.",
        icoon: i_tabel
}
}

      }
}



</script>