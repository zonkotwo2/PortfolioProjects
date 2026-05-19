SELECT DISTINCT location
FROM layoffs_staging5
ORDER BY 1;


SELECT DISTINCT country
FROM layoffs_staging5
ORDER BY 1;

SELECT *
FROM layoffs_staging3
ORDER BY location ASC;

SELECT DISTINCT location
FROM layoffs_staging5
ORDER BY location ASC;


SELECT DISTINCT location
FROM layoffs_staging5
WHERE location LIKE 'D%'
ORDER BY 1;





SELECT DISTINCT location
FROM layoffs_staging5
WHERE location LIKE 'F%'
ORDER BY 1;



UPDATE layoffs_staging5
SET location = 'Düsseldorf'
WHERE location = 'DÃ¼sseldorf';


UPDATE layoffs_staging5
SET location = 'Florianópolis'
WHERE location = 'FlorianÃ³polis';

SELECT DISTINCT location
FROM layoffs_staging3
WHERE location LIKE 'D%'
ORDER BY 1;

SELECT *
FROM layoffs_staging5
ORDER BY location ASC;



SELECT *
FROM layoffs_staging3
WHERE location = 'DÃ¼sseldorf'
ORDER BY location ASC;

