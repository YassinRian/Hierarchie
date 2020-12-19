WITH 
CHILD_LEVEL AS 
(SELECT DIM_KDR_KPL_ORG_HIER_ID, KOSTENPLAATS_KIND, ORGANISATIE_BK_VADER, ORGANISATIE_KIND, ORGANISATIE_BK_KIND, HR_NIVEAU FROM DMT.DIM_KDR_KPL_ORG_HIER@EBS_ORACLE_1FA_ACC WHERE KOSTENPLAATS_KIND LIKE 'B5%'),
BUDGET AS (
SELECT DISTINCT 
  DIM_DATUM_JAAR_ID
, DIM_DIENST_ID
, CASE WHEN PSBSTAT.DIENSTCONTROL_AKKOORD = 'Ja' THEN 'DIENST AKKOORD' ELSE NULL END DIM_PSB_STATUS
, DIM_KDR_KPL_ORG_HIER_ID
, JAAR_T
, SUM(JAAR_T_LASTEN) OVER (PARTITION BY DIM_KDR_KPL_ORG_HIER_ID, DIM_DATUM_JAAR_ID) AS BUDGET_LASTEN
, SUM(JAAR_T_BATEN) OVER (PARTITION BY DIM_KDR_KPL_ORG_HIER_ID, DIM_DATUM_JAAR_ID) AS BUDGET_BATEN
, SUM(JAAR_T_SALDO) OVER (PARTITION BY DIM_KDR_KPL_ORG_HIER_ID, DIM_DATUM_JAAR_ID) AS BUDGET_SALDO
FROM DMT.FCT_BUDGETMUTATIEREGELS@EBS_ORACLE_1FA_ACC FBUD
LEFT OUTER JOIN DMT.DIM_PSB_STATUS@EBS_ORACLE_1FA_ACC PSBSTAT ON FBUD.DIM_PSB_STATUS_ID = PSBSTAT.DIM_PSB_STATUS_ID 
WHERE PSBSTAT.DIENSTCONTROL_AKKOORD = 'Ja'
AND DIM_DIENST_ID = 6
),
HIERARCHIE AS (
SELECT 
  LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_TOP
, LVL0.HR_NIVEAU AS HR_NIVEAU_TOP
, LVL0.KOSTENPLAATS_KIND AS KOSTENPLAATS_TOP
, LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_CHILD
, LVL0.HR_NIVEAU AS HR_NIVEAU_CHILD
, LVL0.KOSTENPLAATS_KIND AS KOSTENPLAATS_CHILD
, LVL0.ORGANISATIE_BK_KIND AS LVL_T
, LVL0.ORGANISATIE_KIND AS ORGANISATIE_TOP
, TO_NUMBER('') AS LVL1
, '' AS ORGANISATIE_LVL1
, TO_NUMBER('') AS LVL2
, '' AS ORGANISATIE_LVL2
, TO_NUMBER('') AS LVL3
, '' AS ORGANISATIE_LVL3
, TO_NUMBER('') AS LVL4
, '' AS ORGANISATIE_LVL4
, TO_NUMBER('') AS LVL5
, '' AS ORGANISATIE_LVL5
, TO_NUMBER('') AS LVL6
, '' AS ORGANISATIE_LVL6
FROM DMT.DIM_KDR_KPL_ORG_HIER@EBS_ORACLE_1FA_ACC LVL0
WHERE KOSTENPLAATS_KIND LIKE 'B5%' 
UNION ALL
SELECT 
  LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_TOP
, LVL0.HR_NIVEAU AS HR_NIVEAU_TOP
, LVL0.KOSTENPLAATS_KIND AS KOSTENPLAATS_TOP
, LVL1.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_CHILD
, LVL1.HR_NIVEAU AS HR_NIVEAU_CHILD
, LVL1.KOSTENPLAATS_KIND AS KOSTENPLAATS_CHILD
, LVL0.ORGANISATIE_BK_KIND AS LVL_T 
, LVL0.ORGANISATIE_KIND AS ORGANISATIE_TOP
, LVL1.ORGANISATIE_BK_KIND AS LVL1
, LVL1.ORGANISATIE_KIND AS ORGANISATIE_LVL1
, TO_NUMBER('') AS LVL2
, '' AS ORGANISATIE_LVL2
, TO_NUMBER('') AS LVL3
, '' AS ORGANISATIE_LVL3
, TO_NUMBER('') AS LVL4
, '' AS ORGANISATIE_LVL4
, TO_NUMBER('') AS LVL5
, '' AS ORGANISATIE_LVL5
, TO_NUMBER('') AS LVL6
, '' AS ORGANISATIE_LVL6
FROM DMT.DIM_KDR_KPL_ORG_HIER@EBS_ORACLE_1FA_ACC LVL0 
INNER JOIN CHILD_LEVEL LVL1 ON LVL0.ORGANISATIE_BK_KIND = LVL1.ORGANISATIE_BK_VADER 
WHERE LVL0.KOSTENPLAATS_KIND LIKE 'B5%' 
UNION ALL
SELECT 
  LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_TOP
, LVL0.HR_NIVEAU AS HR_NIVEAU_TOP
, LVL0.KOSTENPLAATS_KIND AS KOSTENPLAATS_TOP
, LVL2.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_CHILD
, LVL2.HR_NIVEAU AS HR_NIVEAU_CHILD
, LVL2.KOSTENPLAATS_KIND AS KOSTENPLAATS_CHILD
, LVL0.ORGANISATIE_BK_KIND AS LVL_T 
, LVL0.ORGANISATIE_KIND AS ORGANISATIE_TOP
, LVL1.ORGANISATIE_BK_KIND AS LVL1
, LVL1.ORGANISATIE_KIND AS ORGANISATIE_LVL1
, LVL2.ORGANISATIE_BK_KIND AS LVL2
, LVL2.ORGANISATIE_KIND AS ORGANISATIE_LVL2
, TO_NUMBER('') AS LVL3
, '' AS ORGANISATIE_LVL3
, TO_NUMBER('') AS LVL4
, '' AS ORGANISATIE_LVL4
, TO_NUMBER('') AS LVL5
, '' AS ORGANISATIE_LVL5
, TO_NUMBER('') AS LVL6
, '' AS ORGANISATIE_LVL6
FROM DMT.DIM_KDR_KPL_ORG_HIER@EBS_ORACLE_1FA_ACC LVL0
INNER JOIN CHILD_LEVEL LVL1 ON LVL0.ORGANISATIE_BK_KIND = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER 
WHERE LVL0.KOSTENPLAATS_KIND LIKE 'B5%' 
UNION ALL
SELECT 
  LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_TOP
, LVL0.HR_NIVEAU AS HR_NIVEAU_TOP
, LVL0.KOSTENPLAATS_KIND AS KOSTENPLAATS_TOP
, LVL3.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_CHILD
, LVL3.HR_NIVEAU AS HR_NIVEAU_CHILD
, LVL3.KOSTENPLAATS_KIND AS KOSTENPLAATS_CHILD
, LVL0.ORGANISATIE_BK_KIND AS LVL_T 
, LVL0.ORGANISATIE_KIND AS ORGANISATIE_TOP
, LVL1.ORGANISATIE_BK_KIND AS LVL1
, LVL1.ORGANISATIE_KIND AS ORGANISATIE_LVL1
, LVL2.ORGANISATIE_BK_KIND AS LVL2
, LVL2.ORGANISATIE_KIND AS ORGANISATIE_LVL2
, LVL3.ORGANISATIE_BK_KIND AS LVL3
, LVL3.ORGANISATIE_KIND AS ORGANISATIE_LVL3
, TO_NUMBER('') AS LVL4
, '' AS ORGANISATIE_LVL4
, TO_NUMBER('') AS LVL5
, '' AS ORGANISATIE_LVL5
, TO_NUMBER('') AS LVL6
, '' AS ORGANISATIE_LVL6
FROM DMT.DIM_KDR_KPL_ORG_HIER@EBS_ORACLE_1FA_ACC LVL0
INNER JOIN CHILD_LEVEL LVL1 ON LVL0.ORGANISATIE_BK_KIND = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL3 ON LVL2.ORGANISATIE_BK_KIND = LVL3.ORGANISATIE_BK_VADER 
WHERE LVL0.KOSTENPLAATS_KIND LIKE 'B5%' 
UNION ALL
SELECT 
  LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_TOP
, LVL0.HR_NIVEAU AS HR_NIVEAU_TOP
, LVL0.KOSTENPLAATS_KIND AS KOSTENPLAATS_TOP
, LVL4.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_CHILD
, LVL4.HR_NIVEAU AS HR_NIVEAU_CHILD
, LVL4.KOSTENPLAATS_KIND AS KOSTENPLAATS_CHILD
, LVL0.ORGANISATIE_BK_KIND AS LVL_T 
, LVL0.ORGANISATIE_KIND AS ORGANISATIE_TOP
, LVL1.ORGANISATIE_BK_KIND AS LVL1
, LVL1.ORGANISATIE_KIND AS ORGANISATIE_LVL1
, LVL2.ORGANISATIE_BK_KIND AS LVL2
, LVL2.ORGANISATIE_KIND AS ORGANISATIE_LVL2
, LVL3.ORGANISATIE_BK_KIND AS LVL3
, LVL3.ORGANISATIE_KIND AS ORGANISATIE_LVL3
, LVL4.ORGANISATIE_BK_KIND AS LVL4
, LVL4.ORGANISATIE_KIND AS ORGANISATIE_LVL4
, TO_NUMBER('') AS LVL5
, '' AS ORGANISATIE_LVL5
, TO_NUMBER('') AS LVL6
, '' AS ORGANISATIE_LVL6
FROM DMT.DIM_KDR_KPL_ORG_HIER@EBS_ORACLE_1FA_ACC LVL0
INNER JOIN CHILD_LEVEL LVL1 ON LVL0.ORGANISATIE_BK_KIND = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL3 ON LVL2.ORGANISATIE_BK_KIND = LVL3.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL4 ON LVL3.ORGANISATIE_BK_KIND = LVL4.ORGANISATIE_BK_VADER 
WHERE LVL0.KOSTENPLAATS_KIND LIKE 'B5%'
UNION ALL
SELECT 
  LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_TOP
, LVL0.HR_NIVEAU AS HR_NIVEAU_TOP
, LVL0.KOSTENPLAATS_KIND AS KOSTENPLAATS_TOP
, LVL5.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_CHILD
, LVL5.HR_NIVEAU AS HR_NIVEAU_CHILD
, LVL5.KOSTENPLAATS_KIND AS KOSTENPLAATS_CHILD
, LVL0.ORGANISATIE_BK_KIND AS LVL_T 
, LVL0.ORGANISATIE_KIND AS ORGANISATIE_TOP
, LVL1.ORGANISATIE_BK_KIND AS LVL1
, LVL1.ORGANISATIE_KIND AS ORGANISATIE_LVL1
, LVL2.ORGANISATIE_BK_KIND AS LVL2
, LVL2.ORGANISATIE_KIND AS ORGANISATIE_LVL2
, LVL3.ORGANISATIE_BK_KIND AS LVL3
, LVL3.ORGANISATIE_KIND AS ORGANISATIE_LVL3
, LVL4.ORGANISATIE_BK_KIND AS LVL4
, LVL4.ORGANISATIE_KIND AS ORGANISATIE_LVL4
, LVL5.ORGANISATIE_BK_KIND AS LVL5
, LVL5.ORGANISATIE_KIND AS ORGANISATIE_LVL5
, TO_NUMBER('') AS LVL6
, '' AS ORGANISATIE_LVL6
FROM DMT.DIM_KDR_KPL_ORG_HIER@EBS_ORACLE_1FA_ACC LVL0
INNER JOIN CHILD_LEVEL LVL1 ON LVL0.ORGANISATIE_BK_KIND = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL3 ON LVL2.ORGANISATIE_BK_KIND = LVL3.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL4 ON LVL3.ORGANISATIE_BK_KIND = LVL4.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL5 ON LVL4.ORGANISATIE_BK_KIND = LVL5.ORGANISATIE_BK_VADER 
WHERE LVL0.KOSTENPLAATS_KIND LIKE 'B5%' 
UNION ALL
SELECT 
  LVL0.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_TOP
, LVL0.HR_NIVEAU AS HR_NIVEAU_TOP
, LVL0.KOSTENPLAATS_KIND AS KOSTENPLAATS_TOP
, LVL6.DIM_KDR_KPL_ORG_HIER_ID AS KPLKDR_ID_CHILD
, LVL6.HR_NIVEAU AS HR_NIVEAU_CHILD
, LVL6.KOSTENPLAATS_KIND AS KOSTENPLAATS_CHILD
, LVL0.ORGANISATIE_BK_KIND AS LVL_T 
, LVL0.ORGANISATIE_KIND AS ORGANISATIE_TOP
, LVL1.ORGANISATIE_BK_KIND AS LVL1
, LVL1.ORGANISATIE_KIND AS ORGANISATIE_LVL1
, LVL2.ORGANISATIE_BK_KIND AS LVL2
, LVL2.ORGANISATIE_KIND AS ORGANISATIE_LVL2
, LVL3.ORGANISATIE_BK_KIND AS LVL3
, LVL3.ORGANISATIE_KIND AS ORGANISATIE_LVL3
, LVL4.ORGANISATIE_BK_KIND AS LVL4
, LVL4.ORGANISATIE_KIND AS ORGANISATIE_LVL4
, LVL5.ORGANISATIE_BK_KIND AS LVL5
, LVL5.ORGANISATIE_KIND AS ORGANISATIE_LVL5
, LVL6.ORGANISATIE_BK_KIND AS LVL6
, LVL6.ORGANISATIE_KIND AS ORGANISATIE_LVL6
FROM DMT.DIM_KDR_KPL_ORG_HIER@EBS_ORACLE_1FA_ACC LVL0
INNER JOIN CHILD_LEVEL LVL1 ON LVL0.ORGANISATIE_BK_KIND = LVL1.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL2 ON LVL1.ORGANISATIE_BK_KIND = LVL2.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL3 ON LVL2.ORGANISATIE_BK_KIND = LVL3.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL4 ON LVL3.ORGANISATIE_BK_KIND = LVL4.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL5 ON LVL4.ORGANISATIE_BK_KIND = LVL5.ORGANISATIE_BK_VADER 
INNER JOIN CHILD_LEVEL LVL6 ON LVL5.ORGANISATIE_BK_KIND = LVL6.ORGANISATIE_BK_VADER 
WHERE LVL0.KOSTENPLAATS_KIND LIKE 'B5%' 
)
SELECT
 QY2.GBP_PERIODE_JAAR
,QY2.GBP_MAAND_NUMMER
,QY2.KPLKDR_ID_TOP
,QY2.HR_NIVEAU_TOP
,QY2.KPLKDR_ID_CHILD
,QY2.HR_NIVEAU_CHILD
,QY2.KOSTENPLAATS_CHILD
,QY2.GBP_BEGINDATUM_PERIODE
,QY2.GBP_EINDDATUM_PERIODE
,INITCAP(LOWER(TO_CHAR(QY2.GBP_EINDDATUM_PERIODE, 'MON', 'nls_date_language=Dutch'))) as MAAND_NAAM
,INITCAP(LOWER(TO_CHAR(QY2.GBP_EINDDATUM_PERIODE, 'DD-MON', 'nls_date_language=Dutch'))) as GBP_DD_MON
,QY2.FPSB_DIM_DIENST
,BUDGET.DIM_PSB_STATUS
,QY2.FPSB_REALISATIE_LASTEN
,QY2.FPSB_REALISATIE_BATEN
,QY2.FPSB_OPENSTAANDE_VERPL
,BUDGET.BUDGET_LASTEN
,BUDGET.BUDGET_BATEN
,BUDGET.BUDGET_SALDO
, QY2.LVL_T 
, QY2.ORGANISATIE_TOP
, QY2.LVL1
, QY2.ORGANISATIE_LVL1
, QY2.LVL2
, QY2.ORGANISATIE_LVL2
, QY2.LVL3
, QY2.ORGANISATIE_LVL3
, QY2.LVL4
, QY2.ORGANISATIE_LVL4
, QY2.LVL5
, QY2.ORGANISATIE_LVL5
, QY2.LVL6
, QY2.ORGANISATIE_LVL6
FROM
(
SELECT DISTINCT
 HIERARCHIE.*
,QY1.FPSB_DIM_GROOTBOEKPERIODE_ID 
,QY1.FPSB_DIM_KDR_KPL_ORG_HIER_ID
,QY1.GBP_PERIODE_JAAR
,QY1.GBP_MAAND_NUMMER
,QY1.GBP_BEGINDATUM_PERIODE
,QY1.GBP_EINDDATUM_PERIODE
,QY1.GBP_CORRECTIEPERIODE_IND
,QY1.FPSB_DIM_DATUM_JAAR_ID
,QY1.FPSB_DIM_DIENST
,SUM(QY1.FPSB_REALISATIE_BATEN) OVER (PARTITION BY QY1.FPSB_DIM_GROOTBOEKPERIODE_ID ,QY1.FPSB_DIM_KDR_KPL_ORG_HIER_ID) AS FPSB_REALISATIE_BATEN
,SUM(QY1.FPSB_REALISATIE_LASTEN) OVER (PARTITION BY QY1.FPSB_DIM_GROOTBOEKPERIODE_ID ,QY1.FPSB_DIM_KDR_KPL_ORG_HIER_ID) AS FPSB_REALISATIE_LASTEN
,SUM(QY1.FPSB_OPENSTAANDE_VERPL) OVER (PARTITION BY QY1.FPSB_DIM_GROOTBOEKPERIODE_ID ,QY1.FPSB_DIM_KDR_KPL_ORG_HIER_ID) AS FPSB_OPENSTAANDE_VERPL
FROM
(
SELECT
COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) COUNT_
,CASE
WHEN COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) = 1 THEN 1 
WHEN COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) = 2 AND GBP_CORRECTIEPERIODE_IND = 'Ja' THEN 1 ELSE 0 END AS HULPCALC_CORRECTIEPERIODE_IND
,QY0.*
FROM
(
SELECT
 FPSB.DIM_GROOTBOEKPERIODE_ID AS FPSB_DIM_GROOTBOEKPERIODE_ID
,FPSB.DIM_KDR_KPL_ORG_HIER_ID AS FPSB_DIM_KDR_KPL_ORG_HIER_ID
,FPSB.DIM_BOEKSLEUTEL_ID AS FPSB_DIM_BOEKSLEUTEL_ID
,GBP.PERIODE_JAAR AS GBP_PERIODE_JAAR
,EXTRACT(MONTH FROM GBP.BEGINDATUM_PERIODE) AS GBP_MAAND_NUMMER
,GBP.BEGINDATUM_PERIODE AS GBP_BEGINDATUM_PERIODE
,GBP.EINDDATUM_PERIODE AS GBP_EINDDATUM_PERIODE
,GBP.CORRECTIEPERIODE_IND AS GBP_CORRECTIEPERIODE_IND
,FPSB.DIM_DATUM_JAAR_ID AS FPSB_DIM_DATUM_JAAR_ID
,CASE WHEN FPSB.DIM_DIENST_ID = 6 THEN 'OCW' ELSE NULL END AS FPSB_DIM_DIENST
,FPSB.REALISATIE_BATEN AS FPSB_REALISATIE_BATEN
,FPSB.REALISATIE_LASTEN AS FPSB_REALISATIE_LASTEN
,FPSB.VERPLICHTING AS FPSB_OPENSTAANDE_VERPL
FROM DMT.FCT_BALANSREGELS_PSB@EBS_ORACLE_1FA_ACC FPSB 
INNER JOIN DMT.DIM_GROOTBOEKPERIODE@EBS_ORACLE_1FA_ACC GBP ON FPSB.DIM_GROOTBOEKPERIODE_ID = GBP.DIM_GROOTBOEKPERIODE_ID
WHERE FPSB.DIM_DIENST_ID = 6 
) QY0
) QY1
INNER JOIN HIERARCHIE ON HIERARCHIE.KPLKDR_ID_CHILD = QY1.FPSB_DIM_KDR_KPL_ORG_HIER_ID 
WHERE QY1.HULPCALC_CORRECTIEPERIODE_IND = 1  
) QY2
LEFT JOIN BUDGET ON QY2.FPSB_DIM_KDR_KPL_ORG_HIER_ID = BUDGET.DIM_KDR_KPL_ORG_HIER_ID AND QY2.GBP_PERIODE_JAAR = BUDGET.DIM_DATUM_JAAR_ID