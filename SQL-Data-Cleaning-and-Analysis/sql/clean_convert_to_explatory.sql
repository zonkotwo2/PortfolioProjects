CREATE TABLE `layoffs_explore` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` date DEFAULT NULL,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_explore;

SELECT *
FROM layoffs_staging5;


SHOW COLUMNS FROM layoffs_explore;
SHOW COLUMNS FROM layoffs_staging5;


INSERT INTO layoffs_explore(
							company, location, industry, total_laid_off,
							percentage_laid_off, `date`, stage, country, funds_raised_millions )
SELECT company, location, industry, total_laid_off, percentage_laid_off,
`date`, stage, country, funds_raised_millions
FROM layoffs_staging5;

