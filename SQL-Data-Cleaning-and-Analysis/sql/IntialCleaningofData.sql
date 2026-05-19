-- Standardising Data

SELECT company, TRIM(company)
FROM layoffs_staging5;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE  'Crypto%';




SELECT *
FROM layoffs_staging5
ORDER BY location ASC;





SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging5
ORDER BY 1;

UPDATE layoffs_staging5
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%' ;


SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging5;

UPDATE layoffs_staging5
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Ydate');

ALTER TABLE layoffs_staging5
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging5
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging5
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging5
WHERE company = 'Airbnb';

SELECT *
FROM layoffs_staging5
WHERE company = 'Bally%';

SELECT *
FROM layoffs_staging5 t1
JOIN layoffs_staging5 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging5 t1
JOIN layoffs_staging5 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

SELECT t1.industry, t2.industry
FROM layoffs_staging5 t1
JOIN layoffs_staging5 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging3
SET industry = NULL
WHERE industry = '',;

UPDATE layoffs_staging4 t1
JOIN layoffs_staging4 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;


UPDATE layoffs_staging5 t1
JOIN layoffs_staging5 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


UPDATE layoffs_staging5
SET industry = NULL
WHERE industry = '';


SELECT * 
FROM layoffs_staging5
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


DELETE
FROM layoffs_staging5
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


SELECT *
FROM layoffs_staging5;

ALTER TABLE layoffs_staging5
DROP COLUMN row_num;









