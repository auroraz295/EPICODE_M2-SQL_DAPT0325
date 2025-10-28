#1. ESPONI L'ANAGRAFICA DEI PRODOTTI INDICANDO PER OGNI PRODOTTO 
#LA SUA SOTTOCATEGORIA (DIMPRODUCT, DIMPRODUCTSUBCATEGORY)

#UTILIZZO DATABASE
USE AdventureWorksDW;
#MOSTRA TABELLE
SHOW TABLES;
#DETTAGLIO DI DIM PRODUCT E DIM PRODUCT SUB CATEGORY
DESCRIBE dimproduct; 
#PRODUCT KEY - PK / PRODUCT SUB CATEGORY - FK
DESCRIBE dimproductsubcategory;
#PRODUCT SUB CATEGORY - PK 

#VISUALIZZO I PRODOTTI 
SELECT * FROM dimproduct;
SELECT * FROM dimproductsubcategory;

#ESERCIZIO 1
SELECT  P.ProductKey, P.ProductAlternateKey, P.ProductSubcategoryKey, P.EnglishProductName, 
		SC.EnglishProductSubcategoryName, P.StandardCost, P.ListPrice, P.ModelName
FROM dimproduct AS P LEFT JOIN dimproductsubcategory AS SC
ON P.ProductSubcategoryKey = SC.ProductSubcategoryKey;

#2. ESPONI L'ANAGRAFICA DEI PRODOTTI INDICANDO PER OGNI PRODOTTO 
#LA SUA SOTTOCATEGORIA E LA SUA CATEGORIA 
#(DIMPRODUCT, DIMPRODUCTSUBCATEGORY, DIMPRODUCTCATEGORY)

#DETTAGLIO DI DIM PRODUCT, DIM PRODUCT SUBCATEGORY, DIM PRODUCT CATEGORY
DESCRIBE dimproduct;
#PRODUCT KEY - PK / PRODUCT SUBCATEGORY KEY FK
DESCRIBE dimproductsubcategory;
#PRODUCT SUBCATEGORY KEY - PK / PRODUCT CATEGORY KEY FK
DESCRIBE dimproductcategory;
#PRODUCT CATEGORY KEY - PK 

#VISUALIZZO I PRODOTTI
SELECT * FROM dimproduct;
SELECT * FROM dimproductsubcategory;
SELECT * FROM dimproductcategory;

#ESERCIZIO 2
SELECT  P.ProductKey, P.ProductAlternateKey, P.ProductSubcategoryKey, P.EnglishProductName, 
		SC.EnglishProductSubcategoryName, SC.ProductCategoryKey, C.EnglishProductCategoryName, 
		P.StandardCost, P.ListPrice, P.ModelName
FROM dimproduct AS P LEFT JOIN dimproductsubcategory AS SC 
	ON P.ProductSubcategoryKey = SC.ProductSubcategoryKey
					 LEFT JOIN dimproductcategory AS C
    ON SC.ProductCategoryKey = C.ProductCategoryKey;               

#3. ESPONI L'ELENCO DEI SOLI PRODOTTI VENDUTI (DIMPRODUCT, FACTRESELLERSALES)

#DETTAGLIO DI DIMPRODUCT E FACT RESELLER SALES
DESCRIBE dimproduct;
#PRODUCT KEY - PK 
DESCRIBE factresellersales;
#SALES ORDER NUMBER - PK / SALES ORDER LINE NUMBER - PK / PRODUCT KEY - FK

#VISUALIZZO I PRODOTTI
SELECT * FROM dimproduct;
SELECT * FROM factresellersales;

#ESERCIZIO 3
SELECT P.ProductKey, P.ProductAlternateKey, S.SalesOrderNumber, P.EnglishProductName, 
		S.OrderQuantity, P.StandardCost, P.ListPrice, S.UnitPrice, S.TotalProductCost, S.SalesAmount
FROM dimproduct AS P INNER JOIN factresellersales as S
ON P.ProductKey = S.ProductKey;

#4. ESPONI L'ELENCO DEI PRODOTTI NON VENDUTI (CONSIDERA I PRODOTTI FINITI, CIOE'
#QUELLI PER CUI IL CAMPO FINISHEDGOODFLAGS=1)

#VISUALIZZO I PRODOTTI
SELECT * FROM dimproduct;

#ESERCIZIO 4
SELECT P.ProductKey, P.ProductAlternateKey, S.SalesOrderNumber, P.EnglishProductName, P.FinishedGoodsFlag,
		S.OrderQuantity, P.StandardCost, P.ListPrice, S.UnitPrice, S.TotalProductCost, S.SalesAmount
FROM dimproduct AS P RIGHT JOIN factresellersales AS S
ON P.ProductKey = S.ProductKey
WHERE P.FinishedGoodsFlag=1;

#5. ESPONI L'ELENCO DELLE TRANSAZIONI DI VENDITA (FACTRESELLERSALES) INDICANDO 
#ANCHE IL NOME DEL PRODOTTO VENDUTO (DIMPRODUCT)

#DETTAGLIO DI FACT RESELLER SALES E DIM PRODUCT
DESCRIBE factresellersales;
#SALES ORDER NUMBER - PK / SALES ORDER LINE NUMBER - PK / PRODUCT KEY - FK
DESCRIBE dimproduct;
#PRODUCT KEY - PK

#VISUALIZZO I PRODOTTI
SELECT * FROM factresellersales;
SELECT * FROM dimproduct;

#ESERCIZIO 5
SELECT  S.SalesOrderNumber, S.SalesOrderLineNumber, S.OrderDate, S.ProductKey,
		P.EnglishProductName, S.ResellerKey, S.EmployeeKey, S.OrderQuantity, S.UnitPrice,
		S.TotalProductCost, S.SalesAmount
FROM factresellersales AS S LEFT JOIN dimproduct as P
ON S.ProductKey = P.ProductKey;

#6. ESPONI L'ELENCO DELLE TRANSAZIONI DI VENDITA INDICANDO LA CATEGORIA DI APPARTENENZA
#DI CIASCUN PRODOTTO VENDUTO

#DETTAGLI
DESCRIBE factresellersales;
#SALES ORDER NUMBER - PK / PRODUCT KEY - FK
DESCRIBE dimproduct;
#PRODUCT KEY - PK / PRODUCT SUBCATEGORY KEY - FK
DESCRIBE dimproductsubcategory;
#PRODUCT SUBCATEGORY KEY - PK / PRODUCT CATEGORY KEY - FK
DESCRIBE dimproductcategory;
#PRODUCT CATEGORY KEY - PK

#VISUALIZZO I PRODOTTI
SELECT * FROM factresellersales;
SELECT * FROM dimproduct;
SELECT * FROM dimproductsubcategory;
SELECT * FROM dimproductcategory;

#ESERCIZIO 6
SELECT  S.SalesOrderNumber, S.SalesOrderLineNumber, S.OrderDate, S.ProductKey, P.EnglishProductName,
		P.ProductSubcategoryKey, SC.EnglishProductSubcategoryName, SC.ProductCategoryKey, C. EnglishProductCategoryName,
        S.OrderQuantity, S.UnitPrice, S.TotalProductCost, S.SalesAmount
FROM factresellersales AS S LEFT JOIN dimproduct AS P
	 ON S.ProductKey = P.ProductKey
							LEFT JOIN dimproductsubcategory AS SC
	 ON P.ProductSubcategoryKey = SC.ProductSubcategoryKey
							LEFT JOIN dimproductcategory AS C
     ON SC.ProductCategoryKey = C.ProductCategoryKey;                       

#7. ESPLORA LA TABELLA DIMRESELLER

#DETTAGLIO DI DIM RESELLER
DESCRIBE dimreseller;
#RESELLER KEY - PK / GEOGRAPHY KEY - FK
DESCRIBE dimgeography;
#GEOGRAPHY KEY - PK

#VISUALIZZO I PRODOTTI
SELECT * FROM dimreseller;
SELECT * FROM dimgeography;

#8. ESPONI IN OUTPUT L'ELENCO DEI RESELLER INDICANDO, PER CIASCUN RESELLER, 
#LA SUA AREA GEOGRAFICA

#DETTAGLIO DI DIM RESELLER
DESCRIBE dimreseller;
#RESELLER KEY - PK / GEOGRAPHY KEY - FK
DESCRIBE dimgeography;
#GEOGRAPHY KEY - PK

#VISUALIZZO I PRODOTTI
SELECT * FROM dimreseller;
SELECT * FROM dimgeography;

#ESERCIZIO 8
SELECT  R.ResellerKey, R.GeographyKey, R.BusinessType, R.ResellerName, R.NumberEmployees,
		R.YearOpened, G.City, G.StateProvinceCode, G.StateProvinceName, G.EnglishCountryRegionName
FROM dimreseller as R LEFT JOIN dimgeography AS G
ON R.GeographyKey = G.GeographyKey;

#9. ESPONI L'ELENCO DELLE TRANSAZIONI DI VENDITA. IL RESULT SET DEVE ESPORRE:
#SALESORDERNUMBER, SALESORDERLINENUMBER, ORDERDATE, UNITPRICE, QUANTITY, TOTALPRODUCTCOST
#IL RESULT SET DEVE INDICARE IL NOME DEL PRODOTTO, LA CATEGORIA DEL PRODOTTO, 
#IL NOME DEL RESELLER E L'AREA GEOGRAFICA

#DETTAGLIO DI FACT RESELLER SALES, DIM PRODUCT, DIM PRODUCT SUBCATEGORY, DIM PRODUCT CATEGORY, DIM RESELLER, DIM GEOGRAPHY
DESCRIBE factresellersales;
#SALES ORDER NUMBER - PK / PRODUCT KEY - FK
DESCRIBE dimproduct;
#PRODUCT KEY - PK / PRODUCT SUBCATEGORY KEY - FK
DESCRIBE dimproductsubcategory;
#PRODUCT SUBCATEGORY KEY - PK / PRODUCT CATEGORY KEY - FK
DESCRIBE dimproductcategory;
#PRODUCT CATEGORY KEY - PK
DESCRIBE dimreseller;
#RESELLER KEY - PK / GEOGRAPHY KEY - FK
DESCRIBE dimgeography;
#GEOGRAPHY KEY - PK

#VISUALIZZO I PRODOTTI
SELECT * FROM factresellersales;
SELECT * FROM dimproduct;
SELECT * FROM dimproductsubcategory;
SELECT * FROM dimproductcategory;
SELECT * FROM dimreseller;
SELECT * FROM dimgeography;

#ESERCIZIO 9
SELECT  S.SalesOrderNumber, S.SalesOrderLineNumber, S.OrderDate, P.EnglishProductName, C.EnglishProductCategoryName, 
		S.UnitPrice, S.OrderQuantity, S.TotalProductCost, R.ResellerName, G.EnglishCountryRegionName
FROM factresellersales AS S LEFT JOIN dimproduct AS P
	 ON S.ProductKey = P.ProductKey
							LEFT JOIN dimproductsubcategory AS SC
     ON P.ProductSubcategoryKey = SC.ProductSubcategoryKey
							LEFT JOIN dimproductcategory AS C
     ON SC.ProductCategoryKey = C.ProductCategoryKey   
							LEFT JOIN dimreseller AS R
     ON S.ResellerKey = R.ResellerKey
							LEFT JOIN dimgeography AS G
     ON R.GeographyKey = G.GeographyKey;                       