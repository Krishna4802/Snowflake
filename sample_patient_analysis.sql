select distinct(patient_id)from TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA order by 1 limit 10 offset 20;

select * from TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA limit 10;

select count(*) from sample_patient_data;

select patient_id,count(*) from sample_patient_data group by 1;

SELECT CASE_TYPE, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY CASE_TYPE;


SELECT CASE_STATUS, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY CASE_STATUS;


SELECT AVG(DATEDIFF(day, CASE_CLOSED_DATE,CASE_OPEN_DATE)) AS avg_days_to_close
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'cancelled';


SELECT DENIEL_REASON, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'cancelled'
GROUP BY DENIEL_REASON;


SELECT PAYER_NAME, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY PAYER_NAME;


SELECT CASE_ORIGIN, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY CASE_ORIGIN;


SELECT *
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_ID = 'c_020_pap';


SELECT AVG(DATEDIFF(day, CASE_CLOSED_DATE,CASE_OPEN_DATE)) AS avg_days_to_close
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'closed';


SELECT CASE_TYPE, CASE_STATUS, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY CASE_TYPE, CASE_STATUS
order by 1;


SELECT *
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_OUTCOME = 'PA REQUIRED';



SELECT DATE_PART(month, CASE_OPEN_DATE) AS month, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY DATE_PART(month, CASE_OPEN_DATE);


SELECT MAX(DATEDIFF(day, CASE_OPEN_DATE, CASE_CLOSED_DATE)) AS max_days_to_close
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'closed';


SELECT CASE_ID
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE MONTH(CASE_OPEN_DATE) = MONTH(CASE_CLOSED_DATE)
  AND YEAR(CASE_OPEN_DATE) = YEAR(CASE_CLOSED_DATE);


  SELECT CASE_ORIGIN, DENIEL_REASON, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'cancelled'
GROUP BY CASE_ORIGIN, DENIEL_REASON;



SELECT CASE_STATUS, CASE_ID, 
       DATEDIFF(day, CASE_OPEN_DATE, CASE_CLOSED_DATE) AS duration
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'closed' 
ORDER BY duration DESC
LIMIT 1;

select * from sample_patient_data where case_id ='c_167_pap';

SELECT CASE_TYPE, CASE_OUTCOME, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY CASE_TYPE, CASE_OUTCOME
order by case_type;


SELECT PAYER_NAME,
       COUNT(CASE WHEN CASE_OPEN_DATE IS NOT NULL THEN 1 END) AS cases_opened,
       COUNT(CASE WHEN CASE_CLOSED_DATE IS NOT NULL THEN 1 END) AS cases_closed
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY PAYER_NAME;


SELECT MEMBER_PLAN_TNAME, COUNT(*) AS cancelled_cases
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'cancelled'
GROUP BY MEMBER_PLAN_TNAME
ORDER BY cancelled_cases DESC
LIMIT 1;


select distinct(CASE_STATUS) from sample_patient_data;

select * FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA limit 10;
update sample_patient_data set CASE_CLOSED_DATE = NULL where case_id= 'c_562_TRIAGE';



SELECT CASE_ID, DATEDIFF(day, CASE_OPEN_DATE, GETDATE()) AS days_open
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_CLOSED_DATE IS NULL
ORDER BY days_open DESC
LIMIT 1;


SELECT DATE_PART(hour, CASE_CLOSE_TIME) AS close_hour, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_CLOSED_DATE IS NOT NULL
GROUP BY DATE_PART(hour, CASE_CLOSE_TIME)
ORDER BY close_hour;


SELECT DATE_PART(day, CASE_CLOSEd_date) AS close_Day, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_CLOSED_DATE IS NOT NULL
GROUP BY DATE_PART(day, CASE_CLOSEd_date)
ORDER BY close_Day;


SELECT CASE_TYPE, DENIEL_REASON, COUNT(*) AS reason_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'cancelled'
GROUP BY CASE_TYPE, DENIEL_REASON
ORDER BY CASE_TYPE, reason_count DESC;



SELECT DATE_PART(month, CASE_OPEN_DATE) AS month, YEAR(CASE_OPEN_DATE) AS year,
       COUNT(CASE_ID) AS cases_opened,
       SUM(CASE WHEN CASE_CLOSED_DATE IS NOT NULL THEN 1 ELSE 0 END) AS cases_closed
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY DATE_PART(month, CASE_OPEN_DATE), YEAR(CASE_OPEN_DATE)
ORDER BY year, month;


SELECT PAYER_NAME, COUNT(*) AS appeal_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_TYPE = 'appeal'
GROUP BY PAYER_NAME
ORDER BY appeal_count DESC;


SELECT MEMBER_PLAN_TNAME,
       COUNT(CASE WHEN CASE_OPEN_DATE IS NOT NULL THEN 1 END) AS cases_opened,
       COUNT(CASE WHEN CASE_CLOSED_DATE IS NOT NULL THEN 1 END) AS cases_closed
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY MEMBER_PLAN_TNAME;


SELECT AVG(DATEDIFF(day, CASE_OPEN_DATE, CASE_CLOSED_DATE)) AS avg_days_to_close
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_TYPE = 'appeal' AND CASE_STATUS = 'closed';


SELECT DENIEL_REASON, CASE_ORIGIN, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'cancelled'
GROUP BY DENIEL_REASON, CASE_ORIGIN
ORDER BY DENIEL_REASON, case_count DESC;


SELECT MEMBER_PLAN_TNAME, CASE_STATUS, COUNT(*) AS case_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
GROUP BY MEMBER_PLAN_TNAME, CASE_STATUS
ORDER BY MEMBER_PLAN_TNAME, CASE_STATUS;


SELECT PAYER_NAME, AVG(DATEDIFF(day, CASE_OPEN_DATE, CASE_CLOSED_DATE)) AS avg_case_duration
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_STATUS = 'closed'
GROUP BY PAYER_NAME;


SELECT --CASE_ID, 
COUNT(*) AS appeal_count
FROM TEST_DB.TEST_SCHEMA.SAMPLE_PATIENT_DATA
WHERE CASE_TYPE = 'appeal'
GROUP BY CASE_ID
HAVING COUNT(*) > 1;




select 7846769282764085706874520896345897980 as num;