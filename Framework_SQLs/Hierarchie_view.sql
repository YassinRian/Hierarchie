-- DIT IS VOLDOENDE OM ALLE NIVEAU'S OP TE HALEN
SELECT DISTINCT 
  LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_TOP
, LVL0.HR_NIVEAU AS HR_NIVEAU_TOP
, LVL0.ORGANISATIE_KIND AS ORGANISATIE_TOP
FROM DMT.DIM_KDR_KPL_ORG_HIER LVL0
WHERE KOSTENPLAATS_KIND LIKE 'B5%' --AND HR_NIVEAU = 11
ORDER BY LVL0.DIM_KDR_KPL_ORG_HIER_ID