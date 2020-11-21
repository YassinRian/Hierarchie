
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