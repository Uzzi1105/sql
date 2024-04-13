--cleaning data in sql

SELECT * FROM  PortfolioProject.dbo.NashvilleHousing


--standardize date format


SELECT SaleDate, CONVERT(Date,Saledate)
FROM  PortfolioProject.dbo.NashvilleHousing

UPDATE NashvilleHousing
SET SaleDate = CONVERT(Date,Saledate)


ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

UPDATE NashvilleHousing
SET SaleDateConverted = CONVERT(Date,Saledate)


SELECT SaleDateConverted, CONVERT(Date,Saledate)
FROM  PortfolioProject.dbo.NashvilleHousing



--populate property address data

SELECT PropertyAddress
FROM  PortfolioProject.dbo.NashvilleHousing
WHERE PropertyAddress is null


SELECT *
FROM  PortfolioProject.dbo.NashvilleHousing
ORDER BY ParcelID


SELECT a.ParcelID, a.PropertyAddress,b.ParcelID,b.PropertyAddress
FROM PortfolioProject.dbo.NashvilleHousing a
join PortfolioProject.dbo.NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID ]<> b.[UniqueID ]
where a.PropertyAddress is null



SELECT a.ParcelID, a.PropertyAddress,b.ParcelID,b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM PortfolioProject.dbo.NashvilleHousing a
join PortfolioProject.dbo.NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID ]<> b.[UniqueID ]
where a.PropertyAddress is null


UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM PortfolioProject.dbo.NashvilleHousing a
join PortfolioProject.dbo.NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID ]<> b.[UniqueID ]
where a.PropertyAddress is null




--breaking out address into individual columns (address, city, state)

SELECT PropertyAddress
FROM PortfolioProject.dbo.NashvilleHousing


select 
substring(PropertyAddress, 1, charindex(',', propertyaddress)) as Address 
FROM PortfolioProject.dbo.NashvilleHousing


select 
substring(PropertyAddress, 1, charindex(',', propertyaddress)) as Address,
charindex(',', propertyaddress)
FROM PortfolioProject.dbo.NashvilleHousing


select 
substring(PropertyAddress, 1, charindex(',', propertyaddress) -1 ) as Address 
FROM PortfolioProject.dbo.NashvilleHousing


select 
substring(PropertyAddress, 1, charindex(',', propertyaddress) -1 ) as Address, 
substring(PropertyAddress, charindex(',', propertyaddress) , len(propertyaddress)) as Address 
FROM PortfolioProject.dbo.NashvilleHousing


select 
substring(PropertyAddress, 1, charindex(',', propertyaddress) -1 ) as Address, 
substring(PropertyAddress, charindex(',', propertyaddress) +1 , len(propertyaddress)) as Address 
FROM PortfolioProject.dbo.NashvilleHousing



ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

UPDATE NashvilleHousing
SET PropertySplitAddress = substring(PropertyAddress, 1, charindex(',', propertyaddress) -1 )



ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

UPDATE NashvilleHousing
SET PropertySplitCity = substring(PropertyAddress, charindex(',', propertyaddress) +1 , len(propertyaddress))


select * FROM PortfolioProject.dbo.NashvilleHousing




select OwnerAddress FROM PortfolioProject.dbo.NashvilleHousing

SELECT 
PARSENAME(OwnerAddress, 1)
FROM PortfolioProject.dbo.NashvilleHousing


SELECT 
PARSENAME(REPLACE (OwnerAddress, ',', '.'), 1)
FROM PortfolioProject.dbo.NashvilleHousing




SELECT 
PARSENAME(REPLACE (OwnerAddress, ',', '.'), 1),
PARSENAME(REPLACE (OwnerAddress, ',', '.'), 2),
PARSENAME(REPLACE (OwnerAddress, ',', '.'), 3)

FROM PortfolioProject.dbo.NashvilleHousing



SELECT 
PARSENAME(REPLACE (OwnerAddress, ',', '.'), 3),
PARSENAME(REPLACE (OwnerAddress, ',', '.'), 2),
PARSENAME(REPLACE (OwnerAddress, ',', '.'), 1)

FROM PortfolioProject.dbo.NashvilleHousing









ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

UPDATE NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE (OwnerAddress, ',', '.'), 3)



ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

UPDATE NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE (OwnerAddress, ',', '.'), 2)





ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

UPDATE NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE (OwnerAddress, ',', '.'), 1)



SELECT*
FROM PortfolioProject.dbo.NashvilleHousing




--CHANGE Y and N into Yes and No in "Soldas Vacant" field

SELECT Distinct (SoldAsVacant)
FROM PortfolioProject.dbo.NashvilleHousing



SELECT Distinct (SoldAsVacant), count(SoldasVacant)
FROM PortfolioProject.dbo.NashvilleHousing
group by SoldasVacant
order by 2


SELECT SoldAsVacant
,Case When SoldAsVacant = 'Y' THEN 'Yes'
      When SoldAsVacant = 'N' THEN 'No'
	  ELSE SoldAsVacant
	  END
FROM PortfolioProject.dbo.NashvilleHousing


UPDATE NashvilleHousing
SET SoldAsVacant = Case When SoldAsVacant = 'Y' THEN 'Yes'
      When SoldAsVacant = 'N' THEN 'No'
	  ELSE SoldAsVacant
	  END


SELECT Distinct (SoldAsVacant), count(SoldasVacant)
FROM PortfolioProject.dbo.NashvilleHousing
group by SoldasVacant
order by 2





--remove duplicates

SELECT*,
    ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
	             PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				     UniqueID
					 ) row_num
FROM PortfolioProject.dbo.NashvilleHousing




WITH RowNumCTE AS(
SELECT*,
    ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
	             PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				     UniqueID
					 ) row_num
FROM PortfolioProject.dbo.NashvilleHousing
)
SELECT * FROM RowNumCTE





WITH RowNumCTE AS(
SELECT*,
    ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
	             PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				     UniqueID
					 ) row_num
FROM PortfolioProject.dbo.NashvilleHousing
)
SELECT * FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress



WITH RowNumCTE AS(
SELECT*,
    ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
	             PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				     UniqueID
					 ) row_num
FROM PortfolioProject.dbo.NashvilleHousing
)
DELETE
FROM RowNumCTE
WHERE row_num > 1



WITH RowNumCTE AS(
SELECT*,
    ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
	             PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				     UniqueID
					 ) row_num
FROM PortfolioProject.dbo.NashvilleHousing
)
SELECT * FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress



--Delete Unused Columns

SELECT*
FROM PortfolioProject.dbo.NashvilleHousing



ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress,


ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN SaleDate
