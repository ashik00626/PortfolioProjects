*/

-- cleaning data in SQL

*/


SELECT *
FROM china.housing_data

--Populate property address data

SELECT *
FROM china.housing_data
--WHERE "PropertyAddress" is null;
ORDER BY "ParcelID"

SELECT 
	a."ParcelID", 
	a."PropertyAddress", 
	b."ParcelID", 
	b."PropertyAddress",
COALESCE (a."PropertyAddress",b."PropertyAddress")
FROM china.housing_data a
JOIN china.housing_data b
	ON a."ParcelID" = b."ParcelID"
	AND a."UniqueID " <> b."UniqueID "
WHERE a."PropertyAddress" is null;

UPDATE china.housing_data a
SET "PropertyAddress" = COALESCE (a."PropertyAddress",b."PropertyAddress")
FROM china.housing_data b
WHERE a."ParcelID" = b."ParcelID"
	AND a."UniqueID " <> b."UniqueID "
	AND a."PropertyAddress" is null;


--Breaking out Address into individual columns (Address, City, State)

SELECT "PropertyAddress"
FROM china.housing_data
--WHERE "PropertyAddress" is null;
--ORDER BY "ParcelID"

SELECT 
	SPLIT_PART("PropertyAddress",',',1) AS Address,
	SPLIT_PART("PropertyAddress",',',2)  AS City
FROM china.housing_data;

ALTER TABLE china.housing_data
ADD COLUMN PropertySplitAddress VARCHAR(255),
ADD COLUMN PropertySplitCity VARCHAR(255);

UPDATE china.housing_data
SET
	PropertySplitAddress = SPLIT_PART("PropertyAddress",',',1), 
	PropertySplitCity = SPLIT_PART("PropertyAddress",',',2);

--ALTER TABLE china.housing_data
--RENAME COLUMN PropertySpilitAddress TO PropertySplitAddress;

SELECT "OwnerAddress"
FROM china.housing_data

SELECT 
SPLIT_PART("OwnerAddress",',',1) AS Address,
SPLIT_PART("OwnerAddress",',',2) AS City,
SPLIT_PART("OwnerAddress",',',3) AS State
FROM china.housing_data;

ALTER TABLE china.housing_data
ADD COLUMN OwnerSplitAddress VARCHAR(255),
ADD COLUMN OwnerSplitCity VARCHAR(255),
ADD COLUMN OwnerSplitState VARCHAR(255);

UPDATE  china.housing_data
SET
OwnerSplitAddress=SPLIT_PART("OwnerAddress",',',1),
OwnerSplitCity=SPLIT_PART("OwnerAddress",',',2),
OwnerSplitState=SPLIT_PART("OwnerAddress",',',3);

--Remove Duplicates--

WITH RowNumCTE AS(
SELECT*,
	ROW_NUMBER() OVER (
	PARTITION BY "ParcelID",
				 "PropertyAddress",
				 "SalePrice",
				 "SaleDate",
				 "LegalReference"
				 ORDER BY "UniqueID "
	             )AS row_num
FROM china.housing_data
)
SELECT*
FROM RowNumCTE
WHERE row_num > 1
ORDER BY "PropertyAddress";


WITH CTE AS (
    SELECT "UniqueID "
    FROM (
        SELECT "UniqueID ",
               ROW_NUMBER() OVER (
                   PARTITION BY "ParcelID", 
				                "PropertyAddress", 
								"SalePrice", 
								"SaleDate", 
								"LegalReference"
                                ORDER BY "UniqueID "
                                ) AS row_num
FROM china.housing_data
) AS sub
WHERE sub.row_num > 1
)
DELETE FROM china.housing_data
WHERE "UniqueID " IN (SELECT "UniqueID " FROM CTE);


--Delete unused columns--

SELECT *
FROM china.housing_data

ALTER TABLE china.housing_data
DROP COLUMN "OwnerAddress",
DROP COLUMN "TaxDistrict",
DROP COLUMN "PropertyAddress";

