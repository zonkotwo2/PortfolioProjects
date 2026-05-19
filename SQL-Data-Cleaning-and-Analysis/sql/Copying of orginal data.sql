

CREATE TABLE `layoffs_staging5` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging5;


INSERT INTO layoffs_staging5
SELECT *,
ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, 
					percentage_laid_off, `date`, stage , country, funds_raised_millions
	ORDER BY company 
    ) AS row_num
FROM layoffs_staging;


SELECT *
FROM layoffs_staging5
WHERE row_num > 1;

DELETE 
FROM layoffs_staging5
WHERE row_num > 1;


SELECT *
FROM layoffs_staging5
WHERE country LIKE 'United States%'
ORDER BY 1;

SELECT *
FROM layoffs_staging2;

ORDER BY country;

-- Standardizing data

SELECT DISTINCT(TRIM(company))
FROM layoffs_staging2

