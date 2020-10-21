select 
  QY1.QY1_ORGANISATIE_NIVEAUS   AS  QY2_ORGANISATIE_NIVEAUS
, QY1.QY1_HR_NIVEAU_VADER       AS  QY2_HR_NIVEAU_VADER
, QY1.QY1_ORGANISATIE_BK_VADER  AS  QY2_ORGANISATIE_BK_VADER
, QY1.QY1_ORGANISATIE_VADER     AS  QY2_ORGANISATIE_VADER
, KDR_KPL_3.ORGANISATIE_BK_KIND AS  QY2_ORGANISATIE_BK_KIND
, KDR_KPL_3.ORGANISATIE_KIND    AS  QY2_ORGANISATIE_KIND
from
(
select distinct 
--
KDR_KPL_2.HR_NIVEAU_VADER AS QY1_HR_NIVEAU_VADER
,case 
    when KDR_KPL_2.HR_NIVEAU_VADER = 7 then 'Organisatie niveau 7' 
    when KDR_KPL_2.HR_NIVEAU_VADER= 8 then 'Organisatie niveau 8'
    when KDR_KPL_2.HR_NIVEAU_VADER = 9 then 'Organisatie niveau 9'
    when KDR_KPL_2.HR_NIVEAU_VADER = 10 then 'Organisatie niveau 10'
    when KDR_KPL_2.HR_NIVEAU_VADER = 11 then 'Organisatie niveau 11'
    when KDR_KPL_2.HR_NIVEAU_VADER = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAUS
,KDR_KPL_1.organisatie_bk_vader as QY1_ORGANISATIE_BK_VADER
,KDR_KPL_1.organisatie_vader as QY1_ORGANISATIE_VADER 
--
FROM DMT.DIM_KDR_KPL_ORG_HIER KDR_KPL_1 
    INNER JOIN (select organisatie_bk_kind, hr_niveau as HR_NIVEAU_VADER from DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%') 
       KDR_KPL_2 ON KDR_KPL_1.ORGANISATIE_BK_VADER = KDR_KPL_2.ORGANISATIE_BK_KIND -- Parent info (de join is nodig voor het bepalen van de parent hr_niveau) 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null
--
) QY1 
INNER JOIN (select organisatie_bk_vader, organisatie_bk_kind, organisatie_kind from DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%') KDR_KPL_3 ON QY1.QY1_ORGANISATIE_BK_VADER = KDR_KPL_3.ORGANISATIE_BK_VADER -- info child lvl 1 (deze join bepaalt de volgende level van de parent)





INNER JOIN (select organisatie_bk_vader, organisatie_bk_kind, organisatie_kind from DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%') KDR_KPL_4 ON KDR_KPL_3.ORGANISATIE_BK_KIND = KDR_KPL_4.ORGANISATIE_BK_VADER -- info child lvl 2 (deze join bepaalt de volgende level van de parent)






INNER JOIN (select organisatie_bk_vader, organisatie_bk_kind, organisatie_kind from DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%') KDR_KPL_5 ON QY1.QY1_ORGANISATIE_BK_VADER = KDR_KPL_3.ORGANISATIE_BK_VADER -- info child lvl 3 (deze join bepaalt de volgende level van de parent)
INNER JOIN (select organisatie_bk_vader, organisatie_bk_kind, organisatie_kind from DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%') KDR_KPL_6 ON QY1.QY1_ORGANISATIE_BK_VADER = KDR_KPL_3.ORGANISATIE_BK_VADER -- info child lvl 4 (deze join bepaalt de volgende level van de parent)
INNER JOIN (select organisatie_bk_vader, organisatie_bk_kind, organisatie_kind from DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%') KDR_KPL_7 ON QY1.QY1_ORGANISATIE_BK_VADER = KDR_KPL_3.ORGANISATIE_BK_VADER -- info child lvl 5 (deze join bepaalt de volgende level van de parent)
INNER JOIN (select organisatie_bk_vader, organisatie_bk_kind, organisatie_kind from DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%') KDR_KPL_8 ON QY1.QY1_ORGANISATIE_BK_VADER = KDR_KPL_3.ORGANISATIE_BK_VADER -- info child lvl 6 (deze join bepaalt de volgende level van de parent)

--
