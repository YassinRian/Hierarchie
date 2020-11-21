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
