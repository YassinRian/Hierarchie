select 
dim_datum_jaar_id
, dim_dienst_id
, dim_psb_status_id
, dim_kdr_kpl_org_hier_id
, jaar_t
, sum(jaar_t_lasten) over (partition by dim_kdr_kpl_org_hier_id, dim_datum_jaar_id)
, sum(jaar_t_baten) over (partition by dim_kdr_kpl_org_hier_id, dim_datum_jaar_id)
, sum(jaar_t_saldo) over (partition by dim_kdr_kpl_org_hier_id, dim_datum_jaar_id)
from dmt.fct_budgetmutatieregels
where dim_psb_status_id = 85 --Akk. DControl
and dim_dienst_id = 65 -- vooralsnog geen data voor dienst OCW