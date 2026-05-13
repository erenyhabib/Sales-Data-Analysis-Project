select*
from final_cleaned

select Name,Age
from final_cleaned


select count(CustomerID) as count_category,ProductCategory
from final_cleaned
Group by ProductCategory

UPDATE final_cleaned
SET Rating = 5
WHERE Rating > 5;

select Rating
from final_cleaned

UPDATE final_cleaned
SET Age = 
(SELECT AVG(Age) FROM final_cleaned WHERE Age > 0 AND Age < 100)
WHERE Age <= 0 OR Age >= 100 OR Age IS NULL;

-- Customer Segmentation by Age Groups
SELECT 
    CASE 
        WHEN Age <= 30 THEN 'Youth'
        WHEN Age <= 60 THEN 'Adults'
        ELSE 'Seniors'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(PurchaseAmount) AS Total_Sales
FROM final_cleaned 
GROUP BY 
    CASE 
        WHEN Age <= 30 THEN 'Youth'
        WHEN Age <= 60 THEN 'Adults'
        ELSE 'Seniors'
    END
ORDER BY Total_Sales DESC;


ALTER TABLE final_cleaned
ALTER COLUMN PurchaseAmount DECIMAL(10,2);


select count(ProductCategory) as count_category,Age
from final_cleaned
where age<=30
Group by Age

SELECT ProductCategory, 
       AVG(Rating) AS AverageRating,
       COUNT(*) AS ReviewCount
FROM final_cleaned
GROUP BY ProductCategory
HAVING AVG(Rating) < 3.5 
ORDER BY AverageRating ASC;

UPDATE final_cleaned
SET ProductCategory= 'other'
WHERE ProductCategory='unknown'


select productCategory
from final_cleaned


ALTER TABLE final_cleaned
ADD AgeGroup NVARCHAR(50);

UPDATE final_cleaned
SET AgeGroup = CASE 
    WHEN Age <= 30 THEN 'Youth'
    WHEN Age <= 60 THEN 'Adults'
    ELSE 'Seniors'
END;

SELECT TOP 10 Age, AgeGroup 
FROM final_cleaned;