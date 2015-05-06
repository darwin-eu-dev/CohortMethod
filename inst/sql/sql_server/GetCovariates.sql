/************************************************************************
@file GetCovariates.sql

Copyright 2015 Observational Health Data Sciences and Informatics

This file is part of CohortMethod

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
************************************************************************/

{DEFAULT @cdm_database = 'CDM4_SIM' } /*cdm_database: @cdm_database*/
{DEFAULT @use_existing_cohort_person = TRUE } /*use_existing_cohort_person: @ use_existing_cohort_person*/
{DEFAULT @cohort_database_schema = 'CDM4_SIM' } /*cohort_database_schema: @cohort_database_schema*/
{DEFAULT @cohort_table = 'cohort' } /*cohort_table: @cohort_table*/
{DEFAULT @cohort_concept_ids = '0,1' } /*cohort_concept_ids: @cohort_concept_ids*/
{DEFAULT @use_covariate_demographics = TRUE} /*use_covariate_demographics: @use_covariate_demographics*/
{DEFAULT @use_covariate_demographics_age = TRUE} /*use_covariate_demographics_age: @use_covariate_demographics_age*/
{DEFAULT @use_covariate_demographics_gender = TRUE} /*use_covariate_demographics_gender: @use_covariate_demographics_gender*/
{DEFAULT @use_covariate_demographics_race = TRUE} /*use_covariate_demographics_race: @use_covariate_demographics_race*/
{DEFAULT @use_covariate_demographics_ethnicity = TRUE} /*use_covariate_demographics_ethnicity: @use_covariate_demographics_ethnicity*/
{DEFAULT @use_covariate_demographics_year = TRUE} /*use_covariate_demographics_year: @use_covariate_demographics_year*/
{DEFAULT @use_covariate_demographics_month = TRUE} /*use_covariate_demographics_month: @use_covariate_demographics_month*/
{DEFAULT @use_covariate_condition_occurrence = TRUE} /*use_covariate_condition_occurrence: @use_covariate_condition_occurrence*/
{DEFAULT @use_covariate_condition_occurrence_365d = TRUE} /*use_covariate_condition_occurrence_365d: @use_covariate_condition_occurrence_365d*/
{DEFAULT @use_covariate_condition_occurrence_30d = TRUE} /*use_covariate_condition_occurrence_30d: @use_covariate_condition_occurrence_30d*/
{DEFAULT @use_covariate_condition_occurrence_inpt180d = TRUE} /*use_covariate_condition_occurrence_inpt180d: @use_covariate_condition_occurrence_inpt180d*/
{DEFAULT @use_covariate_condition_era = FALSE} /*use_covariate_condition_era: @use_covariate_condition_era*/
{DEFAULT @use_covariate_condition_era_ever = TRUE} /*use_covariate_condition_era_ever: @use_covariate_condition_era_ever*/
{DEFAULT @use_covariate_condition_era_overlap = TRUE} /*use_covariate_condition_era_overlap: @use_covariate_condition_era_overlap*/
{DEFAULT @use_covariate_condition_group = FALSE} /*use_covariate_condition_group: @use_covariate_condition_group*/
{DEFAULT @use_covariate_condition_group_meddra = TRUE} /*use_covariate_condition_group_meddra: @use_covariate_condition_group_meddra*/
{DEFAULT @use_covariate_condition_group_snomed = TRUE} /*use_covariate_condition_group_snomed: @use_covariate_condition_group_snomed*/
{DEFAULT @use_covariate_drug_exposure = FALSE} /*use_covariate_drug_exposure: @use_covariate_drug_exposure*/
{DEFAULT @use_covariate_drug_exposure_365d = TRUE} /*use_covariate_drug_exposure_365d: @use_covariate_drug_exposure_365d*/
{DEFAULT @use_covariate_drug_exposure_30d = TRUE} /*use_covariate_drug_exposure_30d: @use_covariate_drug_exposure_30d*/
{DEFAULT @use_covariate_drug_era = FALSE} /*use_covariate_drug_era: @use_covariate_drug_era*/
{DEFAULT @use_covariate_drug_era_365d = TRUE} /*use_covariate_drug_era_365d: @use_covariate_drug_era_365d*/
{DEFAULT @use_covariate_drug_era_30d = TRUE} /*use_covariate_drug_era_30d: @use_covariate_drug_era_30d*/
{DEFAULT @use_covariate_drug_era_overlap = TRUE} /*use_covariate_drug_era_overlap: @use_covariate_drug_era_overlap*/
{DEFAULT @use_covariate_drug_era_ever = TRUE} /*use_covariate_drug_era_ever: @use_covariate_drug_era_ever*/
{DEFAULT @use_covariate_drug_group = FALSE} /*use_covariate_drug_group: @use_covariate_drug_group*/
{DEFAULT @use_covariate_procedure_occurrence = FALSE} /*use_covariate_procedure_occurrence: @use_covariate_procedure_occurrence*/
{DEFAULT @use_covariate_procedure_occurrence_365d = TRUE} /*use_covariate_procedure_occurrence_365d: @use_covariate_procedure_occurrence_365d*/
{DEFAULT @use_covariate_procedure_occurrence_30d = TRUE} /*use_covariate_procedure_occurrence_30d: @use_covariate_procedure_occurrence_30d*/
{DEFAULT @use_covariate_procedure_group = FALSE} /*use_covariate_procedure_group: @use_covariate_procedure_group*/
{DEFAULT @use_covariate_observation = FALSE} /*use_covariate_observation: @use_covariate_observation*/
{DEFAULT @use_covariate_observation_365d = TRUE} /*use_covariate_observation_365d: @use_covariate_observation_365d*/
{DEFAULT @use_covariate_observation_30d = TRUE} /*use_covariate_observation_30d: @use_covariate_observation_30d*/
{DEFAULT @use_covariate_observation_below = TRUE} /*use_covariate_observation_below: @use_covariate_observation_below*/
{DEFAULT @use_covariate_observation_above = TRUE} /*use_covariate_observation_above: @use_covariate_observation_after*/
{DEFAULT @use_covariate_observation_count365d = TRUE} /*use_covariate_observation_count365d: @use_covariate_observation_count365d*/
{DEFAULT @use_covariate_concept_counts = FALSE} /*use_covariate_concept_counts: @use_covariate_concept_counts*/
{DEFAULT @use_covariate_risk_scores = FALSE} /*use_covariate_risk_scores: @use_covariate_risk_scores*/
{DEFAULT @use_covariate_risk_scores_Charlson = TRUE} /*use_covariate_risk_scores_Charlson: @use_covariate_risk_scores_Charlson*/
{DEFAULT @use_covariate_risk_scores_DCSI = TRUE} /*use_covariate_risk_scores_DCSI: @use_covariate_risk_scores_DCSI*/
{DEFAULT @use_covariate_risk_scores_CHADS2 = TRUE} /*use_covariate_risk_scores_CHADS2: @use_covariate_risk_scores_CHADS2*/
{DEFAULT @use_covariate_interaction_year = FALSE} /*use_covariate_interaction_year: @use_covariate_interaction_year*/
{DEFAULT @use_covariate_interaction_month = FALSE} /*use_covariate_interaction_month: @use_covariate_interaction_month*/
{DEFAULT @excluded_covariate_concept_ids = '' } /*excluded_covariate_concept_ids: @excluded_covariate_concept_ids*/
{DEFAULT @included_covariate_concept_ids = '' } /*included_covariate_concept_ids: @included_covariate_concept_ids*/
{DEFAULT @delete_covariates_small_count = 100 } /*delete_covariates_small_count: @delete_covariates_small_count*/

USE @cdm_database;

{!@use_existing_cohort_person} ? {
IF OBJECT_ID('tempdb..#cohort_person', 'U') IS NOT NULL
	DROP TABLE #cohort_person;

SELECT cohort_definition_id,
	subject_id,
	cohort_start_date,
	cohort_end_date
INTO #cohort_person
FROM @cohort_database_schema.@cohort_table
{@cohort_concept_ids != ''} ? {
WHERE cohort_definition_id IN (@cohort_concept_ids)
}
}

IF OBJECT_ID('tempdb..#cov', 'U') IS NOT NULL
	DROP TABLE #cov;


IF OBJECT_ID('tempdb..#cov_ref', 'U') IS NOT NULL
	DROP TABLE #cov_ref;

CREATE TABLE #cov_ref (
	covariate_id BIGINT,
	covariate_name VARCHAR(max),
	analysis_id INT,
	concept_id INT
	);

--covariate for exposure status, determining which patients are in which treatment group (only those in cohort 1 will get recorded)
INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1,
	'Cohort definition ID',
	1,
	0
	);


SELECT cohort_start_date,
	cohort_definition_id,
	subject_id AS person_id,
	1 AS covariate_id,
	cohort_definition_id AS covariate_value
    INTO #cov_exposure
FROM #cohort_person
WHERE cohort_definition_id = 1;

/**************************
***************************
DEMOGRAPHICS
***************************
**************************/
{@use_covariate_demographics} ? {



{@use_covariate_demographics_gender} ? {
--gender
SELECT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	gender_concept_id AS covariate_id,
	1 AS covariate_value
    INTO #cov_gender
FROM #cohort_person cp1
INNER JOIN person p1
	ON cp1.subject_id = p1.person_id
WHERE p1.gender_concept_id IN (
		SELECT concept_id
		FROM concept
		WHERE LOWER(concept_class) = 'gender'
		);


INSERT INTO #cov_ref (
  covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Gender = ' +
    CASE WHEN v1.concept_name IS NOT NULL
			THEN v1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	2 AS analysis_id,
	p1.covariate_id AS concept_id
FROM (SELECT distinct covariate_id FROM #cov_gender) p1
LEFT JOIN (
	SELECT concept_id,
		concept_name
	FROM concept
	WHERE LOWER(concept_class) = 'gender'
	) v1
	ON p1.covariate_id = v1.concept_id;

}


{@use_covariate_demographics_race} ? {
--race
SELECT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	race_concept_id AS covariate_id,
	1 AS covariate_value
  INTO #cov_race
FROM #cohort_person cp1
INNER JOIN person p1
	ON cp1.subject_id = p1.person_id
WHERE p1.race_concept_id IN (
		SELECT concept_id
		FROM concept
		WHERE LOWER(concept_class) = 'race'
		);


INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Race = ' + CASE WHEN v1.concept_name IS NOT NULL
  		THEN v1.concept_name
		ELSE 'Unknown invalid concept'
		END  AS covariate_name,
	3 AS analysis_id,
	p1.covariate_id AS concept_id
FROM (SELECT distinct covariate_id FROM #cov_race) p1
LEFT JOIN (
	SELECT concept_id,
		concept_name
	FROM concept
	WHERE LOWER(concept_class) = 'race'
	) v1
	ON p1.covariate_id = v1.concept_id;


}

{@use_covariate_demographics_ethnicity} ? {
--ethnicity
SELECT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	ethnicity_concept_id AS covariate_id,
	1 AS covariate_value
  INTO #cov_ethnicity
FROM #cohort_person cp1
INNER JOIN person p1
	ON cp1.subject_id = p1.person_id
WHERE p1.ethnicity_concept_id IN (
		SELECT concept_id
		FROM concept
		WHERE LOWER(concept_class) = 'ethnicity'
		);



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Ethnicity = ' + CASE WHEN v1.concept_name IS NOT NULL
  		THEN v1.concept_name
		ELSE 'Unknown invalid concept'
		END  AS covariate_name,
	4 AS analysis_id,
	p1.covariate_id AS concept_id
FROM (SELECT distinct covariate_id FROM #cov_ethnicity) p1
LEFT JOIN (
	SELECT concept_id,
		concept_name
	FROM concept
	WHERE LOWER(concept_class) = 'ethnicity'
	) v1
	ON p1.covariate_id = v1.concept_id;


}


{@use_covariate_demographics_age} ? {
--age group
SELECT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	FLOOR((YEAR(cp1.cohort_start_date) - p1.YEAR_OF_BIRTH) / 5) + 10 AS covariate_id,
	1 AS covariate_value
    INTO #cov_age
FROM #cohort_person cp1
INNER JOIN person p1
	ON cp1.subject_id = p1.person_id
WHERE (YEAR(cp1.cohort_start_date) - p1.YEAR_OF_BIRTH) >= 0
	AND (YEAR(cp1.cohort_start_date) - p1.YEAR_OF_BIRTH) < 100;




INSERT INTO #cov_ref (
  covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Age group: ' + CAST((covariate_id-10)*5 AS VARCHAR) + '-' + CAST((covariate_id-10+1)*5-1 AS VARCHAR)  AS covariate_name,
	4 AS analysis_id,
	0 AS concept_id
FROM (select distinct covariate_id FROM #cov_age) p1
;



}


{@use_covariate_demographics_year} ? {
--index year
SELECT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	YEAR(cohort_start_date) AS covariate_id,
	1 AS covariate_value
    INTO #cov_year
FROM #cohort_person cp1;


INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Index year: ' + CAST(covariate_id AS VARCHAR)  AS covariate_name,
	5 AS analysis_id,
	0 AS concept_id
FROM (select distinct covariate_id FROM #cov_year) p1
;

}


{@use_covariate_demographics_month} ? {

--index month

SELECT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	MONTH(cohort_start_date) + 40 AS covariate_id,
	1 AS covariate_value
    INTO #cov_month
FROM #cohort_person cp1;


INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Index month: ' + CAST(covariate_id-40 AS VARCHAR)  AS covariate_name,
	6 AS analysis_id,
	0 AS concept_id
FROM (select distinct covariate_id FROM #cov_month) p1
;

}

}



/**************************
***************************
CONDITION OCCURRENCE
***************************
**************************/
	{@use_covariate_condition_occurrence} ? { {@use_covariate_condition_occurrence_365d} ? {

--conditions exist:  episode in last 365d prior
SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	CAST(co1.condition_concept_id AS BIGINT) * 1000 + 101 AS covariate_id,
	1 AS covariate_value
  INTO #cov_co_365d
FROM #cohort_person cp1
INNER JOIN condition_occurrence co1
	ON cp1.subject_id = co1.person_id
WHERE co1.condition_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND co1.condition_concept_id IN (@included_covariate_concept_ids)}
	AND co1.condition_start_date <= cp1.cohort_start_date
	AND co1.condition_start_date >= dateadd(dd, - 365, cp1.cohort_start_date);



INSERT INTO #cov_ref (
  covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Condition occurrence record observed during 365d on or prior to cohort index:  ' + CAST((p1.covariate_id-101)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	101 AS analysis_id,
	(p1.covariate_id-101)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_co_365d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-101)/1000 = c1.concept_id
;


} {@use_covariate_condition_occurrence_30d} ? {

--conditions:  episode in last 30d prior
SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	CAST(co1.condition_concept_id AS BIGINT) * 1000 + 102 AS covariate_id,
	1 AS covariate_value
  INTO #cov_co_30d
FROM #cohort_person cp1
INNER JOIN condition_occurrence co1
	ON cp1.subject_id = co1.person_id
WHERE co1.condition_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND co1.condition_concept_id IN (@included_covariate_concept_ids)}
	AND co1.condition_start_date <= cp1.cohort_start_date
	AND co1.condition_start_date >= dateadd(dd, - 30, cp1.cohort_start_date);

INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Condition occurrence record observed during 30d on or prior to cohort index:  ' + CAST((p1.covariate_id-102)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	102 AS analysis_id,
  (p1.covariate_id-102)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_co_30d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-102)/1000 = c1.concept_id
;



} {@use_covariate_condition_occurrence_inpt180d} ? {

--conditions:  primary inpatient diagnosis in last 180d

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(co1.condition_concept_id AS BIGINT) * 1000 + 103 AS covariate_id,
	1 AS covariate_value
  INTO #cov_co_inpt180d
FROM #cohort_person cp1
INNER JOIN condition_occurrence co1
	ON cp1.subject_id = co1.person_id
WHERE co1.condition_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND co1.condition_concept_id IN (@included_covariate_concept_ids)}
	AND co1.condition_type_concept_id IN (38000183, 38000184, 38000199, 38000200)
	AND co1.condition_start_date <= cp1.cohort_start_date
	AND co1.condition_start_date >= dateadd(dd, - 180, cp1.cohort_start_date);



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Condition occurrence record of primary inpatient diagnosis observed during 180d on or prior to cohort index:  ' + CAST((p1.covariate_id-103)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	103 AS analysis_id,
	(p1.covariate_id-103)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_co_inpt180d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-103)/1000 = c1.concept_id
;


} }



/**************************
***************************
CONDITION ERA
***************************
**************************/
	{@use_covariate_condition_era} ? { {@use_covariate_condition_era_ever} ? {

--condition:  exist any time prior

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(ce1.condition_concept_id AS BIGINT) * 1000 + 201 AS covariate_id,
	1 AS covariate_value
  INTO #cov_ce_ever
FROM #cohort_person cp1
INNER JOIN condition_era ce1
	ON cp1.subject_id = ce1.person_id
LEFT JOIN concept c1
	ON ce1.condition_concept_id = c1.concept_id
WHERE ce1.condition_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
  {@included_covariate_concept_ids != '' } ? {AND ce1.condition_concept_id IN (@included_covariate_concept_ids)}
	AND ce1.condition_era_start_date <= cp1.cohort_start_date;


INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
  concept_id
	)
SELECT p1.covariate_id,
	'Condition era record observed during anytime on or prior to cohort index:    ' + CAST((p1.covariate_id-201)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	201 AS analysis_id,
	(p1.covariate_id-201)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_ce_ever) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-201)/1000 = c1.concept_id
;

}


{@use_covariate_condition_era_overlap} ? {

--concurrent on index date (era overlapping)

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(ce1.condition_concept_id AS BIGINT) * 1000 + 202 AS covariate_id,
	1 AS covariate_value
  INTO #cov_ce_overlap
FROM #cohort_person cp1
INNER JOIN condition_era ce1
	ON cp1.subject_id = ce1.person_id
LEFT JOIN concept c1
	ON ce1.condition_concept_id = c1.concept_id
WHERE ce1.condition_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND ce1.condition_concept_id IN (@included_covariate_concept_ids)}
	AND ce1.condition_era_start_date <= cp1.cohort_start_date
	AND ce1.condition_era_end_date >= cp1.cohort_start_date;



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
  concept_id
  )
SELECT p1.covariate_id,
	'Condition era record observed concurrent (overlapping) with cohort index:    ' + CAST((p1.covariate_id-202)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	202 AS analysis_id,
	(p1.covariate_id-202)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_ce_overlap) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-202)/1000 = c1.concept_id
;



}

}



/**************************
***************************
CONDITION GROUP
***************************
**************************/



	{@use_covariate_condition_group} ? {


IF OBJECT_ID('tempdb..#condition_group', 'U') IS NOT NULL
	DROP TABLE #condition_group;


select descendant_concept_id,
  ancestor_concept_id
  INTO #condition_group
from
(

{@use_covariate_condition_group_meddra} ? {
SELECT DISTINCT ca1.descendant_concept_id,
	ca1.ancestor_concept_id
FROM (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 100
		AND analysis_id < 300
	) ccr1
INNER JOIN concept_ancestor ca1
	ON ccr1.concept_id = ca1.descendant_concept_id
INNER JOIN concept c1
	ON ca1.ancestor_concept_id = c1.concept_id
WHERE c1.vocabulary_id = 15
	AND c1.concept_class <> 'System Organ Class'
	AND c1.concept_id NOT IN (36302170, 36303153, 36313966 /*Investigation concepts, too broad*/ {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND c1.concept_id IN (@included_covariate_concept_ids)}

{@use_covariate_condition_group_snomed} ? { UNION }

}

{@use_covariate_condition_group_snomed} ? {
SELECT DISTINCT ca1.descendant_concept_id,
  ca1.ancestor_concept_id
FROM (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 100
		AND analysis_id < 300
	) ccr1
INNER JOIN concept_ancestor ca1
	ON ccr1.concept_id = ca1.descendant_concept_id
INNER JOIN concept c1
	ON ca1.ancestor_concept_id = c1.concept_id
WHERE c1.vocabulary_id = 1
  AND c1.concept_class = 'Clinical finding'
  AND ca1.min_levels_of_separation = 1
  AND c1.concept_id NOT IN (select distinct descendant_concept_id from concept_ancestor where ancestor_concept_id = 441480 /*clinical finding*/ and max_levels_of_separation <= 2)
{@excluded_covariate_concept_ids != '' } ?	{AND c1.concept_id NOT IN (@excluded_covariate_concept_ids )}
{@included_covariate_concept_ids != '' } ? {AND c1.concept_id IN (@included_covariate_concept_ids)}

}

) t1
;

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT DISTINCT CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 50 + ccr1.analysis_id AS covariate_id,
	CASE
		WHEN analysis_id = 101
			THEN 'Condition occurrence record observed during 365d on or prior to cohort index within condition group:  '
		WHEN analysis_id = 102
			THEN 'Condition occurrence record observed during 30d on or prior to cohort index within condition group:  '
		WHEN analysis_id = 103
			THEN 'Condition occurrence record of primary inpatient diagnosis observed during 180d on or prior to cohort index within condition group:  '
		WHEN analysis_id = 201
			THEN 'Condition era record observed during anytime on or prior to cohort index within condition group:  '
		WHEN analysis_id = 202
			THEN 'Condition era record observed concurrent (overlapping) with cohort index within condition group:  '
		ELSE 'Other condition group analysis'
		END + CAST(cg1.ancestor_concept_id AS VARCHAR) + '-' + c1.concept_name AS covariate_name,
	ccr1.analysis_id,
	cg1.ancestor_concept_id AS concept_id
FROM (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 100
		AND analysis_id < 300
	) ccr1
INNER JOIN #condition_group cg1
	ON ccr1.concept_id = cg1.descendant_concept_id
INNER JOIN concept c1
	ON cg1.ancestor_concept_id = c1.concept_id;


SELECT DISTINCT cc1.cohort_start_date,
	cc1.cohort_definition_id,
	cc1.person_id,
	CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 50 + ccr1.analysis_id AS covariate_id,
	1 AS covariate_value
INTO #cov_cg
FROM

(
SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_exposure

{@use_covariate_condition_occurrence} ? {

{@use_covariate_condition_occurrence_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_co_365d

}

{@use_covariate_condition_occurrence_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_co_30d

}

{@use_covariate_condition_occurrence_inpt180d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_co_inpt180d

}

}



{@use_covariate_condition_era} ? {

{@use_covariate_condition_era_ever} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_ce_ever

}

{@use_covariate_condition_era_overlap} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_ce_overlap

}


}


) cc1
INNER JOIN (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 100
		AND analysis_id < 300
	) ccr1
	ON cc1.covariate_id = ccr1.covariate_id
INNER JOIN #condition_group cg1
	ON ccr1.concept_id = cg1.descendant_concept_id
;






TRUNCATE TABLE #condition_group;

DROP TABLE #condition_group;

}
/**************************
***************************
DRUG EXPOSURE
***************************
**************************/
	{@use_covariate_drug_exposure} ? { {@use_covariate_drug_exposure_365d} ? {

--drug exist:  episode in last 365d prior

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(de1.drug_concept_id AS BIGINT) * 1000 + 401 AS covariate_id,
	1 AS covariate_value
INTO #cov_de_365d
FROM #cohort_person cp1
INNER JOIN drug_exposure de1
	ON cp1.subject_id = de1.person_id
WHERE de1.drug_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
  {@included_covariate_concept_ids != '' } ? {AND de1.drug_concept_id IN (@included_covariate_concept_ids)}
	AND de1.drug_exposure_start_date <= cp1.cohort_start_date
	AND de1.drug_exposure_start_date >= dateadd(dd, - 365, cp1.cohort_start_date);


INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Drug exposure record observed during 365d on or prior to cohort index:  ' + CAST((p1.covariate_id-401)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	401 AS analysis_id,
	(p1.covariate_id-401)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_de_365d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-401)/1000 = c1.concept_id
;


}


{@use_covariate_drug_exposure_30d} ? {

--drug exist:  episode in last 30d prior

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(de1.drug_concept_id AS BIGINT) * 1000 + 402 AS covariate_id,
	1 AS covariate_value
  INTO #cov_de_30d
FROM #cohort_person cp1
INNER JOIN drug_exposure de1
	ON cp1.subject_id = de1.person_id
WHERE de1.drug_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND de1.drug_concept_id IN (@included_covariate_concept_ids)}
	AND de1.drug_exposure_start_date <= cp1.cohort_start_date
	AND de1.drug_exposure_start_date >= dateadd(dd, - 30, cp1.cohort_start_date);


INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Drug exposure record observed during 30d on or prior to cohort index:  ' + CAST((p1.covariate_id-402)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	402 AS analysis_id,
	(p1.covariate_id-402)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_de_30d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-402)/1000 = c1.concept_id
;


}


}
/**************************
***************************
DRUG ERA
***************************
**************************/
	{@use_covariate_drug_era} ? { {@use_covariate_drug_era_365d} ? {

--drug exist:  episode in last 365d prior

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(de1.drug_concept_id AS BIGINT) * 1000 + 501 AS covariate_id,
	1 AS covariate_value
INTO #cov_dera_365d
FROM #cohort_person cp1
INNER JOIN drug_era de1
	ON cp1.subject_id = de1.person_id
WHERE de1.drug_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND de1.drug_concept_id IN (@included_covariate_concept_ids)}
	AND de1.drug_era_start_date <= cp1.cohort_start_date
	AND de1.drug_era_end_date >= dateadd(dd, - 365, cp1.cohort_start_date);



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Drug era record observed during 365d on or prior to cohort index:  ' + CAST((p1.covariate_id-501)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	501 AS analysis_id,
	(p1.covariate_id-501)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_dera_365d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-501)/1000 = c1.concept_id
;


}


{@use_covariate_drug_era_30d} ? {

--drug exist:  episode in last 30d prior

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(de1.drug_concept_id AS BIGINT) * 1000 + 502 AS covariate_id,
	1 AS covariate_value
INTO #cov_dera_30d
FROM #cohort_person cp1
INNER JOIN drug_era de1
	ON cp1.subject_id = de1.person_id
WHERE de1.drug_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND de1.drug_concept_id IN (@included_covariate_concept_ids)}
	AND de1.drug_era_start_date <= cp1.cohort_start_date
	AND de1.drug_era_end_date >= dateadd(dd, - 30, cp1.cohort_start_date);


INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
  concept_id
	)
SELECT p1.covariate_id,
	'Drug era record observed during 30d on or prior to cohort index:  ' + CAST((p1.covariate_id-502)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	502 AS analysis_id,
	(p1.covariate_id-502)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_dera_30d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-502)/1000 = c1.concept_id
;

}


{@use_covariate_drug_era_overlap} ? {

--concurrent on index date (era overlapping)

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(de1.drug_concept_id AS BIGINT) * 1000 + 503 AS covariate_id,
	1 AS covariate_value
  INTO #cov_dera_overlap
FROM #cohort_person cp1
INNER JOIN drug_era de1
	ON cp1.subject_id = de1.person_id
WHERE de1.drug_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND de1.drug_concept_id IN (@included_covariate_concept_ids)}
	AND de1.drug_era_start_date <= cp1.cohort_start_date
	AND de1.drug_era_end_date >= cp1.cohort_start_date;


INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
  concept_id
  )
SELECT p1.covariate_id,
	'Drug era record observed concurrent (overlapping) with cohort index:  ' + CAST((p1.covariate_id-503)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	503 AS analysis_id,
	(p1.covariate_id-503)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_dera_overlap) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-503)/1000 = c1.concept_id
;

}


{@use_covariate_drug_era_ever} ? {

--drug exist:  episode in all time prior

SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(de1.drug_concept_id AS BIGINT) * 1000 + 504 AS covariate_id,
	1 AS covariate_value
  INTO #cov_dera_ever
FROM #cohort_person cp1
INNER JOIN drug_era de1
	ON cp1.subject_id = de1.person_id
WHERE de1.drug_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND de1.drug_concept_id IN (@included_covariate_concept_ids)}
	AND de1.drug_era_start_date <= cp1.cohort_start_date;



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
  concept_id
  )
SELECT p1.covariate_id,
  'Drug era record observed during anytime on or prior to cohort index:  ' + CAST((p1.covariate_id-504)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	504 AS analysis_id,
	(p1.covariate_id-504)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_dera_ever) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-504)/1000 = c1.concept_id
;

} }



/**************************
***************************
DRUG GROUP
***************************
**************************/
	{@use_covariate_drug_group} ? {


IF OBJECT_ID('tempdb..#drug_group', 'U') IS NOT NULL
	DROP TABLE #drug_group;

--ATC
SELECT DISTINCT ca1.descendant_concept_id,
	ca1.ancestor_concept_id
  INTO #drug_group
FROM (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 400
		AND analysis_id < 600
	) ccr1
INNER JOIN concept_ancestor ca1
	ON ccr1.concept_id = ca1.descendant_concept_id
INNER JOIN concept c1
	ON ca1.ancestor_concept_id = c1.concept_id
WHERE c1.vocabulary_id = 21
	AND len(c1.concept_code) IN (1, 3, 5)
	AND c1.concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND c1.concept_id IN (@included_covariate_concept_ids)}
;


INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT DISTINCT CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 50 + ccr1.analysis_id AS covariate_id,
	CASE
		WHEN analysis_id = 501
			THEN 'Drug era record observed during 365d on or prior to cohort index within drug group:  '
		WHEN analysis_id = 502
			THEN 'Drug era record observed during 30d on or prior to cohort index within drug group:  '
		WHEN analysis_id = 503
			THEN 'Drug era record observed concurrent (overlapping) with cohort index within drug group:  '
    WHEN analysis_id = 504
  		THEN 'Drug era record observed during anytime on or prior to cohort index within drug group:  '
  ELSE 'Other drug group analysis'
		END + CAST(cg1.ancestor_concept_id AS VARCHAR) + '-' + c1.concept_name AS covariate_name,
	ccr1.analysis_id,
	cg1.ancestor_concept_id AS concept_id
FROM (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 500
		AND analysis_id < 600
	) ccr1
INNER JOIN #drug_group cg1
	ON ccr1.concept_id = cg1.descendant_concept_id
INNER JOIN concept c1
	ON cg1.ancestor_concept_id = c1.concept_id;


SELECT DISTINCT cc1.cohort_start_date,
	cc1.cohort_definition_id,
	cc1.person_id,
	CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 50 + ccr1.analysis_id AS covariate_id,
	1 AS covariate_value
  INTO #cov_dg
FROM (

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_exposure

{@use_covariate_drug_exposure} ? {

{@use_covariate_drug_exposure_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_de_365d

}

{@use_covariate_drug_exposure_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_de_30d

}


}


{@use_covariate_drug_era} ? {

{@use_covariate_drug_era_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dera_365d

}

{@use_covariate_drug_era_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dera_30d

}

{@use_covariate_drug_era_ever} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dera_ever

}

{@use_covariate_drug_era_overlap} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dera_overlap

}


}

) cc1
INNER JOIN (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 500
		AND analysis_id < 600
	) ccr1
	ON cc1.covariate_id = ccr1.covariate_id
INNER JOIN #drug_group cg1
	ON ccr1.concept_id = cg1.descendant_concept_id;






{@use_covariate_drug_era_ever} ? {

--number of drugs within each ATC3 groupings all time prior
INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT DISTINCT CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 601 AS covariate_id,
	'Number of ingredients within the drug group observed all time on or prior to cohort index: ' + CAST(cg1.ancestor_concept_id AS VARCHAR) + '-' + c1.concept_name AS covariate_name,
	601 AS analysis_id,
	cg1.ancestor_concept_id AS concept_id
FROM (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id = 504
	) ccr1
INNER JOIN #drug_group cg1
	ON ccr1.concept_id = cg1.descendant_concept_id
INNER JOIN concept c1
	ON cg1.ancestor_concept_id = c1.concept_id
WHERE len(c1.concept_code) = 3;


SELECT cc1.cohort_start_date,
	cc1.cohort_definition_id,
	cc1.person_id,
	CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 601 AS covariate_id,
	COUNT(DISTINCT ccr1.concept_id) AS covariate_value
    INTO #cov_dg_count
FROM #cov_dera_ever cc1
INNER JOIN (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id = 504
	) ccr1
	ON cc1.covariate_id = ccr1.covariate_id
INNER JOIN #drug_group cg1
	ON ccr1.concept_id = cg1.descendant_concept_id
INNER JOIN concept c1
	ON cg1.ancestor_concept_id = c1.concept_id
WHERE len(c1.concept_code) = 3
GROUP BY cc1.cohort_start_date,
	cc1.cohort_definition_id,
	cc1.person_id,
	CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 601;


}


TRUNCATE TABLE #drug_group;

DROP TABLE #drug_group;

}
/**************************
***************************
PROCEDURE OCCURRENCE
***************************
**************************/
	{@use_covariate_procedure_occurrence} ? { {@use_covariate_procedure_occurrence_365d} ? {

--procedures exist:  episode in last 365d prior
SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(po1.procedure_concept_id AS BIGINT) * 1000 + 701 AS covariate_id,
	1 AS covariate_value
  INTO #cov_po_365d
FROM #cohort_person cp1
INNER JOIN procedure_occurrence po1
	ON cp1.subject_id = po1.person_id
WHERE po1.procedure_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND po1.procedure_concept_id IN (@included_covariate_concept_ids)}
	AND po1.procedure_date <= cp1.cohort_start_date
	AND po1.procedure_date >= dateadd(dd, - 365, cp1.cohort_start_date);




INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Procedure occurrence record observed during 365d on or prior to cohort index:  ' + CAST((p1.covariate_id-701)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	701 AS analysis_id,
	(p1.covariate_id-701)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_po_365d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-701)/1000 = c1.concept_id
;

}


{@use_covariate_procedure_occurrence_30d} ? {

--procedures exist:  episode in last 30d prior


SELECT DISTINCT cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(po1.procedure_concept_id AS BIGINT) * 1000 + 702 AS covariate_id,
	1 AS covariate_value
  INTO #cov_po_30d
FROM #cohort_person cp1
INNER JOIN procedure_occurrence po1
	ON cp1.subject_id = po1.person_id
WHERE po1.procedure_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND po1.procedure_concept_id IN (@included_covariate_concept_ids)}
	AND po1.procedure_date <= cp1.cohort_start_date
	AND po1.procedure_date >= dateadd(dd, - 30, cp1.cohort_start_date);



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
  analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Procedure occurrence record observed during 30d on or prior to cohort index:  ' + CAST((p1.covariate_id-702)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	702 AS analysis_id,
	(p1.covariate_id-702)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_po_30d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-702)/1000 = c1.concept_id
;

}

}


/**************************
***************************
PROCEDURE GROUP
***************************
**************************/
	{@use_covariate_procedure_group} ? {


IF OBJECT_ID('tempdb..#procedure_group', 'U') IS NOT NULL
  DROP TABLE #procedure_group;

--SNOMED
SELECT DISTINCT ca1.descendant_concept_id,
	ca1.ancestor_concept_id
  INTO #procedure_group
FROM (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 700
		AND analysis_id < 800
	) ccr1
INNER JOIN concept_ancestor ca1
	ON ccr1.concept_id = ca1.descendant_concept_id
INNER JOIN concept c1
	ON ca1.ancestor_concept_id = c1.concept_id
WHERE c1.vocabulary_id = 1
	AND ca1.min_levels_of_separation <= 2
	AND c1.concept_id NOT IN (0,
	76094,67368, 46042, 40949, 31332, 28263, 24955, 18791, 13449, 12571, 10678, 10592, 9878, 9727, 9652, 9451, 9192, 8975, 8930, 8786, 8370, 8161, 7763, 7059, 6923, 6752, 6690, 6611, 6336, 6264, 6204, 6003, 5783
	{@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND c1.concept_id IN (@included_covariate_concept_ids)}
;


INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT DISTINCT CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 50 + ccr1.analysis_id AS covariate_id,
	CASE
		WHEN analysis_id = 701
			THEN 'Procedure occurrence record observed during 365d on or prior to cohort index within procedure group:  '
		WHEN analysis_id = 702
			THEN 'Procedure occurrence record observed during 30d on or prior to cohort index within procedure group:  '
  ELSE 'Other procedure group analysis'
		END + CAST(cg1.ancestor_concept_id AS VARCHAR) + '-' + c1.concept_name AS covariate_name,
	ccr1.analysis_id,
	cg1.ancestor_concept_id AS concept_id
FROM (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 700
		AND analysis_id < 800
	) ccr1
INNER JOIN #procedure_group cg1
	ON ccr1.concept_id = cg1.descendant_concept_id
INNER JOIN concept c1
	ON cg1.ancestor_concept_id = c1.concept_id;


SELECT DISTINCT cc1.cohort_start_date,
	cc1.cohort_definition_id,
	cc1.person_id,
	CAST(cg1.ancestor_concept_id AS BIGINT) * 1000 + 50 + ccr1.analysis_id AS covariate_id,
	1 AS covariate_value
  INTO #cov_pg
FROM (

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_exposure

{@use_covariate_procedure_occurrence} ? {

{@use_covariate_procedure_occurrence_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_po_365d

}

{@use_covariate_procedure_occurrence_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_po_30d

}


}


) cc1
INNER JOIN (
	SELECT covariate_id,
		covariate_name,
		analysis_id,
		concept_id
	FROM #cov_ref
	WHERE analysis_id > 700
		AND analysis_id < 800
	) ccr1
	ON cc1.covariate_id = ccr1.covariate_id
INNER JOIN #procedure_group cg1
	ON ccr1.concept_id = cg1.descendant_concept_id
;


TRUNCATE TABLE #procedure_group;

DROP TABLE #procedure_group;

}


/**************************
***************************
OBSERVATION
***************************
**************************/
	{@use_covariate_observation} ? {

{@use_covariate_observation_365d} ? {

--observations exist:  episode in last 365d prior
SELECT DISTINCT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id as person_id,
	CAST(o1.observation_concept_id AS BIGINT) * 1000 + 901 AS covariate_id,
	1 AS covariate_value
  INTO #cov_o_365d
FROM #cohort_person cp1
INNER JOIN observation o1
	ON cp1.subject_id = o1.person_id
WHERE o1.observation_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND o1.observation_concept_id IN (@included_covariate_concept_ids)}
	AND o1.observation_date <= cp1.cohort_start_date
	AND o1.observation_date >= dateadd(dd, - 365, cp1.cohort_start_date);




INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Observation record observed during 365d on or prior to cohort index:  ' + CAST((p1.covariate_id-901)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	901 AS analysis_id,
	(p1.covariate_id-901)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_o_365d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-901)/1000 = c1.concept_id
;



}

{@use_covariate_observation_30d} ? {

--observation exist:  episode in last 30d prior
SELECT DISTINCT cp1.cohort_start_date,
  cp1.cohort_definition_id,
  cp1.subject_id as person_id,
	CAST(o1.observation_concept_id AS BIGINT) * 1000 + 902 AS covariate_id,
	1 AS covariate_value
  INTO #cov_o_30d
FROM #cohort_person cp1
INNER JOIN observation o1
	ON cp1.subject_id = o1.person_id
WHERE o1.observation_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND o1.observation_concept_id IN (@included_covariate_concept_ids)}
	AND o1.observation_date <= cp1.cohort_start_date
	AND o1.observation_date >= dateadd(dd, - 30, cp1.cohort_start_date);




INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Observation record observed during 30d on or prior to cohort index:  ' + CAST((p1.covariate_id-902)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	902 AS analysis_id,
	(p1.covariate_id-902)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_o_30d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-902)/1000 = c1.concept_id
;




}

{@use_covariate_observation_below} ? {

--for numeric values with valid range, latest value within 180 below low
SELECT DISTINCT cohort_start_date,
  cohort_definition_id,
	subject_id AS person_id,
	CAST(observation_concept_id AS BIGINT) * 1000 + 903 AS covariate_id,
	1 AS covariate_value
  INTO #cov_o_below
FROM (
	SELECT cp1.cohort_start_date,
		cp1.cohort_definition_id,
		cp1.subject_id,
		o1.observation_concept_id,
		o1.value_as_number,
		o1.range_low,
		o1.range_high,
		ROW_NUMBER() OVER (
			PARTITION BY cp1.cohort_definition_id,
			cp1.subject_id,
			o1.observation_concept_id ORDER BY o1.observation_date DESC
			) AS rn1
	FROM #cohort_person cp1
	INNER JOIN observation o1
		ON cp1.subject_id = o1.person_id
	WHERE o1.observation_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND o1.observation_concept_id IN (@included_covariate_concept_ids)}
		AND o1.observation_date <= cp1.cohort_start_date
		AND o1.observation_date >= dateadd(dd, - 180, cp1.cohort_start_date)
		AND o1.value_as_number >= 0
		AND o1.range_low >= 0
		AND o1.range_high >= 0
	) t1
WHERE RN1 = 1
	AND VALUE_AS_NUMBER < RANGE_LOW;



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Observation numeric value below normal range for latest value within 180d of cohort index:  ' + CAST((p1.covariate_id-903)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	903 AS analysis_id,
	(p1.covariate_id-903)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_o_below) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-903)/1000 = c1.concept_id
;





}



{@use_covariate_observation_above} ? {

--for numeric values with valid range, latest value above high
SELECT DISTINCT cohort_start_date,
  cohort_definition_id,
  subject_id AS person_id,
	CAST(observation_concept_id AS BIGINT) * 1000 + 904 AS covariate_id,
	1 AS covariate_value
  INTO #cov_o_above
FROM (
	SELECT cp1.cohort_start_date,
		cp1.cohort_definition_id,
		cp1.subject_id,
		o1.observation_concept_id,
		o1.value_as_number,
		o1.range_low,
		o1.range_high,
		ROW_NUMBER() OVER (
			PARTITION BY cp1.cohort_definition_id,
			cp1.subject_id,
			o1.observation_concept_id ORDER BY o1.observation_date DESC
			) AS rn1
	FROM #cohort_person cp1
	INNER JOIN observation o1
		ON cp1.subject_id = o1.person_id
	WHERE o1.observation_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
{@included_covariate_concept_ids != '' } ? {AND o1.observation_concept_id IN (@included_covariate_concept_ids)}
		AND o1.observation_date <= cp1.cohort_start_date
		AND o1.observation_date >= dateadd(dd, - 180, cp1.cohort_start_date)
		AND o1.value_as_number >= 0
		AND o1.range_low >= 0
		AND o1.range_high >= 0
	) t1
WHERE RN1 = 1
	AND VALUE_AS_NUMBER > RANGE_HIGH;



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Observation numeric value above normal range for latest value within 180d of cohort index:  ' + CAST((p1.covariate_id-904)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	903 AS analysis_id,
	(p1.covariate_id-904)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_o_above) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-904)/1000 = c1.concept_id
;



}


{@use_covariate_observation_count365d} ? {

--number of observations:  episode in last 365d prior
SELECT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	CAST(o1.observation_concept_id AS BIGINT) * 1000 + 905 AS covariate_id,
	COUNT(observation_id) AS covariate_value
    INTO #cov_o_count365d
FROM #cohort_person cp1
INNER JOIN observation o1
	ON cp1.subject_id = o1.person_id
WHERE o1.observation_concept_id NOT IN (0 {@excluded_covariate_concept_ids != '' } ? {, @excluded_covariate_concept_ids })
  {@included_covariate_concept_ids != '' } ? {AND o1.observation_concept_id IN (@included_covariate_concept_ids)}
	AND o1.observation_date <= cp1.cohort_start_date
	AND o1.observation_date >= dateadd(dd, - 365, cp1.cohort_start_date)
GROUP BY cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id,
	CAST(o1.observation_concept_id AS BIGINT) * 1000 + 905;



INSERT INTO #cov_ref (
  covariate_id,
  covariate_name,
	analysis_id,
	concept_id
	)
SELECT p1.covariate_id,
	'Number of observations during 365d on or prior to cohort index:  ' + CAST((p1.covariate_id-905)/1000 AS VARCHAR) + '-' + CASE
		WHEN c1.concept_name IS NOT NULL
			THEN c1.concept_name
		ELSE 'Unknown invalid concept'
		END AS covariate_name,
	905 AS analysis_id,
	(p1.covariate_id-905)/1000 AS concept_id
FROM (SELECT DISTINCT covariate_id FROM #cov_o_count365d) p1
LEFT JOIN concept c1
	ON (p1.covariate_id-905)/1000 = c1.concept_id
;


}

}



/**************************
***************************
DATA DENSITY CONCEPT COUNTS
***************************
**************************/
	{@use_covariate_concept_counts} ? {

--Number of distinct conditions observed in 365d on or prior to cohort index
SELECT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	1000 AS covariate_id,
	COUNT(DISTINCT ce1.condition_concept_id) AS covariate_value
    INTO #cov_dd_cond
FROM #cohort_person cp1
INNER JOIN condition_era ce1
	ON cp1.subject_id = ce1.person_id
WHERE ce1.condition_era_start_date <= cp1.cohort_start_date
	AND ce1.condition_era_end_date >= dateadd(dd, - 365, cp1.cohort_start_date)
GROUP BY cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id;



INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1000,
	'Number of distinct conditions observed in 365d on or prior to cohort index',
	1000,
	0
	);




--Number of distinct drug ingredients observed in 365d on or prior to cohort index
SELECT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	1001 AS covariate_id,
	COUNT(DISTINCT de1.drug_concept_id) AS covariate_value
  INTO #cov_dd_drug
FROM #cohort_person cp1
INNER JOIN drug_era de1
	ON cp1.subject_id = de1.person_id
WHERE de1.drug_era_start_date <= cp1.cohort_start_date
	AND de1.drug_era_start_date >= dateadd(dd, - 365, cp1.cohort_start_date)
GROUP BY cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id;

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1001,
	'Number of distinct drug ingredients observed in 365d on or prior to cohort index',
	1001,
	0
	);



--Number of distinct procedures observed in 365d on or prior to cohort index
SELECT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	1002 AS covariate_id,
	COUNT(DISTINCT po1.procedure_concept_id) AS covariate_value
  INTO #cov_dd_proc
FROM #cohort_person cp1
INNER JOIN procedure_occurrence po1
	ON cp1.subject_id = po1.person_id
WHERE po1.procedure_date <= cp1.cohort_start_date
	AND po1.procedure_date >= dateadd(dd, - 365, cp1.cohort_start_date)
GROUP BY cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id;

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1002,
	'Number of distinct procedures observed in 365d on or prior to cohort index',
	1002,
	0
	);



--Number of distinct observations observed in 365d on or prior to cohort index
SELECT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	1003 AS covariate_id,
	COUNT(DISTINCT o1.observation_concept_id) AS covariate_value
  INTO #cov_dd_obs
FROM #cohort_person cp1
INNER JOIN observation o1
	ON cp1.subject_id = o1.person_id
WHERE o1.observation_date <= cp1.cohort_start_date
	AND o1.observation_date >= dateadd(dd, - 365, cp1.cohort_start_date)
GROUP BY cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id;

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1003,
	'Number of distinct observations observed in 365d on or prior to cohort index',
	1003,
	0
	);


--Number of visits observed in 365d on or prior to cohort index
SELECT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	1004 AS covariate_id,
	COUNT(vo1.visit_occurrence_id) AS covariate_value
  INTO #cov_dd_visit_all
FROM #cohort_person cp1
INNER JOIN visit_occurrence vo1
	ON cp1.subject_id = vo1.person_id
WHERE vo1.visit_start_date <= cp1.cohort_start_date
	AND vo1.visit_start_date >= dateadd(dd, - 365, cp1.cohort_start_date)
GROUP BY cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id;

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1004,
	'Number of visits observed in 365d on or prior to cohort index',
	1004,
	0
	);



--Number of inpatient visits observed in 365d on or prior to cohort index
SELECT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	1005 AS covariate_id,
	COUNT(vo1.visit_occurrence_id) AS covariate_value
  INTO #cov_dd_visit_inpt
FROM #cohort_person cp1
INNER JOIN visit_occurrence vo1
	ON cp1.subject_id = vo1.person_id
WHERE vo1.visit_start_date <= cp1.cohort_start_date
	AND vo1.visit_start_date >= dateadd(dd, - 365, cp1.cohort_start_date)
	AND vo1.place_of_service_concept_id = 9201
GROUP BY cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id;

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1005,
	'Number of inpatient visits observed in 365d on or prior to cohort index',
	1005,
	0
	);




--Number of ER visits observed in 365d on or prior to cohort index
SELECT cp1.cohort_start_date,
  cp1.cohort_definition_id,
	cp1.subject_id AS person_id,
	1006 AS covariate_id,
	COUNT(vo1.visit_occurrence_id) AS covariate_value
INTO #cov_dd_visit_er
FROM #cohort_person cp1
INNER JOIN visit_occurrence vo1
	ON cp1.subject_id = vo1.person_id
WHERE vo1.visit_start_date <= cp1.cohort_start_date
	AND vo1.visit_start_date >= dateadd(dd, - 365, cp1.cohort_start_date)
	AND vo1.place_of_service_concept_id = 9203
GROUP BY cp1.cohort_start_date,
	cp1.cohort_definition_id,
	cp1.subject_id;


INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1006,
	'Number of ER visits observed in 365d on or prior to cohort index',
	1006,
	0
	);



}




/**************************
***************************
RISK SCORES
***************************
**************************/
	{@use_covariate_risk_scores} ? {



{@use_covariate_risk_scores_Charlson} ? {
--CHARLSON


IF OBJECT_ID('tempdb..#Charlson_concepts', 'U') IS NOT NULL
  DROP TABLE #Charlson_concepts;

CREATE TABLE #Charlson_concepts (
	diag_category_id INT,
	concept_id INT
	);


IF OBJECT_ID('tempdb..#Charlson_scoring', 'U') IS NOT NULL
	DROP TABLE #Charlson_scoring;

CREATE TABLE #Charlson_scoring (
	diag_category_id INT,
	diag_category_name VARCHAR(255),
	weight INT
	);


--acute myocardial infarction
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (1,'Myocardial infarction',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 1, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id IN (329847)
;

--Congestive heart failure
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (2,'Congestive heart failure',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 2, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (316139)
;


--Peripheral vascular disease
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (3,'Peripheral vascular disease',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 3, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (321052)
;


--Cerebrovascular disease
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (4,'Cerebrovascular disease',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 4, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (381591, 434056)
;



--Dementia
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (5,'Dementia',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 5, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (4182210)
;

--Chronic pulmonary disease
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (6,'Chronic pulmonary disease',1);


INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 6, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (4063381)
;


--Rheumatologic disease
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (7,'Rheumatologic disease',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 7, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (257628, 134442, 80800, 80809, 256197, 255348)
;

--Peptic ulcer disease
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (8,'Peptic ulcer disease',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 8, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (4247120)
;



--Mild liver disease
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (9,'Mild liver disease',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 9, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (4064161, 4212540)
;


--Diabetes (mild to moderate)
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (10,'Diabetes (mild to moderate)',1);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 10, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (201820)
;


--Diabetes with chronic complications
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (11,'Diabetes with chronic complications',2);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 11, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (4192279, 443767, 442793)
;

--Hemoplegia or paralegia
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (12,'Hemoplegia or paralegia',2);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 12, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (192606, 374022)
;


--Renal disease
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (13,'Renal disease',2);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 13, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (4030518)
;


--Any malignancy
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (14,'Any malignancy',2);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 14, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (443392)
;


--Moderate to severe liver disease
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (15,'Moderate to severe liver disease',3);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 15, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (4245975, 4029488, 192680, 24966)
;


--Metastatic solid tumor
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (16,'Metastatic solid tumor',6);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 16, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (432851)
;


--AIDS
INSERT INTO #Charlson_scoring (diag_category_id,diag_category_name,weight)
VALUES (17,'AIDS',6);

INSERT INTO #Charlson_concepts (diag_category_id,concept_id)
SELECT 17, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (439727)
;


INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1100,
	'Charlson Index - Romano adaptation, using conditions all time on or prior to cohort index',
	1100,
	0
	);


SELECT cohort_start_date,
	cohort_definition_id,
	subject_id AS person_id,
	1100 AS covariate_id,
	SUM(weight) AS covariate_value
  INTO #cov_charlson
FROM (
	SELECT DISTINCT cp1.cohort_start_date,
		cp1.cohort_definition_id,
		cp1.subject_id,
		cs1.diag_category_id,
		cs1.weight
	FROM #cohort_person cp1
	INNER JOIN condition_era ce1
		ON cp1.subject_id = ce1.person_id
	INNER JOIN #Charlson_concepts c1
		ON ce1.condition_concept_id = c1.concept_id
	INNER JOIN #Charlson_scoring cs1
		ON c1.diag_category_id = cs1.diag_category_id
	WHERE ce1.condition_era_start_date <= cp1.cohort_start_date
	) t1
GROUP BY cohort_start_date,
	cohort_definition_id,
	subject_id;

TRUNCATE TABLE #Charlson_concepts;

DROP TABLE #Charlson_concepts;

TRUNCATE TABLE #Charlson_scoring;

DROP TABLE #Charlson_scoring;

}


{@use_covariate_risk_scores_DCSI} ? {

--DCSI

IF OBJECT_ID('tempdb..#DCSI_scoring', 'U') IS NOT NULL
	DROP TABLE #DCSI_scoring;

CREATE TABLE #DCSI_scoring (
	DCSI_category VARCHAR(255),
	DCSI_ICD9_code VARCHAR(255),
	DCSI_concept_id INT,
	DCSI_score INT
	);

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Retinopathy' AS DCSI_category,
	source_code,
	target_concept_id,
	1 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code LIKE '250.5%'
		OR source_code IN ('362.01', '362.1', '362.83', '362.53', '362.81', '362.82')
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Retinopathy' AS DCSI_category,
	source_code,
	target_concept_id,
	2 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code LIKE '361%'
		OR source_code LIKE '369%'
		OR source_code IN ('362.02', '379.23')
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Nephropathy' AS DCSI_category,
	source_code,
	target_concept_id,
	1 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code IN ('250.4', '580', '581', '581.81', '582', '583')
		OR source_code LIKE '580%'
		OR source_code LIKE '581%'
		OR source_code LIKE '582%'
		OR source_code LIKE '583%'
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Nephropathy' AS DCSI_category,
	source_code,
	target_concept_id,
	2 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code IN ('585', '586', '593.9')
		OR source_code LIKE '585%'
		OR source_code LIKE '586%'
		OR source_code LIKE '593.9%'
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Neuropathy' AS DCSI_category,
	source_code,
	target_concept_id,
	1 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code IN ('356.9', '250.6', '358.1', '951.0', '951.1', '951.3', '713.5', '357.2', '596.54', '337.0', '337.1', '564.5', '536.3', '458.0')
		OR (
			source_code >= '354.0'
			AND source_code <= '355.99'
			)
		OR source_code LIKE '356.9%'
		OR source_code LIKE '250.6%'
		OR source_code LIKE '358.1%'
		OR source_code LIKE '951.0%'
		OR source_code LIKE '951.1%'
		OR source_code LIKE '951.3%'
		OR source_code LIKE '713.5%'
		OR source_code LIKE '357.2%'
		OR source_code LIKE '337.0%'
		OR source_code LIKE '337.1%'
		OR source_code LIKE '564.5%'
		OR source_code LIKE '536.3%'
		OR source_code LIKE '458.0%'
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Cerebrovascular' AS DCSI_category,
	source_code,
	target_concept_id,
	1 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (source_code LIKE '435%')
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Cerebrovascular' AS DCSI_category,
	source_code,
	target_concept_id,
	2 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code IN ('431', '433', '434', '436')
		OR source_code LIKE '431%'
		OR source_code LIKE '433%'
		OR source_code LIKE '434%'
		OR source_code LIKE '436%'
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Cardiovascular' AS DCSI_category,
	source_code,
	target_concept_id,
	1 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code LIKE '440%'
		OR source_code LIKE '411%'
		OR source_code LIKE '413%'
		OR source_code LIKE '414%'
		OR source_code LIKE '429.2%'
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Cardiovascular' AS DCSI_category,
	source_code,
	target_concept_id,
	2 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code LIKE '410%'
		OR source_code LIKE '427.1%'
		OR source_code LIKE '427.3%'
		OR source_code LIKE '427.4%'
		OR source_code LIKE '427.5%'
		OR source_code LIKE '412%'
		OR source_code LIKE '428%'
		OR source_code LIKE '441%'
		OR source_code IN ('440.23', '440.24')
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Peripheral vascular disease' AS DCSI_category,
	source_code,
	target_concept_id,
	1 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code LIKE '250.7%'
		OR source_code LIKE '442.3%'
		OR source_code LIKE '892.1%'
		OR source_code LIKE '443.9%'
		OR source_code IN ('443.81')
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Peripheral vascular disease' AS DCSI_category,
	source_code,
	target_concept_id,
	2 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code LIKE '785.4%'
		OR source_code LIKE '707.1%'
		OR source_code LIKE '040.0%'
		OR source_code IN ('444.22')
		)
ORDER BY source_code;

INSERT INTO #DCSI_scoring (
	DCSI_category,
	DCSI_ICD9_code,
	DCSI_concept_id,
	DCSI_score
	)
SELECT 'Metabolic' AS DCSI_category,
	source_code,
	target_concept_id,
	2 AS DCSI_score
FROM SOURCE_TO_CONCEPT_MAP
WHERE SOURCE_VOCABULARY_ID = 2
	AND target_vocabulary_id = 1
	AND (
		source_code LIKE '250.1%'
		OR source_code LIKE '250.2%'
		OR source_code LIKE '250.3%'
		)
ORDER BY source_code;

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1101,
	'Diabetes Comorbidity Severity Index (DCSI), using conditions all time on or prior to cohort index',
	1101,
	0
	);


SELECT cohort_start_date,
	cohort_definition_id,
	subject_id AS person_id,
	1101 AS covariate_id,
	SUM(max_score) AS covariate_value
  INTO #cov_DCSI
FROM (
	SELECT cp1.cohort_start_date,
		cp1.cohort_definition_id,
		cp1.subject_id,
		ds1.dcsi_category,
		max(ds1.DCSI_score) AS max_score
	FROM #cohort_person cp1
	INNER JOIN condition_era ce1
		ON cp1.subject_id = ce1.person_id
	INNER JOIN #DCSI_scoring ds1
		ON ce1.condition_concept_id = ds1.DCSI_concept_id
	WHERE ce1.condition_era_start_date <= cp1.cohort_start_date
	GROUP BY cp1.cohort_start_date,
		cp1.cohort_definition_id,
		cp1.subject_id,
		ds1.dcsi_category
	) t1
GROUP BY cohort_start_date,
	cohort_definition_id,
	subject_id;

TRUNCATE TABLE #DCSI_scoring;

DROP TABLE #DCSI_scoring;

}


{@use_covariate_risk_scores_CHADS2} ? {


IF OBJECT_ID('tempdb..#CHADS2_concepts', 'U') IS NOT NULL
  DROP TABLE #CHADS2_concepts;

CREATE TABLE #CHADS2_concepts (
	diag_category_id INT,
	concept_id INT
	);


IF OBJECT_ID('tempdb..#CHADS2_scoring', 'U') IS NOT NULL
	DROP TABLE #CHADS2_scoring;

CREATE TABLE #CHADS2_scoring (
	diag_category_id INT,
	diag_category_name VARCHAR(255),
	weight INT
	);

--Congestive heart failure
INSERT INTO #CHADS2_scoring (diag_category_id,diag_category_name,weight)
VALUES (1,'Congestive heart failure',1);

INSERT INTO #CHADS2_concepts (diag_category_id,concept_id)
SELECT 1, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (316139)
;

--Hypertension
INSERT INTO #CHADS2_scoring (diag_category_id,diag_category_name,weight)
VALUES (2,'Hypertension',1);

INSERT INTO #CHADS2_concepts (diag_category_id,concept_id)
SELECT 2, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (316866)
;

--Age > 75
INSERT INTO #CHADS2_scoring (diag_category_id,diag_category_name,weight)
VALUES (3,'Age>75',1);

--no codes

--Diabetes
INSERT INTO #CHADS2_scoring (diag_category_id,diag_category_name,weight)
VALUES (4,'Diabetes',1);

INSERT INTO #CHADS2_concepts (diag_category_id,concept_id)
SELECT 4, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (201820)
;

--Stroke
INSERT INTO #CHADS2_scoring (diag_category_id,diag_category_name,weight)
VALUES (5,'Stroke',2);

INSERT INTO #CHADS2_concepts (diag_category_id,concept_id)
SELECT 5, descendant_concept_id
FROM concept_ancestor
WHERE ancestor_concept_id in (381591, 434056)
;



INSERT INTO #cov_ref (
  covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
VALUES (
	1102,
	'CHADS2, using conditions all time on or prior to cohort index',
	1102,
	0
	);


SELECT cohort_start_date,
	cohort_definition_id,
	subject_id AS person_id,
	1102 AS covariate_id,
	SUM(weight) AS covariate_value
  INTO #cov_CHADS2
FROM (
	SELECT DISTINCT cp1.cohort_start_date,
		cp1.cohort_definition_id,
		cp1.subject_id,
		cs1.diag_category_id,
		cs1.weight
	FROM #cohort_person cp1
	INNER JOIN condition_era ce1
		ON cp1.subject_id = ce1.person_id
	INNER JOIN #CHADS2_concepts c1
		ON ce1.condition_concept_id = c1.concept_id
	INNER JOIN #CHADS2_scoring cs1
		ON c1.diag_category_id = cs1.diag_category_id
	WHERE ce1.condition_era_start_date <= cp1.cohort_start_date

  UNION

  SELECT DISTINCT cp1.cohort_start_date,
  	cp1.cohort_definition_id,
		cp1.subject_id,
		3 as diag_category_id,
		1 as weight
	FROM #cohort_person cp1
  INNER JOIN person p1
  ON cp1.subject_id = p1.person_id
  WHERE year(cp1.cohort_start_date) - p1.year_of_birth >= 75

	) t1
GROUP BY cohort_start_date,
	cohort_definition_id,
	subject_id;

TRUNCATE TABLE #CHADS2_concepts;

DROP TABLE #CHADS2_concepts;

TRUNCATE TABLE #CHADS2_scoring;

DROP TABLE #CHADS2_scoring;


}


/*************

other risk scores to consider adding:

CHADS2VASC
HAS_BLED


**************/
}









/***********************************

put all temp tables together into one cov table

***********************************/


SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
INTO #cov_all
FROM
(

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_exposure


{@use_covariate_demographics} ? {

{@use_covariate_demographics_gender} ? {
UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_gender

}

{@use_covariate_demographics_race} ? {
UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_race

}

{@use_covariate_demographics_ethnicity} ? {
UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_ethnicity

}


{@use_covariate_demographics_age} ? {
UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_age

}

{@use_covariate_demographics_year} ? {
UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_year

}

{@use_covariate_demographics_month} ? {
UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_month

}

}

{@use_covariate_condition_occurrence} ? {

{@use_covariate_condition_occurrence_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_co_365d

}

{@use_covariate_condition_occurrence_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_co_30d

}

{@use_covariate_condition_occurrence_inpt180d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_co_inpt180d

}

}



{@use_covariate_condition_era} ? {

{@use_covariate_condition_era_ever} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_ce_ever

}

{@use_covariate_condition_era_overlap} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_ce_overlap

}


}

{@use_covariate_condition_group} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_cg

}


{@use_covariate_drug_exposure} ? {

{@use_covariate_drug_exposure_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_de_365d

}

{@use_covariate_drug_exposure_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_de_30d

}


}


{@use_covariate_drug_era} ? {

{@use_covariate_drug_era_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dera_365d

}

{@use_covariate_drug_era_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dera_30d

}

{@use_covariate_drug_era_ever} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dera_ever

}

{@use_covariate_drug_era_overlap} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dera_overlap

}


}


{@use_covariate_drug_group} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dg


{@use_covariate_drug_era_ever} ? {
UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dg_count
}

}



{@use_covariate_procedure_occurrence} ? {

{@use_covariate_procedure_occurrence_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_po_365d

}

{@use_covariate_procedure_occurrence_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_po_30d

}


}


{@use_covariate_procedure_group} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_pg

}


{@use_covariate_observation} ? {

{@use_covariate_observation_365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_o_365d

}

{@use_covariate_observation_30d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_o_30d

}

{@use_covariate_observation_below} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_o_below

}


{@use_covariate_observation_above} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_o_above


}

{@use_covariate_observation_count365d} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_o_count365d

}

}

  {@use_covariate_concept_counts} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dd_cond

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dd_drug

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dd_proc

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dd_obs

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dd_visit_all

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dd_visit_inpt

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_dd_visit_er


}



{@use_covariate_risk_scores} ? {

{@use_covariate_risk_scores_Charlson} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_charlson

}

{@use_covariate_risk_scores_DCSI} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_DCSI

}

{@use_covariate_risk_scores_CHADS2} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_CHADS2

}

}


) all_covariates

;





/**************************
***************************
INTERACTION YEAR
***************************
**************************/
  {@use_covariate_interaction_year} ? {

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT DISTINCT CAST(ccr1.covariate_id AS BIGINT) * 10000 + YEAR(cp1.cohort_start_date) AS covariate_id,
	ccr1.covariate_name + ' * interaction term with index year: ' + CAST(YEAR(cp1.cohort_start_date) AS VARCHAR) AS covariate_name,
	ccr1.analysis_id,
	ccr1.concept_id
FROM #cohort_person cp1
INNER JOIN
  #cov_all  cc1
	ON cp1.subject_id = cc1.person_id
		AND cp1.cohort_definition_id = cc1.cohort_definition_id
INNER JOIN #cov_ref ccr1
	ON cc1.covariate_id = ccr1.covariate_id
WHERE ccr1.analysis_id NOT IN (5)
	AND ccr1.covariate_id > 1;


SELECT DISTINCT cc1.cohort_start_date,
	cc1.cohort_definition_id,
	cc1.person_id,
	CAST(cc1.covariate_id AS BIGINT) * 10000 + CAST(YEAR(cp1.cohort_start_date) AS BIGINT) AS covariate_id,
	cc1.covariate_value AS covariate_value
    INTO #cov_int_year
FROM #cohort_person cp1
INNER JOIN
  #cov_all  cc1
	ON cp1.subject_id = cc1.person_id
		AND cp1.cohort_definition_id = cc1.cohort_definition_id
INNER JOIN #cov_ref ccr1
	ON cc1.covariate_id = ccr1.covariate_id
WHERE ccr1.analysis_id NOT IN (5)
	AND ccr1.covariate_id > 1;

}


/**************************
***************************
INTERACTION MONTH
***************************
**************************/
	{@use_covariate_interaction_month} ? {

INSERT INTO #cov_ref (
	covariate_id,
	covariate_name,
	analysis_id,
	concept_id
	)
SELECT DISTINCT CAST(ccr1.covariate_id AS BIGINT) * 10000 + CAST(MONTH(cp1.cohort_start_date) AS BIGINT) AS covariate_id,
	ccr1.covariate_name + ' * interaction term with index month: ' + CAST(MONTH(cp1.cohort_start_date) AS VARCHAR) AS covariate_name,
	ccr1.analysis_id,
	ccr1.concept_id
FROM #cohort_person cp1
INNER JOIN
  #cov_all  cc1
	ON cp1.subject_id = cc1.person_id
		AND cp1.cohort_definition_id = cc1.cohort_definition_id
INNER JOIN #cov_ref ccr1
	ON cc1.covariate_id = ccr1.covariate_id
WHERE ccr1.analysis_id NOT IN (6)
	AND ccr1.covariate_id > 1;


SELECT DISTINCT cc1.cohort_start_date,
	cc1.cohort_definition_id,
	cc1.person_id,
	CAST(cc1.covariate_id AS BIGINT) * 10000 + CAST(MONTH(cp1.cohort_start_date) AS BIGINT) AS covariate_id,
	cc1.covariate_value AS covariate_value
    INTO #cov_int_month
FROM #cohort_person cp1
INNER JOIN
  #cov_all  cc1
	ON cp1.subject_id = cc1.person_id
		AND cp1.cohort_definition_id = cc1.cohort_definition_id
INNER JOIN #cov_ref ccr1
	ON cc1.covariate_id = ccr1.covariate_id
WHERE ccr1.analysis_id NOT IN (6)
	AND ccr1.covariate_id > 1;

}






{@delete_covariates_small_count != 0 } ? {

DELETE
FROM #cov_ref
WHERE covariate_id IN (
  	SELECT covariate_id
		FROM #cov_all
		GROUP BY covariate_id
		HAVING COUNT(person_id) <= @delete_covariates_small_count

{@use_covariate_interaction_year} ? {

UNION

SELECT covariate_id
    FROM #cov_int_year
		GROUP BY covariate_id
		HAVING COUNT(person_id) <= @delete_covariates_small_count


}

{@use_covariate_interaction_month} ? {

UNION

SELECT covariate_id
  	FROM #cov_int_month
		GROUP BY covariate_id
		HAVING COUNT(person_id) <= @delete_covariates_small_count


}

		);


}


SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
  INTO #cov
FROM
(
SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_all
WHERE covariate_id IN (
  	SELECT covariate_id
		FROM #cov_ref
		)

{@use_covariate_interaction_year} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_int_year
WHERE covariate_id IN (
    SELECT covariate_id
		FROM #cov_ref
		)

}

{@use_covariate_interaction_month} ? {

UNION

SELECT cohort_start_date, cohort_definition_id, person_id, covariate_id, covariate_value
FROM #cov_int_month
WHERE covariate_id IN (
    SELECT covariate_id
  	FROM #cov_ref
		)

}

) t1
;


IF OBJECT_ID('tempdb..#cov_exposure', 'U') IS NOT NULL
  DROP TABLE #cov_exposure;
IF OBJECT_ID('tempdb..#cov_gender', 'U') IS NOT NULL
  DROP TABLE #cov_gender;
IF OBJECT_ID('tempdb..#cov_race', 'U') IS NOT NULL
  DROP TABLE #cov_race;
IF OBJECT_ID('tempdb..#cov_ethnicity', 'U') IS NOT NULL
  DROP TABLE #cov_ethnicity;
IF OBJECT_ID('tempdb..#cov_age', 'U') IS NOT NULL
  DROP TABLE #cov_age;
IF OBJECT_ID('tempdb..#cov_year', 'U') IS NOT NULL
  DROP TABLE #cov_year;
IF OBJECT_ID('tempdb..#cov_month', 'U') IS NOT NULL
  DROP TABLE #cov_month;
IF OBJECT_ID('tempdb..#cov_co_365d', 'U') IS NOT NULL
  DROP TABLE #cov_co_365d;
IF OBJECT_ID('tempdb..#cov_co_30d', 'U') IS NOT NULL
  DROP TABLE #cov_co_30d;
IF OBJECT_ID('tempdb..#cov_co_inpt180d', 'U') IS NOT NULL
  DROP TABLE #cov_co_inpt180d;
IF OBJECT_ID('tempdb..#cov_ce_ever', 'U') IS NOT NULL
  DROP TABLE #cov_ce_ever;
IF OBJECT_ID('tempdb..#cov_ce_overlap', 'U') IS NOT NULL
  DROP TABLE #cov_ce_overlap;
IF OBJECT_ID('tempdb..#cov_cg', 'U') IS NOT NULL
  DROP TABLE #cov_cg;
IF OBJECT_ID('tempdb..#cov_de_365d', 'U') IS NOT NULL
  DROP TABLE #cov_de_365d;
IF OBJECT_ID('tempdb..#cov_de_30d', 'U') IS NOT NULL
  DROP TABLE #cov_de_30d;
IF OBJECT_ID('tempdb..#cov_dera_365d', 'U') IS NOT NULL
  DROP TABLE #cov_dera_365d;
IF OBJECT_ID('tempdb..#cov_dera_30d', 'U') IS NOT NULL
  DROP TABLE #cov_dera_30d;
IF OBJECT_ID('tempdb..#cov_dera_ever', 'U') IS NOT NULL
  DROP TABLE #cov_dera_ever;
IF OBJECT_ID('tempdb..#cov_dera_overlap', 'U') IS NOT NULL
  DROP TABLE #cov_dera_overlap;
IF OBJECT_ID('tempdb..#cov_dg', 'U') IS NOT NULL
  DROP TABLE #cov_dg;
IF OBJECT_ID('tempdb..#cov_dg_count', 'U') IS NOT NULL
  DROP TABLE #cov_dg_count;
IF OBJECT_ID('tempdb..#cov_po_365d', 'U') IS NOT NULL
  DROP TABLE #cov_po_365d;
IF OBJECT_ID('tempdb..#cov_po_30d', 'U') IS NOT NULL
  DROP TABLE #cov_po_30d;
IF OBJECT_ID('tempdb..#cov_pg', 'U') IS NOT NULL
  DROP TABLE #cov_pg;
IF OBJECT_ID('tempdb..#cov_o_365d', 'U') IS NOT NULL
  DROP TABLE #cov_o_365d;
IF OBJECT_ID('tempdb..#cov_o_30d', 'U') IS NOT NULL
  DROP TABLE #cov_o_30d;
IF OBJECT_ID('tempdb..#cov_o_below', 'U') IS NOT NULL
  DROP TABLE #cov_o_below;
IF OBJECT_ID('tempdb..#cov_o_above', 'U') IS NOT NULL
  DROP TABLE #cov_o_above;
IF OBJECT_ID('tempdb..#cov_o_count365d', 'U') IS NOT NULL
  DROP TABLE #cov_o_count365d;
IF OBJECT_ID('tempdb..#cov_dd_cond', 'U') IS NOT NULL
  DROP TABLE #cov_dd_cond;
IF OBJECT_ID('tempdb..#cov_dd_drug', 'U') IS NOT NULL
  DROP TABLE #cov_dd_drug;
IF OBJECT_ID('tempdb..#cov_dd_proc', 'U') IS NOT NULL
  DROP TABLE #cov_dd_proc;
IF OBJECT_ID('tempdb..#cov_dd_obs', 'U') IS NOT NULL
  DROP TABLE #cov_dd_obs;
IF OBJECT_ID('tempdb..#cov_dd_visit_all', 'U') IS NOT NULL
  DROP TABLE #cov_dd_visit_all;
IF OBJECT_ID('tempdb..#cov_dd_visit_inpt', 'U') IS NOT NULL
  DROP TABLE #cov_dd_visit_inpt;
IF OBJECT_ID('tempdb..#cov_dd_visit_er', 'U') IS NOT NULL
  DROP TABLE #cov_dd_visit_er;
IF OBJECT_ID('tempdb..#cov_Charlson', 'U') IS NOT NULL
  DROP TABLE #cov_Charlson;
IF OBJECT_ID('tempdb..#cov_DCSI', 'U') IS NOT NULL
  DROP TABLE #cov_DCSI;
IF OBJECT_ID('tempdb..#cov_CHADS2', 'U') IS NOT NULL
  DROP TABLE #cov_CHADS2;


IF OBJECT_ID('tempdb..#cov_int_year', 'U') IS NOT NULL
  DROP TABLE #cov_int_year;
IF OBJECT_ID('tempdb..#cov_int_month', 'U') IS NOT NULL
  DROP TABLE #cov_int_month;
IF OBJECT_ID('tempdb..#cov_all', 'U') IS NOT NULL
  DROP TABLE #cov_all;