====================================

datum:5/10/20
geschreven: Yassin Rian

select
gpb.begindatum_periode as GBP_begindatum_periode
gpb.datum_periode as GBP_einddatum_periode  
 DIM_DATUM_JAAR_ID
,DIM_DIENST_ID
,DIM_GROOTBOEKPERIODE_ID
,DIM_BOEKSLEUTEL_ID
,DIM_kdr_kpl_org_hier_id
,JAAR
,VERPLICHTING
,Realisatie_lasten
,Realisatie_baten

from dmt.FCT_BALANSREGELS_PSB fct_bpsb inner join dmt.dim_grootboekperiode GBP on fct_bpsb.dim_grootboekperiode_id = gbp.dim_grootboekperiode_id;





SELECT -- AFGELEIDE QUERY LEVEL 2

QY1.*
COUNT(GBP_MAAND_NUMMER) OVER (PARTITION BY ) 

FROM

(
select -- BRON QUERY LEVEL 1
 GBP.PERIODE_JAAR AS GBP_PERIODE_JAAR
,extract(MONTH from GBP.BEGINDATUM_PERIODE) AS GBP_MAAND_NUMMER
,GBP.begindatum_periode as GBP_BEGINDATUM_PERIODE
,GBP.EINDDATUM_PERIODE AS GBP_EINDDATUM_PERIODE
,GBP.CORRECTIEPERIODE_IND
,FPSB.DIM_DATUM_JAAR_ID
,FPSB.DIM_DIENST_ID
,FPSB.DIM_GROOTBOEKPERIODE_ID
,GBP.DIM_GROOTBOEKPERIODE_ID
from dmt.fct_balansregels_psb FPSB inner join dmt.dim_grootboekperiode GBP on FPSB.dim_grootboekperiode_id = GBP.dim_grootboekperiode_id
where dim_dienst_id = 47
) QY1




select * from dmt.DIM_GROOTBOEKPERIODE



select * from dmt.dim_psb_hierarchie


select * from dmt.dim_kdr_kpl_org_hier where dienst = 'OCW' and kostenplaats_kind = 'B000000' 


select * from dmt.FCT_BALANSREGELS_PSB where dim_dienst_id = 47 and dim_begrotingsstructuur_id is not null and dim_kdr_kpl_org_hier_id is not null
select * from dmt.dim_dienst


--dim_begrotingsstructuur_id = 2959
--dim_kdr_kpl_org_hier_id = 3769

select * from dmt.dim_begrotingsstructuur where dim_begrotingsstructuur_id = 2959
select * from dmt.dim_kdr_kpl_org_hier where dim_kdr_kpl_org_hier_id = 3769 


select * from dmt.dim_kdr_kpl_org_hier where dienst = 'OCW' and kostendrager_kind is not null


====================================

datum:6/10/20
geschreven: Yassin Rian



-- QY2: QUERY LEVEL 2 // NODIG VOOR FILTERING OP HULPCALC
SELECT
--
 QY1.FPSB_DIM_GROOTBOEKPERIODE_ID
,QY1.FPSB_DIM_KDR_KPL_ORG_HIER_ID
,QY1.FPSB_DIM_BOEKSLEUTEL_ID
,QY1.GBP_PERIODE_JAAR
,QY1.GBP_MAAND_NUMMER
,QY1.GBP_BEGINDATUM_PERIODE
,QY1.GBP_EINDDATUM_PERIODE
,QY1.GBP_CORRECTIEPERIODE_IND
,QY1.FPSB_DIM_DATUM_JAAR_ID
,QY1.FPSB_DIM_DIENST_ID
,QY1.FPSB_REALISATIE_BATEN
,QY1.FPSB_REALISATIE_LASTEN
,QY1.FPSB_OPENSTAANDE_VERPL
--
FROM
(
-- QY1: QUERY LEVEL 1 // NODIG VOOR HULPCALC
SELECT
COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) COUNT_
,CASE
-- BIJ DE EERSTE CASE STATEMENT IS GBP_CORRECTIEPERIODE_IND ALTIJD 'NEE', ANDERS IS DIT EEN DATAKWALITEIT ISSUE 
WHEN COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) = 1 then 1 
WHEN COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) = 2 AND GBP_CORRECTIEPERIODE_IND = 'Ja' then 1 ELSE 0 END AS HULPCALC_CORRECTIEPERIODE_IND
,QY0.*
FROM
(
 -- QY0 -BRON QUERY LEVEL 1
select
 --
 FPSB.DIM_GROOTBOEKPERIODE_ID AS FPSB_DIM_GROOTBOEKPERIODE_ID
,FPSB.DIM_KDR_KPL_ORG_HIER_ID AS FPSB_DIM_KDR_KPL_ORG_HIER_ID
,FPSB.DIM_BOEKSLEUTEL_ID AS FPSB_DIM_BOEKSLEUTEL_ID
,GBP.PERIODE_JAAR AS GBP_PERIODE_JAAR
,extract(MONTH from GBP.BEGINDATUM_PERIODE) AS GBP_MAAND_NUMMER
,GBP.begindatum_periode as GBP_BEGINDATUM_PERIODE
,GBP.EINDDATUM_PERIODE AS GBP_EINDDATUM_PERIODE
,GBP.CORRECTIEPERIODE_IND AS GBP_CORRECTIEPERIODE_IND
,FPSB.DIM_DATUM_JAAR_ID AS FPSB_DIM_DATUM_JAAR_ID
,FPSB.DIM_DIENST_ID AS FPSB_DIM_DIENST_ID
,FPSB.REALISATIE_BATEN AS FPSB_REALISATIE_BATEN
,FPSB.REALISATIE_LASTEN AS FPSB_REALISATIE_LASTEN
,FPSB.VERPLICHTING AS FPSB_OPENSTAANDE_VERPL
--
from dmt.fct_balansregels_psb FPSB inner join dmt.dim_grootboekperiode GBP on FPSB.dim_grootboekperiode_id = GBP.dim_grootboekperiode_id
where dim_dienst_id = 47 AND DIM_BOEKSLEUTEL_ID = 13354
) QY0
ORDER BY GBP_MAAND_NUMMER
) QY1
WHERE QY1.HULPCALC_CORRECTIEPERIODE_IND = 1


================ test queries mbt de relatie KDR en organisaties ===============


select * from dmt.dim_begrotingsstructuur where dim_begrotingsstructuur_id = 2959
select * from dmt.dim_kdr_kpl_org_hier where dim_kdr_kpl_org_hier_id = 3769 


select * from dmt.dim_kdr_kpl_org_hier where dienst = 'OCW' and kostendrager_kind is not null


SELECT * FROM DMT.DIM_PSB_HIERARCHIE WHERE KOSTENPLAATS LIKE '%B5%' OR KOSTENDRAGER LIKE '%B6%' 

SELECT * FROM DMT.DIM_PSB_HIERARCHIE WHERE APPARAAT_SUBCATEGORIE_EN_OMS LIKE '%Toegerekende%' and (kostenplaats like 'B5%' or kostendrager like 'B6%')
SELECT distinct hoofd_ecat_oms FROM DMT.DIM_PSB_HIERARCHIE where kostenplaats like 'B5%' or kostendrager like 'B6%' order by hoofd_ecat_oms

select * from dmt.dim_begrotingsstructuur where kostendrager = 'B661055'

select * from dmt.dim_kdr_kpl_org_hier where kostenplaats_kind = 'B512231'

select * from dmt.fct_balansregels_psb where dim_kdr_kpl_org_hier_id = '4007'

select * from dmt.dim_kostendrager_org_hier where kostendrager_org_hier_key like 'B6%' and kostendrager_kind = 'B661055'

select * from dmt.dim_kdr_kpl_org_hier where dienst = 'OCW' and kostendrager_kind = 'B661055'
select distinct hierpad_organisatie from dmt.dim_kdr_kpl_org_hier where dienst = 'OCW' and kostendrager_kind like 'B6%'
select hr_organisatieniveau_4, hr_organisatieniveau_5, hr_organisatieniveau_6, hr_organisatieniveau_7 from dmt.dim_kdr_kpl_org_hier where dienst = 'OCW' and kostendrager_kind = 'B661055'
select * from dmt.dim_begrotingsstructuur where kostendrager = 'B661055' -- (programma's en deelactiviteiten)



====================================

datum:7/10/20
geschreven: Yassin Rian


-- QY2: QUERY LEVEL 2 // NODIG VOOR FILTERING OP HULPCALC
SELECT
--
 QY1.FPSB_DIM_GROOTBOEKPERIODE_ID
,QY1.FPSB_DIM_KDR_KPL_ORG_HIER_ID
,QY1.FPSB_DIM_BOEKSLEUTEL_ID
,QY1.HR_NIVEAU
,QY1.ORGANISATIE_BK_KIND
,QY1.GBP_PERIODE_JAAR
,QY1.GBP_MAAND_NUMMER
,QY1.GBP_BEGINDATUM_PERIODE
,QY1.GBP_EINDDATUM_PERIODE
,QY1.GBP_CORRECTIEPERIODE_IND
,QY1.FPSB_DIM_DATUM_JAAR_ID
,QY1.FPSB_DIM_DIENST_ID
,QY1.FPSB_REALISATIE_BATEN
,QY1.FPSB_REALISATIE_LASTEN
,QY1.FPSB_OPENSTAANDE_VERPL
--
FROM
(
-- QY1: QUERY LEVEL 1 // NODIG VOOR HULPCALC
SELECT
COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) COUNT_
,CASE
-- BIJ DE EERSTE CASE STATEMENT IS GBP_CORRECTIEPERIODE_IND ALTIJD 'NEE', ANDERS IS DIT EEN DATAKWALITEIT ISSUE 
WHEN COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) = 1 then 1 
WHEN COUNT(FPSB_DIM_GROOTBOEKPERIODE_ID) OVER (PARTITION BY FPSB_DIM_BOEKSLEUTEL_ID, GBP_PERIODE_JAAR, GBP_MAAND_NUMMER) = 2 AND GBP_CORRECTIEPERIODE_IND = 'Ja' then 1 ELSE 0 END AS HULPCALC_CORRECTIEPERIODE_IND
,QY0.*
FROM
(
 -- QY0 -BRON QUERY LEVEL 1
select
 --
 FPSB.DIM_GROOTBOEKPERIODE_ID AS FPSB_DIM_GROOTBOEKPERIODE_ID
,FPSB.DIM_KDR_KPL_ORG_HIER_ID AS FPSB_DIM_KDR_KPL_ORG_HIER_ID
,FPSB.DIM_BOEKSLEUTEL_ID AS FPSB_DIM_BOEKSLEUTEL_ID
,GBP.PERIODE_JAAR AS GBP_PERIODE_JAAR
,extract(MONTH from GBP.BEGINDATUM_PERIODE) AS GBP_MAAND_NUMMER
,GBP.begindatum_periode as GBP_BEGINDATUM_PERIODE
,GBP.EINDDATUM_PERIODE AS GBP_EINDDATUM_PERIODE
,GBP.CORRECTIEPERIODE_IND AS GBP_CORRECTIEPERIODE_IND
,FPSB.DIM_DATUM_JAAR_ID AS FPSB_DIM_DATUM_JAAR_ID
,FPSB.DIM_DIENST_ID AS FPSB_DIM_DIENST_ID
,FPSB.REALISATIE_BATEN AS FPSB_REALISATIE_BATEN
,FPSB.REALISATIE_LASTEN AS FPSB_REALISATIE_LASTEN
,FPSB.VERPLICHTING AS FPSB_OPENSTAANDE_VERPL
,KPLKDR.HR_NIVEAU
,KPLKDR.ORGANISATIE_BK_KIND
--
from dmt.fct_balansregels_psb FPSB 
inner join dmt.DIM_KDR_KPL_ORG_HIER KPLKDR on FPSB.DIM_KDR_KPL_ORG_HIER_ID = KPLKDR.DIM_KDR_KPL_ORG_HIER_ID 
inner join dmt.dim_grootboekperiode GBP on FPSB.dim_grootboekperiode_id = GBP.dim_grootboekperiode_id
where dim_dienst_id = 47 --AND DIM_BOEKSLEUTEL_ID = 13354
) QY0
ORDER BY GBP_MAAND_NUMMER
) QY1
WHERE QY1.HULPCALC_CORRECTIEPERIODE_IND = 1



----------------------------------------------------

19-10-20
// hierarchie

SELECT 
*
--kostenplaats_kind 
--hr_niveau
--organsatie_bk_kind
FROM DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%' and organisatie_bk_vader = 4303;



select *
from
--
(
--Hierarchie HR/FIN organisatie niveau's
select QY1.organisatie_bk_vader, 
case when qy1.hr_niveau = 7 then 'Organisatie niveau 7'
when qy1.hr_niveau = 8 then 'Organisatie niveau 8'
when qy1.hr_niveau = 9 then 'Organisatie niveau 9'
when qy1.hr_niveau = 10 then 'Organisatie niveau 10'
when qy1.hr_niveau = 11 then 'Organisatie niveau 11'
when qy1.hr_niveau = 12 then 'Organisatie niveau 12'
else null end as Organisatie_niveaus
,QY1.hr_niveau, QY1.organisatie_vader
from
(
select distinct organisatie_bk_vader, hr_niveau, organisatie_vader FROM DMT.DIM_KDR_KPL_ORG_HIER where kostenplaats_kind like 'B%' and organisatie_bk_vader is not null order by hr_niveau
) QY1
) QY2 INNER JOIN DMT.DIM_KDR_KPL_ORG_HIER KDR_KPL ON QY2.ORGANISATIE_BK_VADER = KDR_KPL.ORGANISATIE_BK_VADER 


