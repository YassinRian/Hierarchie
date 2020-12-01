{/* <script language="javascript"> */}

// ***************
// Benodigde Variabelen: gebruikte filter parameters
// Beschrijving: Definieer de gebruikte filter parameters, dit is nodig voor de JS functie die de selectie waarden onder elk visualisatie weergeeft. Obv deze parameter variabelen worden de selectie waarden verdeeld naar de eigen visualisaties.
// ***************
var kpl_prmts = ['par_jaar', 'par_kpl_orgniv_7', 'par_kpl_orgniv_8', 'par_kpl_orgniv_9', 'par_kpl_orgniv_10', 'par_kpl_orgniv_11', 'par_kpl_orgniv_12'];
var kdr_prmts = ['par_jaar', 'par_kdr_orgniv_7'];


// ***************
// Data model: card_struct__obj
// Beschrijving: Deze data structuur bepaalt het aantal cards (visualisatie vlakken) in het dashboard
// ***************
var grid_struct__obj = {
  aantal_kolommen: 2, //minimaal 1
  aantal_rijen: 2 // minimaal 1
}


// ***************
// Data model: card_tabs_data__arr
// Beschrijving: card_tabs_data__arr bevat data voor de verschillende "card" elementen waarin de verschillende visualisaties worden geplaatst
// Data structuur: [ {card 1:[ {pagina 1},{pagina 2} ] },{card 2:[ {pagina 1},{pagina 2} ]},{..} ]
// ****************
var card_tabs_data__arr = [
    {
        card_tab_naam__str: 'card_tab_1',
        card_tab_pg__arr: [
            {
                card_tab_pg_naam__str: 'Bullchart',
                card_tab_pg_data__obj: {
                    titel: "APPARAAT: Meerjarige vergelijking gerealiseerde baten absoluut",
                    visualisatie: bullet,
                    info: "Deze grafiek laat de gerealiseerde baten zien op de kostenplaats(en) (bijv. opbrengst uitleen personeel) behorend bij het geselecteerde organisatie onderdeel. De grafiek geeft de baten in het huidig jaar t/m de laatste afgesloten maand (zie Realisatie datum) weer in euro,  ten opzichte van de raming in euro. Ter vergelijking is de realisatie in euro weergegeven t/m dezelfde maand in voorgaande jaren ten opzichte van de ramingen van de voorgaande jaren.",
                }
            },
            {
                card_tab_pg_naam__str: 'Meerjaren %',
                card_tab_pg_data__obj: {
                    titel: "APPARAAT: Meerjarige vergelijking gerealiseerde baten absoluut",
                    visualisatie: grafiek,
                    info: "Deze grafiek laat de gerealiseerde baten zien op de kostenplaats(en) (bijv. opbrengst uitleen personeel) behorend bij het geselecteerde organisatie onderdeel. De grafiek geeft de baten in het huidig jaar t/m de laatste afgesloten maand (zie Realisatie datum) weer in euro,  ten opzichte van de raming in euro. Ter vergelijking is de realisatie in euro weergegeven t/m dezelfde maand in voorgaande jaren ten opzichte van de ramingen van de voorgaande jaren.",
                    icoon: i_grafiek
                }
            },
            {
                card_tab_pg_naam__str: 'Meerjaren abs',
                card_tab_pg_data__obj: {
                    titel: "APPARAAT: Meerjarige vergelijking gerealiseerde baten absoluut",
                    visualisatie: grafiek,
                    info: "Deze grafiek laat de gerealiseerde baten zien op de kostenplaats(en) (bijv. opbrengst uitleen personeel) behorend bij het geselecteerde organisatie onderdeel. De grafiek geeft de baten in het huidig jaar t/m de laatste afgesloten maand (zie Realisatie datum) weer in euro,  ten opzichte van de raming in euro. Ter vergelijking is de realisatie in euro weergegeven t/m dezelfde maand in voorgaande jaren ten opzichte van de ramingen van de voorgaande jaren.",
                    icoon: i_grafiek
                }
            }
        ]
    },
    {
        card_tab_naam__str: 'card_tab_2',
        card_tab_pg__arr: [
            {
                card_tab_pg_naam__str: 'Bullchart',
                card_tab_pg_data__obj: {
                  titel: "PROGRAMMA: Meerjarige vergelijking gerealiseerde baten absoluut",
                  visualisatie: bullet,
                  info: "Deze grafiek laat de gerealiseerde baten zien op de programma-uitvoering (kostendrager(s)) behorend bij het geselecteerde organisatie onderdeel. De grafiek geeft de baten in het huidig jaar t/m de laatste afgesloten maand (zie Realisatie datum) weer in euro, ten opzichte van de raming in euro. Ter vergelijking is de realisatie in euro weergegeven t/m dezelfde maand in voorgaande jaren ten opzichte van de ramingen van de voorgaande jaren.",
                }
            },
            {
                card_tab_pg_naam__str: 'Meerjaren %',
                card_tab_pg_data__obj: {
                  titel: "PROGRAMMA: Meerjarige vergelijking gerealiseerde baten absoluut",
                  visualisatie: grafiek,
                  info: "Deze grafiek laat de gerealiseerde baten zien op de programma-uitvoering (kostendrager(s)) behorend bij het geselecteerde organisatie onderdeel. De grafiek geeft de baten in het huidig jaar t/m de laatste afgesloten maand (zie Realisatie datum) weer in euro, ten opzichte van de raming in euro. Ter vergelijking is de realisatie in euro weergegeven t/m dezelfde maand in voorgaande jaren ten opzichte van de ramingen van de voorgaande jaren.",
                  icoon: i_grafiek
                }
            },
            {
                card_tab_pg_naam__str: 'Meerjaren abs',
                card_tab_pg_data__obj: {
                  titel: "PROGRAMMA: Meerjarige vergelijking gerealiseerde baten absoluut",
                  visualisatie: grafiek,
                  info: "Deze grafiek laat de gerealiseerde baten zien op de programma-uitvoering (kostendrager(s)) behorend bij het geselecteerde organisatie onderdeel. De grafiek geeft de baten in het huidig jaar t/m de laatste afgesloten maand (zie Realisatie datum) weer in euro, ten opzichte van de raming in euro. Ter vergelijking is de realisatie in euro weergegeven t/m dezelfde maand in voorgaande jaren ten opzichte van de ramingen van de voorgaande jaren.",
                  icoon: i_grafiek
                }
            },
        ]
    },
  {
    card_tab_naam__str: 'card_tab_3',
    card_tab_pg__arr : [
      {
        card_tab_pg_naam__str: 'Lijngrafiek',
        card_tab_pg_data__obj: {
          titel: "APPARAAT: Baten raming en realisatie",
          tab_titel: "Lijngrafiek",
          visualisatie: grafiek,
          info: "Deze grafiek laat voor het geselecteerde jaar en organisatie onderdeel de gerealiseerde cumulatieve baten per maand zien ten opzichte van de raming op de bijbehorende kostenplaats(en).",
          icoon: i_lijn_grafiek,
          iframe_ref: 'terug'
        }
      },
      {
        card_tab_pg_naam__str: 'Tabel',
        card_tab_pg_data__obj: {
          titel: "APPARAAT: Baten raming en realisatie",
          tab_titel: "Tabel",
          icoon: i_tabel,
          info: "Deze tabel laat voor het geselecteerde jaar en organisatie onderdeel de gerealiseerde cumulatieve baten per maand zien ten opzichte van de raming op de bijbehorende kostenplaats(en).",
          visualisatie: lijst,
          iframe_ref: 'tabel_kpl'
        }
      }
    ]
  },
  {
    card_tab_naam__str: 'card_tab_4',
    card_tab_pg__arr: [
      {
        card_tab_pg_naam__str: 'Lijngrafiek',
        card_tab_pg_data__obj: {
          titel: "PROGRAMMA: Baten raming en realisatie",
          tab_titel: "lijngrafiek",
          visualisatie: grafiek,
          info: "Deze grafiek laat voor het geselecteerde jaar en organisatie onderdeel de gerealiseerde  cumulatieve baten per maand zien ten opzichte van de raming voor de bijbehorende programma-uitvoering (kostendrager(s)).",
          icoon: i_lijn_grafiek
        }
      },
      {
        card_tab_pg_naam__str: 'Tabel',
        card_tab_pg_data__obj: {
          titel: "PROGRAMMA: Baten raming en realisatie",
          tab_titel: "Tabel",
          icoon: i_tabel,
          info: "Deze tabel laat voor het geselecteerde jaar en organisatie onderdeel de gerealiseerde  cumulatieve baten per maand zien ten opzichte van de raming voor de bijbehorende programma-uitvoering (kostendrager(s)).",
          visualisatie: lijst,
          iframe_ref: 'tabel_kdr'
        }
      }
    ]
  }
]

// ***************
// Data model: prmt_groepen_data__arr
// Beschrijving: Deze structuur definieert de indeling van de verschillende filters, voor de structuur wordt er gebruik gemaakt van de "accordion" component uit de UIKIT Css framework (zie documentatie voor meer info hierover)
// Data structuur: [ {prmt_groep_1:[ {lvl_1},{lvl_2}, etc ] },{prmt_groep_2:[ {lvl_1},{lvl_2} ]},{..} ]
// ***************

var prmt_groepen_data__arr = [
{
prmt_groep_1:
   [
    {
      titel: "Apparaat organisatie niveau 7",
      classnm: "prmt_kpl_orgniv_7", // dient gelijk te zijn aan de classnm van de specifieke prmt
      open: true, // optioneel
      prmt_groep: 'kpl',
      input_data: {
        id: "orgniv_kpl7",
        name: "prmt_kpl_orgniv_7", // dient gelijkt te zijn aan classnm
        label: "selecteer organisatie niveau 7"
      }
    },
    {
      titel: "Apparaat organisatie niveau 8",
      classnm: "prmt_kpl_orgniv_8",
      prmt_groep: 'kpl',
      input_data: {
        id: "orgniv_kpl8",
        name: "prmt_kpl_orgniv_8",
        label: "selecteer organisatie niveau 8"
      }
    },
    {
      titel: "Apparaat organisatie niveau 9",
      classnm: "prmt_kpl_orgniv_9",
      prmt_groep: 'kpl',
      input_data: {
        id: "orgniv_kpl9",
        name: "prmt_kpl_orgniv_9",
        label: "selecteer organisatie niveau 9"
      }
    },
    {
      titel: "Apparaat organisatie niveau 10",
      classnm: "prmt_kpl_orgniv_10",
      prmt_groep: 'kpl',
      input_data: {
        id: "orgniv_kpl10",
        name: "prmt_kpl_orgniv_10",
        label: "selecteer organisatie niveau 10"
      }
    },
    {
      titel: "Apparaat organisatie niveau 11",
      classnm: "prmt_kpl_orgniv_11",
      prmt_groep: 'kpl',
      input_data: {
        id: "orgniv_kpl11",
        name: "prmt_kpl_orgniv_11",
        label: "selecteer organisatie niveau 11"
      }
    },
    {
      titel: "Apparaat organisatie niveau 12",
      classnm: "prmt_kpl_orgniv_12",
      prmt_groep: 'kpl',
      input_data: {
        id: "orgniv_kpl12",
        name: "prmt_kpl_orgniv_12",
        label: "selecteer organisatie niveau 12"
      }
    }
 ]
},
{
prmt_groep_2: 
  [
      {
        titel: "Programma organisatie niveau 7",
        classnm: "prmt_kdr_orgniv_7",
        open: true,
        prmt_groep: 'kdr',
        input_data: {
            id: "orgniv_kdr7",
            name: "prmt_kdr_orgniv_7",
            label: "selecteer organisatie niveau 7"
        }
      },
    ]
  },
  {
    prmt_groep_3: [
      {
        titel: "Jaar",
        classnm: "prmt_jaar",
        open: true,
        input_data: {
            id: "jaar",
            name: "prmt_jaar",
            label: "selecteer jaar"
        }
      }
    ]
  }
]

//**********
// data model: filter_tabs_data__arr
// Beschrijving: Deze data structuur bevat data waarop de de filter tabs zijn gemaakt. Hierin worden ook de verschillende referenties aangemaakt voor de prmpts (adv prmt containers).
//**********
var filter_tabs_data__arr = 
[ // deze structuur maakt alleen de containers aan
   { // 1ste TAB
     filter_tab_naam__str: 'filter_tab_1', // De naam van de tab;
     filter_tab_pg__arr: // elke array elem bevat het data voor een specifieke tab-pagina van de tab;
     [
        {
            filter_tab_pgnaam__str: 'Kostenplaatsen',
            prmt_groepen__arr: ['prmt_groep_1']
       	},
       	 {
            filter_tab_pgnaam__str: 'Kostendragers',
            prmt_groepen__arr: ['prmt_groep_2']
        }
     ]
   }
]
//**********
// data model: filter_pagina__arr
// Beschrijving: Deze data structuur beschrijft de positie van bepaalde filter container elementen die bijv buiten de tab plaats dienen te vinden. Zie technische documentatie voor meer informatie.
//**********
var filter_pagina__arr =
     [
       {
         classnm__str: 'filters_cnt', // in de filters container buiten de tabs
         //
         filter_cnt_groepen__arr: [{type: 'prmt_groep', naam: 'prmt_groep_3', positie: 'begin'}],
       }
     ]




</script>