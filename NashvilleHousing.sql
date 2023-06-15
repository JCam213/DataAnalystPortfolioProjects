--Cleaning Data in SQL
SELECT * 
FROM CoolProjects..Housing


----------------------
--Standardizing Sale Date

SELECT SaleDateConverted, CONVERT(Date, SaleDate)
FROM CoolProjects..Housing

UPDATE CoolProjects..Housing
SET SaleDate = CONVERT(Date, SaleDate)

ALTER TABLE CoolProjects..Housing
ADD SaleDateConverted Date;

UPDATE CoolProjects..Housing
SET SaleDateConverted = CONVERT(Date, SaleDate)

----------------------------------------------
--Populate Poperty address

SELECT *
FROM CoolProjects..Housing
--WHERE PropertyAddress is null
ORDER BY ParcelID

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM CoolProjects..Housing a
JOIN CoolProjects..Housing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM CoolProjects..Housing a
JOIN CoolProjects..Housing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null

-----------------------------
--Breaking out Address into Individual Colums (Address, city, state)

SELECT PropertyAddress
FROM CoolProjects..Housing
--WHERE PropertyAddress is null
--ORDER BY ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) AS Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress)) AS Address
FROM CoolProjects..Housing

ALTER TABLE CoolProjects..Housing
ADD PropertySplitAddress NVARCHAR(255);

UPDATE CoolProjects..Housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)

ALTER TABLE CoolProjects..Housing
ADD PropertySplitCity NVARCHAR(255);

UPDATE CoolProjects..Housing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress))

SELECT *
FROM CoolProjects..Housing

SELECT OwnerAddress
FROM CoolProjects..Housing

SELECT
PARSENAME(REPLACE(OwnerAddress, ',', '.'),3) 
,PARSENAME(REPLACE(OwnerAddress, ',', '.'),2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.'),1)
FROM CoolProjects..Housing

ALTER TABLE CoolProjects..Housing
ADD OwnerSplitAddress NVARCHAR(255);

UPDATE CoolProjects..Housing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'),3) 

ALTER TABLE CoolProjects..Housing
ADD OwnerSplitCity NVARCHAR(255);

UPDATE CoolProjects..Housing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'),2)

ALTER TABLE CoolProjects..Housing
ADD OwnerSplitState NVARCHAR(255);

UPDATE CoolProjects..Housing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'),1)
---------------------------------------------------
--CHange Y and N to Yes and No in Sold as Vacant fields



SELECT SoldAsVacant
,	CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
		WHEN SoldAsVacant = 'N' THEN 'No'
		ELSE SoldAsVacant
		END
FROM CoolProjects..Housing

UPDATE CoolProjects..Housing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
		WHEN SoldAsVacant = 'N' THEN 'No'
		ELSE SoldAsVacant
		END

SELECT DISTINCT(SoldAsVacant), Count(SoldAsVacant)
FROM CoolProjects..Housing
Group by SoldAsVacant
Order by 2

-----------------------------------------------------
--Remove Duplicates
WITH RowNumCTE AS( 
SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
				ORDER BY 
					UniqueID
					) row_num


FROM CoolProjects..Housing
--ORDER BY ParcelID
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1


SELECT *
FROM CoolProjects..Housing
----------------------------------------
--Delete Unsured Columns

Select *
FROM CoolProjects..Housing

ALTER TABLE CoolProjects..Housing
DROP COLUMN OwnerAddress, PropertyAddress, TaxDistrict

ALTER TABLE CoolProjects..Housing
DROP COLUMN SaleDate