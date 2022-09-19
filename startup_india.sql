SELECT count(*) FROM personal_project.startup_india;
SELECT * FROM personal_project.startup_india;
use personal_project;
select company_name,company_class,company_category,registrar_of_companies,company_status from startup_india
where company_status="strike off"
order by company_status;
select PRINCIPAL_BUSINESS_ACTIVITY_AS_PER_CIN,company_name from startup_india
order by PRINCIPAL_BUSINESS_ACTIVITY_AS_PER_CIN;
select sum(AUTHORIZED_CAP),sum(PAIDUP_CAPITAL) from startup_india;
select max(AUTHORIZED_CAP),max(PAIDUP_CAPITAL),DATE_OF_REGISTRATION,company_name from startup_india;
select min(AUTHORIZED_CAP),min(PAIDUP_CAPITAL),DATE_OF_REGISTRATION,company_name from startup_india;
select date_of_registration,company_name from startup_india where company_status="active";
select date_of_registration,company_name from startup_india where company_status in('dissloved','strike off');
select date_of_registration,company_name from startup_india where company_status in('captured','under process of strike off');


DELIMITER //

create procedure count_of_company_status()
BEGIN
select count(company_name),company_status,date_of_registration from startup_india group by company_status;

END //

call count_of_company_status();


select count(company_name),company_category,company_class,company_sub_category from startup_india where company_status='active' group by company_sub_category;
select count(company_name),PRINCIPAL_BUSINESS_ACTIVITY_AS_PER_CIN,REGISTERED_STATE,AUTHORIZED_CAP from startup_india where company_status="active"  group by PRINCIPAL_BUSINESS_ACTIVITY_AS_PER_CIN  order by AUTHORIZED_CAP;
select count(LATEST_YEAR_ANNUAL_RETURN) from startup_india where  LATEST_YEAR_ANNUAL_RETURN='NA'  ;
select count(EMAIL_ADDR) from startup_india where EMAIL_ADDR  ='NA'  ;
select company_name,company_category,company_sub_category,company_status,company_class from startup_india where Authorized_cap between 5000000 and 10000000;
select company_name,company_category,company_sub_category,company_status,company_class from startup_india where Authorized_cap not between 5000000 and 10000000;
select count(LATEST_YEAR_ANNUAL_RETURN) from startup_india where  LATEST_YEAR_ANNUAL_RETURN not like 'NA'  ;

create view paidupcap as
select avg(PAIDUP_CAPITAL) as avg_paidup, min(paidup_capital) as min_paidup,max(paidup_capital) as max_paidup,company_name from startup_india;

create view authorized_amount as
select avg(authorized_cap) as avg_auth,min(authorized_cap) as min_auth,max(authorized_cap) as max_auth,company_name from startup_india;

show indexes from startup_india ;

create index startup on startup_india(company_name);


describe startup_india;
select count(*) from startup_india where company_name is null; 

alter table startup_india
modify company_name varchar(200),
modify company_status varchar(100),
modify company_class varchar(50),
modify company_sub_category varchar(200),
modify registered_state varchar(100);

select avg(industrial_class) from startup_india;
select max(industrial_class),CORPORATE_IDENTIFICATION_NUMBER, COMPANY_NAME, COMPANY_STATUS, COMPANY_CLASS, COMPANY_CATEGORY, COMPANY_SUB_CATEGORY, DATE_OF_REGISTRATION, REGISTERED_STATE, AUTHORIZED_CAP, PAIDUP_CAPITAL, PRINCIPAL_BUSINESS_ACTIVITY_AS_PER_CIN, REGISTERED_OFFICE_ADDRESS, REGISTRAR_OF_COMPANIES, EMAIL_ADDR, LATEST_YEAR_ANNUAL_RETURN, LATEST_YEAR_FINANCIAL_STATEMENT from startup_india;
select min(industrial_class),CORPORATE_IDENTIFICATION_NUMBER, COMPANY_NAME, COMPANY_STATUS, COMPANY_CLASS, COMPANY_CATEGORY, COMPANY_SUB_CATEGORY, DATE_OF_REGISTRATION, REGISTERED_STATE, AUTHORIZED_CAP, PAIDUP_CAPITAL, PRINCIPAL_BUSINESS_ACTIVITY_AS_PER_CIN, REGISTERED_OFFICE_ADDRESS, REGISTRAR_OF_COMPANIES, EMAIL_ADDR, LATEST_YEAR_ANNUAL_RETURN, LATEST_YEAR_FINANCIAL_STATEMENT from startup_india;

