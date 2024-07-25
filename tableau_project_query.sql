select * from customer
	
alter table customer
drop column customeralternatekey,
drop column title,
drop column middlename,
drop column namestyle,
drop column birthdate,
drop column maritalstatus,
drop column suffix,
drop column gender,
drop column emailaddress,
drop column yearlyincome,
drop column spanisheducation,
drop column frenchoccupation,
drop column houseownerflag,
drop column addressline1,
drop column addressline2,
drop column phone,
drop column datefirstpurchase

select count(totalchildren), totalchildren from customer
group by totalchildren

select * from customer
	
alter table customer
drop column numberchildrenathome,
drop column frencheducation,
drop column spanishoccupation,
drop column totalchildren,
drop column numbercarsowned,
drop column englishoccupation

select englisheducation, count(englisheducation)
from customer
group by englisheducation

---------------------------------------------------------------

select * from date
	
alter table date
drop column daynumberofweek,
drop column englishdaynameofweek,
drop column spanishdaynameofweek,
drop column frenchdaynameofweek,
drop column daynumberofmonth,
drop column daynumberofyear,
drop column weeknumberofyear,
drop column spanishmonthname,
drop column frenchmonthname,
drop column monthnumberofyear,
drop column calendarsemester,
drop column fiscalquarter,
drop column fiscalyear,
drop column fiscalsemester

alter table date
rename column englishmonthname to month

---------------------------------------------------------------

select * from geography

alter table geography
drop column stateprovincecode,
drop column countryregioncode,
drop column spanishcountryregionname,
drop column frenchcountryregionname,
drop column postalcode,
drop column salesterritorykey,
drop column ipaddresslocator

alter table geography
rename column englishcountryregionname to countryname

alter table geography
rename column geographykey to geography_key

-----------------------------------------------------------------


select * from internetsales

alter table internetsales
drop column duedatekey,
drop column promotionkey,
drop column currencykey,
drop column salesordernumber,
drop column totalproductcost,
drop column orderdate,
drop column duedate,
drop column shipdate

--------------------------------------------------------------------

select * from product

alter table product
drop column startdate,
drop column enddate,
drop column status,
drop column productalternatekey,
drop column color,
drop column safetystocklevel,
drop column reorderpoint,
drop column size,
drop column daystomanufacture,
drop column productline,
drop column englishdescription,
drop column modelname

-------------------------------------------------------------------

select * from productcategory
	
alter table productcategory
drop column productcategoryalternatekey

alter table productcategory
rename column productcategorykey to productcategory_key

alter table productcategory
rename column englishproductcategoryname to productcategories

--------------------------------------------------------------------

select * from productsubcategory
	
alter table productsubcategory
drop column productsubcategoryalternatekey

alter table productsubcategory
rename column englishproductsubcategoryname to productsubcategories

alter table productsubcategory
rename column productsubcategorykey to productsubcategory_key

-------------------------------------------------------------------

----joining tables-------

select * from customer

create table customers
as
(select customerkey, geographykey, firstname|| ' ' ||lastname as customername, englisheducation, commutedistance
	from customer)

create table customer_geography_data
as
(select * from customers
	join geography
	on customers.geographykey = geography_key)

select * from customer_geography_data

----------------------------------------------------------------

select * from date
where calendaryear > 2020


alter table internetsales
alter column orderdatekey type integer
USING orderdatekey::integer

select * from internetsales
where orderdatekey > 20201231

select * from product
	
select * from productcategory
	
select * from productsubcategory

select * from
(select * from productcategory
inner join productsubcategory
on productcategory.productcategory_key = productsubcategory.productcategorykey) as p
join product on p.productsubcategory_key = product.productsubcategorykey


select * from internetsales
where orderdatekey > 20201231

select sum(salesamount) from internetsales
where orderdatekey > 20201231

