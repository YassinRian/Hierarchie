select 
  dim_factuur_id
, dim_datum_ontvangst_id
, dim_datum_factuur_id
, dim_boeksleutel_passief_id
, factuur_bedrag
, factuur_bedrag_excl_btw
, totaal_btw_bedrag
 from fct_facturen
 

 select
 dim_factuur_id
,factuurnummer
,Afgesloten_ind
,betaalstatus
,factuur_match_inkooporder_ind
--,factuurstatus
,ontvangstdatum
,factuurdatum
,grootboekdatum 
,betaaltermijndatum
,Laatste_termijnvervaldatum
,Laatste_betaaldatum
,Afgesloten_ind
,betaalstatus
,factuur_match_inkooporder_ind
--,blokkade_ind
--,goedkeuringsdatum
--,goedkeuringstatus
from dmt.dim_factuur
where dim_factuur_id <> 0 and dim_factuur_id = 4402


select 
 fct_fac.dim_factuur_id
,fct_fac.dim_grootboekperiode_id
,fct_fac.dim_kdr_kpl_org_hier_id
,fct_fac.dim_dienst_id
,fct_fac.dim_datum_factuur_id
,fct_fac.dim_datum_factuur_id
,fct_fac.dim_leverancier_id
,fac.factuurnummer
,fac.Afgesloten_ind
,fac.betaalstatus
,fac.factuurdatum
,fac.ontvangstdatum
,fac.Laatste_betaaldatum
,fct_fac.aantal_dagen_openstaand
,fac.factuur_match_inkooporder_ind
,fac.grootboekdatum 
,fac.betaaltermijndatum
,fac.Laatste_termijnvervaldatum
,fac.betaalstatus
,fac.factuur_match_inkooporder_ind
,fac.ontvangstdatum + 30 as vanaf_30_dgn
,case when current_date <= (fac.ontvangstdatum + 30) and fac.Afgesloten_ind = 'Nee' then 'NVIN' else null end as facturen_in_30dgn_NVIN -- NVIN: Niet voldaan (30 dagen nog niet voorbij)
,case when current_date > (fac.ontvangstdatum + 30) and fac.Afgesloten_ind = 'Nee' then 'NVNA' else null end as facturen_na_30dgn_NVNA --NVNA: Niet voldaan (30 dagen voorbij)
,case when fac.laatste_betaaldatum <= current_date and fac.laatste_betaaldatum <= (fac.ontvangstdatum + 30) then 'VIN' else null end as facturen_in_30dgn_VIN -- VIN: Voldaan In 30dgn 
,case when fac.laatste_betaaldatum <= current_date and fac.laatste_betaaldatum > (fac.ontvangstdatum + 30) then 'VNA' else null end as facturen_na_30dgn_VNA --VNA: Voldaa na 30dgn 
-- aantal dagen na periode voor NVNA
,case when (case when current_date > (fac.ontvangstdatum + 30) and fac.Afgesloten_ind = 'Nee' then current_date - (fac.ontvangstdatum + 30) else null end) <= 7 then 'NVNA_0_7' else null end as facturen_na_30dgn_NVNA_0_7  
,case when (case when current_date > (fac.ontvangstdatum + 30) and fac.Afgesloten_ind = 'Nee' then current_date - (fac.ontvangstdatum + 30) else null end) between 8 and 14 then 'NVNA_8_14' else null end as facturen_na_30dgn_NVNA_8_14  
,case when (case when current_date > (fac.ontvangstdatum + 30) and fac.Afgesloten_ind = 'Nee' then current_date - (fac.ontvangstdatum + 30) else null end) > 14 then 'NVNA_G_14' else null end as facturen_na_30dgn_NVNA_G_14  
-- aantal dagen na periode voor VNA
,case when (case when fac.laatste_betaaldatum <= current_date and fac.laatste_betaaldatum > (fac.ontvangstdatum + 30) then current_date - (fac.ontvangstdatum + 30) else null end) <= 7 then 'VNA_0_7' else null end as facturen_na_30dgn_VNA_0_7 
,case when (case when fac.laatste_betaaldatum <= current_date and fac.laatste_betaaldatum > (fac.ontvangstdatum + 30) then current_date - (fac.ontvangstdatum + 30) else null end) between 8 and 14 then 'VNA_8_14' else null end as facturen_na_30dgn_VNA_8_14 
,case when (case when fac.laatste_betaaldatum <= current_date and fac.laatste_betaaldatum > (fac.ontvangstdatum + 30) then current_date - (fac.ontvangstdatum + 30) else null end) <= 7 then 'VNA_G_14' else null end as facturen_na_30dgn_VNA_G_14 
from dmt.fct_facturen_diensten fct_fac 
inner join dmt.dim_factuur fac on fct_fac.dim_factuur_id = fac.dim_factuur_id
where fct_fac.dim_factuur_id = 4402
