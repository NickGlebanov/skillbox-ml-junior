SELECT
    agr.TARGET,
    cl.ID AS CLIENT_ID,
    cl.AGE,
    cl.GENDER,
    cl.EDUCATION,
    cl.MARITAL_STATUS,
    cl.CHILD_TOTAL,
    cl.DEPENDANTS,
    cl.SOCSTATUS_WORK_FL,
    cl.SOCSTATUS_PENS_FL,
    cl.FL_PRESENCE_FL,
    cl.OWN_AUTO,
    sal.FAMILY_INCOME,
    sal.PERSONAL_INCOME,
    job.GEN_INDUSTRY,
    job.GEN_TITLE,
    job.WORK_TIME,
    cred.CREDIT,
    cred.TERM,
    count(distinct loan.id_loan) as LOAN_NUM_TOTAL,
    count(distinct clo.id_loan) as LOAN_NUM_CLOSED


FROM D_agreement agr

LEFT JOIN D_clients cl ON agr.ID_CLIENT = cl.ID

LEFT JOIN D_salary sal ON agr.ID_CLIENT = sal.ID_CLIENT

LEFT JOIN D_job job ON agr.ID_CLIENT = job.ID_CLIENT

LEFT JOIN D_last_credit cred ON agr.ID_CLIENT = cred.ID_CLIENT

LEFT JOIN D_loan loan ON agr.ID_CLIENT = loan.ID_CLIENT
LEFT JOIN D_close_loan clo ON loan.ID_LOAN = clo.ID_LOAN and clo.closed_fl = 1
GROUP BY agr.TARGET, cl.ID, cl.AGE, cl.GENDER, cl.EDUCATION, cl.MARITAL_STATUS, cl.CHILD_TOTAL, cl.DEPENDANTS, cl.SOCSTATUS_WORK_FL, cl.SOCSTATUS_PENS_FL, cl.FL_PRESENCE_FL, cl.OWN_AUTO, sal.FAMILY_INCOME, sal.PERSONAL_INCOME, job.GEN_INDUSTRY, job.GEN_TITLE, job.WORK_TIME, cred.CREDIT, cred.TERM
