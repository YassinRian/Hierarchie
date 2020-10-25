WITH CHILD_LEVEL AS
(SELECT ORGANISATIE_BK_VADER, ORGANISATIE_BK_KIND, HR_NIVEAU FROM DMT.DIM_KDR_KPL_ORG_HIER WHERE KOSTENPLAATS_KIND LIKE 'B%')
SELECT 
 QY1.*
,LVL1.ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_CHILD
,LVL1.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
FROM
(
SELECT DISTINCT 
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
,CASE 
    WHEN HR_NIVEAU = 7 THEN 'ORGANISATIE NIVEAU 7' 
    WHEN HR_NIVEAU = 8 THEN 'ORGANISATIE NIVEAU 8'
    WHEN HR_NIVEAU = 9 THEN 'ORGANISATIE NIVEAU 9'
    WHEN HR_NIVEAU = 10 THEN 'ORGANISATIE NIVEAU 10'
    WHEN HR_NIVEAU = 11 THEN 'ORGANISATIE NIVEAU 11'
    WHEN HR_NIVEAU = 12 THEN 'ORGANISATIE NIVEAU 12'
ELSE NULL END AS QY1_ORGANISATIE_NIVEAU_TOP
,ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_TOP
,ORGANISATIE_KIND AS QY1_ORGANISATIE_TOP
FROM DMT.DIM_KDR_KPL_ORG_HIER 
WHERE KOSTENPLAATS_KIND LIKE 'B%' AND ORGANISATIE_BK_VADER IS NOT NULL AND ORGANISATIE_BK_KIND = 4299
) QY1
INNER JOIN CHILD_LEVEL LVL1 ON QY1_ORGANISATIE_BK_TOP = LVL1.ORGANISATIE_BK_VADER 
UNION ALL
SELECT 
 QY1.*
,LVL2.ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_CHILD
,LVL2.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
FROM
(
SELECT DISTINCT 
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
,CASE 
    WHEN HR_NIVEAU = 7 THEN 'ORGANISATIE NIVEAU 7' 
    WHEN HR_NIVEAU = 8 THEN 'ORGANISATIE NIVEAU 8'
    WHEN HR_NIVEAU = 9 THEN 'ORGANISATIE NIVEAU 9'
    WHEN HR_NIVEAU = 10 THEN 'ORGANISATIE NIVEAU 10'
    WHEN HR_NIVEAU = 11 THEN 'ORGANISATIE NIVEAU 11'
    WHEN HR_NIVEAU = 12 THEN 'ORGANISATIE NIVEAU 12'
ELSE NULL END AS QY1_ORGANISATIE_NIVEAU_TOP
,ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_TOP
,ORGANISATIE_KIND AS QY1_ORGANISATIE_TOP
FROM DMT.DIM_KDR_KPL_ORG_HIER 
WHERE KOSTENPLAATS_KIND LIKE 'B%' AND ORGANISATIE_BK_VADER IS NOT NULL AND ORGANISATIE_BK_KIND = 4299
) QY1
INNER JOIN CHILD_LEVEL LVL1 ON QY1_ORGANISATIE_BK_TOP = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER
UNION ALL
SELECT 
 QY1.*
,LVL3.ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_CHILD
,LVL3.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
FROM
(
SELECT DISTINCT 
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
,CASE 
    WHEN HR_NIVEAU = 7 THEN 'ORGANISATIE NIVEAU 7' 
    WHEN HR_NIVEAU = 8 THEN 'ORGANISATIE NIVEAU 8'
    WHEN HR_NIVEAU = 9 THEN 'ORGANISATIE NIVEAU 9'
    WHEN HR_NIVEAU = 10 THEN 'ORGANISATIE NIVEAU 10'
    WHEN HR_NIVEAU = 11 THEN 'ORGANISATIE NIVEAU 11'
    WHEN HR_NIVEAU = 12 THEN 'ORGANISATIE NIVEAU 12'
ELSE NULL END AS QY1_ORGANISATIE_NIVEAU_TOP
,ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_TOP
,ORGANISATIE_KIND AS QY1_ORGANISATIE_TOP
FROM DMT.DIM_KDR_KPL_ORG_HIER 
WHERE KOSTENPLAATS_KIND LIKE 'B%' AND ORGANISATIE_BK_VADER IS NOT NULL AND ORGANISATIE_BK_KIND = 4299
) QY1
INNER JOIN CHILD_LEVEL LVL1 ON QY1_ORGANISATIE_BK_TOP = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL3 ON LVL2.ORGANISATIE_BK_KIND = LVL3.ORGANISATIE_BK_VADER
UNION ALL
SELECT 
 QY1.*
,LVL4.ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_CHILD
,LVL4.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
FROM
(
SELECT DISTINCT 
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
,CASE 
    WHEN HR_NIVEAU = 7 THEN 'ORGANISATIE NIVEAU 7' 
    WHEN HR_NIVEAU = 8 THEN 'ORGANISATIE NIVEAU 8'
    WHEN HR_NIVEAU = 9 THEN 'ORGANISATIE NIVEAU 9'
    WHEN HR_NIVEAU = 10 THEN 'ORGANISATIE NIVEAU 10'
    WHEN HR_NIVEAU = 11 THEN 'ORGANISATIE NIVEAU 11'
    WHEN HR_NIVEAU = 12 THEN 'ORGANISATIE NIVEAU 12'
ELSE NULL END AS QY1_ORGANISATIE_NIVEAU_TOP
,ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_TOP
,ORGANISATIE_KIND AS QY1_ORGANISATIE_TOP
FROM DMT.DIM_KDR_KPL_ORG_HIER 
WHERE KOSTENPLAATS_KIND LIKE 'B%' AND ORGANISATIE_BK_VADER IS NOT NULL AND ORGANISATIE_BK_KIND = 4299
) QY1
INNER JOIN CHILD_LEVEL LVL1 ON QY1_ORGANISATIE_BK_TOP = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL3 ON LVL2.ORGANISATIE_BK_KIND = LVL3.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL4 ON LVL3.ORGANISATIE_BK_KIND = LVL4.ORGANISATIE_BK_VADER
UNION ALL
SELECT 
 QY1.*
,LVL5.ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_CHILD
,LVL5.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
FROM
(
SELECT DISTINCT 
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
,CASE 
    WHEN HR_NIVEAU = 7 THEN 'ORGANISATIE NIVEAU 7' 
    WHEN HR_NIVEAU = 8 THEN 'ORGANISATIE NIVEAU 8'
    WHEN HR_NIVEAU = 9 THEN 'ORGANISATIE NIVEAU 9'
    WHEN HR_NIVEAU = 10 THEN 'ORGANISATIE NIVEAU 10'
    WHEN HR_NIVEAU = 11 THEN 'ORGANISATIE NIVEAU 11'
    WHEN HR_NIVEAU = 12 THEN 'ORGANISATIE NIVEAU 12'
ELSE NULL END AS QY1_ORGANISATIE_NIVEAU_TOP
,ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_TOP
,ORGANISATIE_KIND AS QY1_ORGANISATIE_TOP
FROM DMT.DIM_KDR_KPL_ORG_HIER 
WHERE KOSTENPLAATS_KIND LIKE 'B%' AND ORGANISATIE_BK_VADER IS NOT NULL AND ORGANISATIE_BK_KIND = 4299
) QY1
INNER JOIN CHILD_LEVEL LVL1 ON QY1_ORGANISATIE_BK_TOP = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL3 ON LVL2.ORGANISATIE_BK_KIND = LVL3.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL4 ON LVL3.ORGANISATIE_BK_KIND = LVL4.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL5 ON LVL4.ORGANISATIE_BK_KIND = LVL5.ORGANISATIE_BK_VADER
UNION ALL
SELECT 
 QY1.*
,LVL6.ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_CHILD
,LVL6.HR_NIVEAU AS ORGANISATIE_NIVEAU_CHILD
FROM
(
SELECT DISTINCT 
HR_NIVEAU AS QY1_HR_NIVEAU_TOP
,CASE 
    WHEN HR_NIVEAU = 7 THEN 'ORGANISATIE NIVEAU 7' 
    WHEN HR_NIVEAU = 8 THEN 'ORGANISATIE NIVEAU 8'
    WHEN HR_NIVEAU = 9 THEN 'ORGANISATIE NIVEAU 9'
    WHEN HR_NIVEAU = 10 THEN 'ORGANISATIE NIVEAU 10'
    WHEN HR_NIVEAU = 11 THEN 'ORGANISATIE NIVEAU 11'
    WHEN HR_NIVEAU = 12 THEN 'ORGANISATIE NIVEAU 12'
ELSE NULL END AS QY1_ORGANISATIE_NIVEAU_TOP
,ORGANISATIE_BK_KIND AS QY1_ORGANISATIE_BK_TOP
,ORGANISATIE_KIND AS QY1_ORGANISATIE_TOP
FROM DMT.DIM_KDR_KPL_ORG_HIER 
WHERE KOSTENPLAATS_KIND LIKE 'B%' AND ORGANISATIE_BK_VADER IS NOT NULL AND ORGANISATIE_BK_KIND = 4299
) QY1
INNER JOIN CHILD_LEVEL LVL1 ON QY1_ORGANISATIE_BK_TOP = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL3 ON LVL2.ORGANISATIE_BK_KIND = LVL3.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL4 ON LVL3.ORGANISATIE_BK_KIND = LVL4.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL5 ON LVL4.ORGANISATIE_BK_KIND = LVL5.ORGANISATIE_BK_VADER
INNER JOIN CHILD_LEVEL LVL6 ON LVL5.ORGANISATIE_BK_KIND = LVL6.ORGANISATIE_BK_VADER



--========================================================================================
--datum: 22-10-20
--
WITH CHILD_LEVEL AS
(SELECT DIM_KDR_KPL_ORG_HIER_ID, ORGANISATIE_BK_VADER, ORGANISATIE_BK_KIND, HR_NIVEAU FROM DMT.DIM_KDR_KPL_ORG_HIER WHERE KOSTENPLAATS_KIND LIKE 'B%')
-- top lvl
select 
lvl0.DIM_KDR_KPL_ORG_HIER_ID as KPLKDR_ID_CHILD
, lvl0.DIM_KDR_KPL_ORG_HIER_ID as KPLKDR_ID_TOP
, lvl0.HR_NIVEAU
, lvl0.ORGANISATIE_BK_KIND as top
, to_number('') as LVL1
, to_number('') as LVL2
, to_number('') as LVL3
, to_number('') as LVL4
, to_number('') as LVL5
, to_number('') as LVL6
--
from DMT.DIM_KDR_KPL_ORG_HIER lvl0
WHERE KOSTENPLAATS_KIND like 'B%' and DIM_KDR_KPL_ORG_HIER_ID = 8313 
UNION ALL
-- lvl 1
select 
lvl1.DIM_KDR_KPL_ORG_HIER_ID as KPLKDR_ID_CHILD
, lvl0.DIM_KDR_KPL_ORG_HIER_ID as KPLKDR_ID_TOP
, lvl1.HR_NIVEAU
, lvl0.ORGANISATIE_BK_KIND as top
, lvl1.ORGANISATIE_BK_KIND as LVL1
, to_number('') as LVL2
, to_number('') as LVL3
, to_number('') as LVL4
, to_number('') as LVL5
, to_number('') as LVL6
--
from DMT.DIM_KDR_KPL_ORG_HIER lvl0 
INNER JOIN CHILD_LEVEL lvl1 on lvl0.ORGANISATIE_BK_KIND = lvl1.ORGANISATIE_BK_VADER 
WHERE lvl0.KOSTENPLAATS_KIND like 'B%' and lvl0.DIM_KDR_KPL_ORG_HIER_ID = 8313 
UNION ALL
-- lvl 2
select 
lvl2.DIM_KDR_KPL_ORG_HIER_ID as KPLKDR_ID_CHILD
, lvl0.DIM_KDR_KPL_ORG_HIER_ID as KPLKDR_ID_TOP
, lvl2.HR_NIVEAU
, lvl0.ORGANISATIE_BK_KIND as top
, lvl1.ORGANISATIE_BK_KIND as LVL1
, lvl2.ORGANISATIE_BK_KIND as LVL2
, to_number('') as LVL3
, to_number('') as LVL4
, to_number('') as LVL5
, to_number('') as LVL6
--
from DMT.DIM_KDR_KPL_ORG_HIER lvl0
INNER JOIN CHILD_LEVEL lvl1 on lvl0.ORGANISATIE_BK_KIND = lvl1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL lvl2 on lvl1.ORGANISATIE_BK_KIND = lvl2.ORGANISATIE_BK_VADER 
WHERE lvl0.KOSTENPLAATS_KIND like 'B%' and lvl0.DIM_KDR_KPL_ORG_HIER_ID = 8313 