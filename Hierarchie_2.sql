-- Parent-Child 1,2
select 
 QY1.*
,KDR_KPL_lvl2.ORGANISATIE_BK_KIND as QY1_ORGANISATIE_BK_CHILD
,KDR_KPL_lvl2.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
from
(
select distinct 
--
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
--
,case 
    when HR_NIVEAU = 7 then 'Organisatie niveau 7' 
    when HR_NIVEAU = 8 then 'Organisatie niveau 8'
    when HR_NIVEAU = 9 then 'Organisatie niveau 9'
    when HR_NIVEAU = 10 then 'Organisatie niveau 10'
    when HR_NIVEAU = 11 then 'Organisatie niveau 11'
    when HR_NIVEAU = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAU_TOP
--
,organisatie_bk_kind as QY1_ORGANISATIE_BK_TOP
,organisatie_kind as QY1_ORGANISATIE_TOP
--
FROM DMT.DIM_KDR_KPL_ORG_HIER 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null and organisatie_bk_kind = 4294
--
) QY1
INNER JOIN (SELECT ORGANISATIE_BK_VADER, ORGANISATIE_BK_KIND, HR_NIVEAU FROM DMT.DIM_KDR_KPL_ORG_HIER WHERE kostenplaats_kind LIKE 'B%') KDR_KPL_lvl2 on QY1_ORGANISATIE_BK_TOP = KDR_KPL_lvl2.ORGANISATIE_BK_VADER -- kind wordt de vader in de volgende lvl
--
UNION ALL
-- child niveau 3
select 
 QY1.*
,KDR_KPL_lvl3.ORGANISATIE_BK_KIND as QY1_ORGANISATIE_BK_CHILD
,KDR_KPL_lvl3.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
from
(
select distinct 
--
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
--
,case 
    when HR_NIVEAU = 7 then 'Organisatie niveau 7' 
    when HR_NIVEAU = 8 then 'Organisatie niveau 8'
    when HR_NIVEAU = 9 then 'Organisatie niveau 9'
    when HR_NIVEAU = 10 then 'Organisatie niveau 10'
    when HR_NIVEAU = 11 then 'Organisatie niveau 11'
    when HR_NIVEAU = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAU_TOP
--
,organisatie_bk_kind as QY1_ORGANISATIE_BK_TOP
,organisatie_kind as QY1_ORGANISATIE_TOP
--
FROM DMT.DIM_KDR_KPL_ORG_HIER 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null and organisatie_bk_kind = 4294
--
) QY1
INNER JOIN (SELECT ORGANISATIE_BK_VADER, ORGANISATIE_BK_KIND, HR_NIVEAU FROM DMT.DIM_KDR_KPL_ORG_HIER WHERE kostenplaats_kind LIKE 'B%') KDR_KPL_lvl2 on QY1_ORGANISATIE_BK_TOP = KDR_KPL_lvl2.ORGANISATIE_BK_VADER -- kind wordt de vader in de volgende lvl
INNER JOIN (SELECT ORGANISATIE_BK_VADER, ORGANISATIE_BK_KIND, HR_NIVEAU FROM DMT.DIM_KDR_KPL_ORG_HIER WHERE kostenplaats_kind LIKE 'B%') KDR_KPL_lvl3 on KDR_KPL_lvl2.ORGANISATIE_BK_KIND = KDR_KPL_lvl3.ORGANISATIE_BK_VADER
--
==============================

WITH CHILD_LEVEL AS
(SELECT ORGANISATIE_BK_VADER, ORGANISATIE_BK_KIND, HR_NIVEAU FROM DMT.DIM_KDR_KPL_ORG_HIER WHERE kostenplaats_kind LIKE 'B%')
-- child niveau 1
select 
 QY1.*
,lvl1.ORGANISATIE_BK_KIND as QY1_ORGANISATIE_BK_CHILD
,lvl1.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
from
(
select distinct 
--
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
--
,case 
    when HR_NIVEAU = 7 then 'Organisatie niveau 7' 
    when HR_NIVEAU = 8 then 'Organisatie niveau 8'
    when HR_NIVEAU = 9 then 'Organisatie niveau 9'
    when HR_NIVEAU = 10 then 'Organisatie niveau 10'
    when HR_NIVEAU = 11 then 'Organisatie niveau 11'
    when HR_NIVEAU = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAU_TOP
--
,organisatie_bk_kind as QY1_ORGANISATIE_BK_TOP
,organisatie_kind as QY1_ORGANISATIE_TOP
--
FROM DMT.DIM_KDR_KPL_ORG_HIER 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null and organisatie_bk_kind = 4294
--
) QY1
INNER JOIN CHILD_LEVEL lvl1 on QY1_ORGANISATIE_BK_TOP = lvl1.ORGANISATIE_BK_VADER -- kind wordt de vader in de volgende lvl
--
UNION ALL
-- child niveau 2
select 
 QY1.*
,lvl2.ORGANISATIE_BK_KIND as QY1_ORGANISATIE_BK_CHILD
,lvl2.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
from
(
select distinct 
--
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
--
,case 
    when HR_NIVEAU = 7 then 'Organisatie niveau 7' 
    when HR_NIVEAU = 8 then 'Organisatie niveau 8'
    when HR_NIVEAU = 9 then 'Organisatie niveau 9'
    when HR_NIVEAU = 10 then 'Organisatie niveau 10'
    when HR_NIVEAU = 11 then 'Organisatie niveau 11'
    when HR_NIVEAU = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAU_TOP
--
,organisatie_bk_kind as QY1_ORGANISATIE_BK_TOP
,organisatie_kind as QY1_ORGANISATIE_TOP
--
FROM DMT.DIM_KDR_KPL_ORG_HIER 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null and organisatie_bk_kind = 4294
--
) QY1
INNER JOIN CHILD_LEVEL lvl1 on QY1_ORGANISATIE_BK_TOP = lvl1.ORGANISATIE_BK_VADER -- kind wordt de vader in de volgende lvl
INNER JOIN CHILD_LEVEL lvl2 on lvl1.ORGANISATIE_BK_KIND = lvl2.ORGANISATIE_BK_VADER
--
UNION ALL
-- child niveau 3
select 
 QY1.*
,lvl3.ORGANISATIE_BK_KIND as QY1_ORGANISATIE_BK_CHILD
,lvl3.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
from
(
select distinct 
--
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
--
,case 
    when HR_NIVEAU = 7 then 'Organisatie niveau 7' 
    when HR_NIVEAU = 8 then 'Organisatie niveau 8'
    when HR_NIVEAU = 9 then 'Organisatie niveau 9'
    when HR_NIVEAU = 10 then 'Organisatie niveau 10'
    when HR_NIVEAU = 11 then 'Organisatie niveau 11'
    when HR_NIVEAU = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAU_TOP
--
,organisatie_bk_kind as QY1_ORGANISATIE_BK_TOP
,organisatie_kind as QY1_ORGANISATIE_TOP
--
FROM DMT.DIM_KDR_KPL_ORG_HIER 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null and organisatie_bk_kind = 4294
--
) QY1
INNER JOIN CHILD_LEVEL lvl1 on QY1_ORGANISATIE_BK_TOP = lvl1.ORGANISATIE_BK_VADER -- kind wordt de vader in de volgende lvl
INNER JOIN CHILD_LEVEL lvl2 on lvl1.ORGANISATIE_BK_KIND = lvl2.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl3 on lvl2.ORGANISATIE_BK_KIND = lvl3.ORGANISATIE_BK_VADER
--
UNION ALL
-- child niveau 4
select 
 QY1.*
,lvl4.ORGANISATIE_BK_KIND as QY1_ORGANISATIE_BK_CHILD
,lvl4.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
from
(
select distinct 
--
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
--
,case 
    when HR_NIVEAU = 7 then 'Organisatie niveau 7' 
    when HR_NIVEAU = 8 then 'Organisatie niveau 8'
    when HR_NIVEAU = 9 then 'Organisatie niveau 9'
    when HR_NIVEAU = 10 then 'Organisatie niveau 10'
    when HR_NIVEAU = 11 then 'Organisatie niveau 11'
    when HR_NIVEAU = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAU_TOP
--
,organisatie_bk_kind as QY1_ORGANISATIE_BK_TOP
,organisatie_kind as QY1_ORGANISATIE_TOP
--
FROM DMT.DIM_KDR_KPL_ORG_HIER 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null and organisatie_bk_kind = 4294
--
) QY1
INNER JOIN CHILD_LEVEL lvl1 on QY1_ORGANISATIE_BK_TOP = lvl1.ORGANISATIE_BK_VADER -- kind wordt de vader in de volgende lvl
INNER JOIN CHILD_LEVEL lvl2 on lvl1.ORGANISATIE_BK_KIND = lvl2.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl3 on lvl2.ORGANISATIE_BK_KIND = lvl3.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl4 on lvl3.ORGANISATIE_BK_KIND = lvl4.ORGANISATIE_BK_VADER
--
UNION ALL
-- child niveau 5
select 
 QY1.*
,lvl5.ORGANISATIE_BK_KIND as QY1_ORGANISATIE_BK_CHILD
,lvl5.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
from
(
select distinct 
--
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
--
,case 
    when HR_NIVEAU = 7 then 'Organisatie niveau 7' 
    when HR_NIVEAU = 8 then 'Organisatie niveau 8'
    when HR_NIVEAU = 9 then 'Organisatie niveau 9'
    when HR_NIVEAU = 10 then 'Organisatie niveau 10'
    when HR_NIVEAU = 11 then 'Organisatie niveau 11'
    when HR_NIVEAU = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAU_TOP
--
,organisatie_bk_kind as QY1_ORGANISATIE_BK_TOP
,organisatie_kind as QY1_ORGANISATIE_TOP
--
FROM DMT.DIM_KDR_KPL_ORG_HIER 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null and organisatie_bk_kind = 4294
--
) QY1
INNER JOIN CHILD_LEVEL lvl1 on QY1_ORGANISATIE_BK_TOP = lvl1.ORGANISATIE_BK_VADER -- kind wordt de vader in de volgende lvl
INNER JOIN CHILD_LEVEL lvl2 on lvl1.ORGANISATIE_BK_KIND = lvl2.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl3 on lvl2.ORGANISATIE_BK_KIND = lvl3.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl4 on lvl3.ORGANISATIE_BK_KIND = lvl4.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl5 on lvl4.ORGANISATIE_BK_KIND = lvl5.ORGANISATIE_BK_VADER
--
UNION ALL
-- child niveau 6
select 
 QY1.*
,lvl6.ORGANISATIE_BK_KIND as QY1_ORGANISATIE_BK_CHILD
,lvl6.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
from
(
select distinct 
--
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
--
,case 
    when HR_NIVEAU = 7 then 'Organisatie niveau 7' 
    when HR_NIVEAU = 8 then 'Organisatie niveau 8'
    when HR_NIVEAU = 9 then 'Organisatie niveau 9'
    when HR_NIVEAU = 10 then 'Organisatie niveau 10'
    when HR_NIVEAU = 11 then 'Organisatie niveau 11'
    when HR_NIVEAU = 12 then 'Organisatie niveau 12'
else null end as QY1_ORGANISATIE_NIVEAU_TOP
--
,organisatie_bk_kind as QY1_ORGANISATIE_BK_TOP
,organisatie_kind as QY1_ORGANISATIE_TOP
--
FROM DMT.DIM_KDR_KPL_ORG_HIER 
where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null and organisatie_bk_kind = 4294
--
) QY1
INNER JOIN CHILD_LEVEL lvl1 on QY1_ORGANISATIE_BK_TOP = lvl1.ORGANISATIE_BK_VADER -- kind wordt de vader in de volgende lvl
INNER JOIN CHILD_LEVEL lvl2 on lvl1.ORGANISATIE_BK_KIND = lvl2.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl3 on lvl2.ORGANISATIE_BK_KIND = lvl3.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl4 on lvl3.ORGANISATIE_BK_KIND = lvl4.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl5 on lvl4.ORGANISATIE_BK_KIND = lvl5.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL lvl6 on lvl5.ORGANISATIE_BK_KIND = lvl6.ORGANISATIE_BK_VADER
--
