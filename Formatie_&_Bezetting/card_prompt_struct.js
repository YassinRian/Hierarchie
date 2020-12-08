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

// een extra versie van de grafiek structuur aangemaakt voor de extra tabel

var grafiek_tbl  = (nummer, ...args) => { return `<div class="grafiek ctr_con_2_1 ctr_con_2_1_${nummer} uk-animation-slide-top-medium"><div class="grafiek con_box_3_1 con_box_3_1_${nummer}"><div class="grafiek ${args[0]} box_viz_4_1 box_viz_4_1_${nummer}"></div></div><div class="grafiek con_box_3_2 con_box_3_2_${nummer}"><div class="grafiek ${args[0]} box_leg_4_1 box_leg_4_1_${nummer}"></div></div><div class="ctr_subtbl_3_3 ctr_subtbl_3_3_${nummer}" style="flex-grow:1;margin-top: 20px;"></div></div>`}

var bullet = (nummer, ...args) => {return `<div class="bullet ctr_con_2_1 ctr_con_2_1_${nummer} uk-animation-slide-top-medium"><div class="bullet con_box_3_1 con_box_3_1_${nummer}"><div class="bullet ${args[0]} box_lbl_4_1 box_lbl_4_1_${nummer}"></div><div class="bullet ${args[0]} box_viz_4_2 box_viz_4_2_${nummer}"></div></div><div class="bullet con_box_3_2 con_box_3_2_${nummer}"><div class="bullet ${args[0]} box_leg_4_1 box_leg_4_1_${nummer}"></div></div></div>`}

var tab_switcher = (sw_class,tab_class) => {return `<ul class="${sw_class}" uk-tab></ul><ul class="${tab_class} uk-switcher uk-margin"></ul>`};

var tab_titel = (titel, icoon, ...args) => {return `<li class="uk-text-bold"><a href="#" class="${ args[0] ? args[0] : null }"><span><i style='margin-right:5;'>${icoon()}</i></span><span class="uk-text-capitalize">${titel}</span></a></li>`};

var tab_cnt = (class_) => {return `<li class="${class_}"></li>`};

/***********************************************************   // CARDS ***********************************************************************/




/***********************************************************   // PROMPTS  ***********************************************************************/

var input_ = (id, name, label) => `<div class='uk-margin'><input id="input_${id}" name="${name}" class="uk-input uk-form-small" type="text" placeholder="${label}" required autocomplete="off"></div>`;
var accor_content_ = (titel, nr, open) => `<li class="${open?"uk-open":""}"><a class="uk-accordion-title" href="#">${titel}</a><div class="accor_row accor_row${nr} uk-accordion-content"></li>`;

/***********************************************************   // PROMPTS  ***********************************************************************/

/* ======================================== PRMTS && ACCORDIONS ================================= */

var filters = {
  accordion: {
    accor_1: {
      prompt1: {
        titel: "Selectiedatum",
        classnm: ".prmt_datum",
        open: true
      }
    },
    accor_3: {
      prompt1: {
        titel: "Functie",
        classnm: ".prmt_functie",
        input_: {
          id: "functie",
          name: "prmt_functie",
          label: "Selecteer functie"
        }
      }
    },
    accor_4: {
      prompt1: {
        titel: "Persoonstype",
        classnm: ".prmt_perstypes",
        input_: {
          id: "perstype",
          name: "prmt_perstypes",
          label: "Selecteer persoonstype"
        }
      }
    },
    accor_5: {
      prompt1: {
        titel: "HR organisatie niveaus",
        classnm: ".prmt_organisatie",
        open: true,
        tab_groep: 'tab2',
        input_: {
          id: "organisatie",
          name: "prmt_organisatie",
          label: "selecteer organisatie"
        }
      }
    }
  }
}

/* ======================================== // PRMTS && ACCORDIONS ================================= */

/* ========================================     TABS ================ ================================= */

var tabs_overige = {
     accors: 
     [
       {
        prmts: ['accor_4', 'accor_3', 'accor_5', 'accor_1']
       }
     ],
   };


/* ========================================   // TABS ================ ================================= */

var card_info = {
  card1: {
    titel: "Aantal medewerkers en Formatie",
    visualisatie: grafiek_tbl,
    info: "Aantal medewerkers, bezetting (in FTE) en formatie (in FTE). De beschrijving van de verschillende categorieen 'Intern', 'Extern' enz. is te zien door in de legenda met de muis op het desbetreffende gekleurde vakje te gaan staan."
  },
  card2: {
    titel: "Verjaardagen",
    visualisatie: lijst,
    info: "Overzicht verjaardagen. Vorige week, deze week en volgende week."
  },
  card3: {
    titel: "Eindigende contracten en dienstverbanden",
    visualisatie: lijst,
    info: "Overzicht van eindigende contracten en dienstverbanden waarop (mogelijk) actie nodig is (einddatum binnen twee maanden), binnenkort actie nodig is (einddatum tussen 2 en 3 maanden) of nog geen actie nodig is (einddatum > 3 maanden). De weergegeven volgorde is van eerst- tot laatst aflopend. Soms zijn nieuwe gegevens bekend die ingaan na de einddatum. Als een contract al verlengd of omgezet is dan is dit hier te zien."
  }
}


</script>