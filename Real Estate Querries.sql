---1.	For each building, list the ID, address, date bought, owner name and how many years the current owner has owned the building

select Building.BuildingID,Building.Street,  Building.City, Building.State, Building.Zip, AGENCY.BoughDate, Fname,lname,
case 
when AGENCY.SoldDate is NUll then datediff(year,boughDate,GetDate())
else datediff(year,boughDate,SoldDate) end as OwnedBuilding from BUILDING
inner join AGENCY on
building.buildingid=agency.buildingID
inner join Owner on
Owner.OwnerID=Agency.OwnerID
inner join COMPANYOWNER on Owner.OWnerID=CompanyOwner.CompanyID
inner join CONTACT on COMPANYOWNER.ContactPersonID=CONTACT.ContactID

---2.	List the address and apartment number of each Apartment that is currently vacant

select * from APARTMENT

select apartment.BuildingID, apartment.FloorNumber, apartment.AptID, Building.Street,  Building.City, Building.State, Building.Zip from BUilding
inner join APARTMENT on BUILDING.BuildingID=APARTMENT.BuildingID
where RentalStatus='Vacant'


---3.	List the address and apartment number of each vacant apartment that has hardwood floors and a patio
select distinct pat.BuildingID, pat.floornumber, pat.AptID from
(
select distinct Vac.BuildingID, Vac.FloorNumber, Vac.AptID, Vac.Street, Vac.City, Vac.State, Vac.Zip
from
(
select apartment.BuildingID, apartment.FloorNumber, apartment.AptID, Building.Street,  Building.City, Building.State, Building.Zip from BUilding
inner join APARTMENT on BUILDING.BuildingID=APARTMENT.BuildingID
where RentalStatus='Vacant' 
) as Vac
inner join
(
select apartment.BuildingID, apartment.FloorNumber, apartment.AptID, Building.Street,  Building.City, Building.State, Building.Zip from BUilding
inner join APARTMENT on BUILDING.BuildingID=APARTMENT.BuildingID
where APARTMENT.HardwoodFloors='True'
) as Hardwood  on Vac.BuildingID=Hardwood.BuildingID ) as VacHard
inner join
(select apartment.BuildingID, apartment.FloorNumber, apartment.AptID, Building.Street,  Building.City, Building.State, Building.Zip from BUilding
inner join APARTMENT on BUILDING.BuildingID=APARTMENT.BuildingID
where APARTMENT.Patio='True') as Pat 
on VacHard.BuildingID=pat.BuildingID

---4.	For each building, list the address and how many Apartments are currently vacant in the building

select  apartment.BuildingID, Building.Street,  Building.City, Building.State, Building.Zip, 
count(apartment.buildingID) AS VacantApts from BUilding
inner join APARTMENT on BUILDING.BuildingID=APARTMENT.BuildingID
where RentalStatus='Vacant'
group by apartment.BuildingID, Building.Street,  Building.City, Building.State, Building.Zip

---5.	For each type of repair, list the type of repair and the total amount of cost incurred for repairs of that type.

select Category.CategoryDescription, sum(Repair.CostOfRepair) from Repair
right join CATEGORY on REPAIR.CategoryID=CATEGORY.CategoryID
group by Category.CategoryDescription

---6.	For each tenant, list the tenant name and the total amount of rent he has paid over time.


select fname, lname, enddate, case
when Enddate>= getdate() then SUM((DATEDIFF(month,Rent.StartDate,GetDate())*MonthlyRental))
else SUM((DATEDIFF(month,Rent.StartDate,Rent.Enddate)*MonthlyRental)) end AS PAID from Rent
inner join Person on rent.TenantID=person.personID
group by fname, Lname, enddate

---7.	For each owner, list his name and the largest amount he has paid to buy a building.


select fname, lname, Max(SalePRice) from Agency
inner join Owner on AGENCY.OwnerID=Owner.OwnerID
inner join CompanyOWner on Owner.OwnerID=COMPANYOWNER.CompanyID
inner join CONTACT on contact.ContactID=COMPANYOWNER.ContactPersonID
group by Fname, Lname

----8.	List the buildings that have more than 3 apartments that are currently vacant


select BuildingID, Count(A.BuildingID) from (
select APARTMENt.BuildingID, APARTMENT.FloorNumber, APARTMENT.AptID from APARTMENT
inner join BUilding on APARTMENT.BuildingID=BUILDING.BuildingID
where RentalStatus='Vacant') as A
group by A.BuildingID
having Count(A.BuildingID)>3


---9.	For each Lease that hasn’t yet expired, list the name of the Tenant who signed the list, address of the building and the amount of rent the lease was signed for

select Fname,Lname,Building.Street,  Building.City, Building.State, Building.Zip,(DATEDIFF(month,Rent.StartDate,Rent.Enddate))*MonthlyRental  as Paid
from Rent
inner join BUilding on Rent.BuldingID=Building.BuildingID
inner join Tenant on Tenant.tenantid=rent.TenantID
inner join person on person.PersonID=tenant.TenantID
where EndDate<=getDate()

---10.	For all apartments in which pets are allowed, list the lowest rent that is being charged

select MIN(RENT.MonthlyRental) AS LowestRent from BUILDING
inner join Rent on Building.BuildingID=Rent.BuldingID
where PetsAllowed='True'

