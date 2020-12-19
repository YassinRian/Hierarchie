var input_data = {
    baten: {
        header_classnaam: ".dashboard_naam",
        iframe_classnaam: "iframe.baten_all",
        iframe_naam: "baten_all",
        url: URLs.baten,
        header_tekst: "Apparaat & Programma - Baten",
        locStorage: "lasten_baten",
        naam_dashboard: "Baten_Dashboard",
        thema_kleur: "#1D6B34"
    },
    lasten: {
        header_classnaam: ".dashboard_naam",
        iframe_classnaam: "iframe.lasten_all",
        iframe_naam: "lasten_all",
        url: URLs.lasten,
        header_tekst: "Apparaat & Programma - Lasten",
        locStorage: "lasten_baten",
        naam_dashboard: "Lasten_Dashboard",
        thema_kleur: "#1D6B34"
    },
    facturen: {
        header_classnaam: ".dashboard_naam",
        iframe_classnaam: "iframe.facturen_all",
        iframe_naam: "facturen_all",
        url: URLs.facturen,
        header_tekst: "Facturen",
        locStorage: "facturen",
        naam_dashboard: "Facturen_Dashboard",
        thema_kleur: "#1D6B34"
    },
    ziekteverz: {
        header_classnaam: ".dashboard_naam",
        iframe_classnaam: "iframe.ziekteverz_all",
        iframe_naam: "ziekteverz_all",
        url: URLs.ziekteverz,
        header_tekst: "Ziekteverzuim",
        locStorage: "ziekteverz",
        naam_dashboard: "Ziekteverzuim_dashboard",
        thema_kleur: "#1261A3"
    },
    formbez: {
        header_classnaam: ".dashboard_naam",
        iframe_classnaam: "iframe.formbez_all",
        iframe_naam: "formbez_all",
        url: URLs.formbez,
        header_tekst: "Formatie & Bezetting",
        locStorage: "formbez",
        naam_dashboard: "Formatie_bezetting_dashboard",
        thema_kleur: "#1261A3"
    },
    pvb: {
        header_classnaam: ".dashboard_naam",
        iframe_classnaam: "iframe.pvb_all",
        iframe_naam: "pvb_all",
        url: URLs.pvb,
        header_tekst: "PVB cyclus",
        locStorage: "pvb",
        naam_dashboard: "PVB_cyclus_dashboard",
        thema_kleur: "#1261A3"
    }
}

iframe_func = function () {
    if (localStorage.getItem(input_data[iframe_actief].locStorage) !== null) {
        var storedSelecties = JSON.parse(localStorage.getItem(input_data[iframe_actief].locStorage));
        var rapport_data = rapport_data.concat(storedSelecties);
        cognosLaunchInWindow.apply(this, rapport_data);
    } else {
        if (iframe_actief === 'formbez') {
            var datum_string = ["p_par_datum", "<selectChoices><selectOption useValue='" + String(correctDate) + "' displayValue='" + formattedDate_1 + "'/></selectChoices>"];
            rapport_data = rapport_data.concat(datum_string);
            cognosLaunchInWindow.apply(this, rapport_data);
        } else {
            if (iframe_actief === 'baten' || iframe_actief === 'lasten' || iframe_actief === 'facturen') {
            var jaar_string = ["p_par_jaar", "<selectChoices><selectOption useValue='" + jaar_ + "' displayValue='" + jaar_ + "'/></selectChoices>", "p_par_hrniveau_kpl","<selectChoices><selectOption useValue='7' displayValue='7'/></selectChoices>", "p_par_hrniveau_kdr","<selectChoices><selectOption useValue='7' displayValue='7'/></selectChoices>"];
            rapport_data = rapport_data.concat(datum_string);
            cognosLaunchInWindow.apply(this, rapport_data);
            } else {
                var jaar_string = ["p_par_jaar", "<selectChoices><selectOption useValue='" + jaar_ + "' displayValue='" + jaar_ + "'/></selectChoices>"];
                rapport_data = rapport_datal.concat(jaar_string);
                cognosLaunchInWindow.apply(this, rapport_data);
            }
        }
    }
}