#1. IMPLEMENTA UNA VISTA DENOMINATA PRODUCT AL FINE DI CREARE UN'ANAGRAFICA PRODOTTO COMPLETA
#LA VISTA DEVE ESPORRE: IL PRODOTTO, LA SOTTOCATEGORIA E LA CATEGORIA

USE adv;

#VISUALIZZO GLI ELEMENTI
SELECT * FROM dimproduct;
#PRODUCTKEY - PK / PRODUCTSUBCATEGORYKEY - FK
SELECT * FROM dimproductsubcategory;
#PRODUCTSUBCATEGORYKEY -PK / PRODUCTCATEGORYKEY - FK
SELECT * FROM dimproductcategory;
#PRODUCTCATEGORYKEY - PK

#ESERCIZIO
CREATE VIEW VIEW_Product AS(
SELECT P.ProductKey AS ProdottoID, P.EnglishProductName AS Prodotto, C.EnglishProductCategoryName AS CategoriaProdotto,
		SC.EnglishProductSubcategoryName AS SottoCategoriaProdotto, P.StandardCost
FROM dimproduct AS P INNER JOIN dimproductsubcategory AS SC
	 ON P.ProductSubcategoryKey = SC.ProductSubcategoryKey
					 INNER JOIN dimproductcategory AS C
	 ON SC.ProductCategoryKey = C.ProductCategoryKey
);

SELECT * FROM PRODUCT;

#2. IMPLEMENTA UNA VISTA DENOMINATA RESELLER AL FINE DI CREARE UN'ANAGRAFICA RESELLER COMPLETA
#LA VISTA DEVE ESPORRE: IL RESELLER, LA CITTA' E LA REGIONE

#DETTAGLIO DI DIMRESELLER
DESCRIBE dimreseller;
#VISUALIZZO GLI ELEMENTI
SELECT * FROM dimreseller;
#RESELLERKEY - PK / GEOGRAPHYKEY - FK

#DETTAGLIO DI DIMGEOGRAPHY
DESCRIBE dimgeography;
#VISUALIZZO GLI ELEMENTI
SELECT * FROM dimgeography;
#GEOGRAPHYKEY - PK

#ESERCIZIO
CREATE VIEW VIEW_Reseller AS(
SELECT  R.ResellerKey AS ResellerID, R.BusinessType AS TipoBusiness, R.ResellerName AS Rivenditore,
		G.City AS Citta, G.EnglishCountryRegionName AS Regione, R.YearOpened AS AnnoApertura
FROM dimreseller AS R INNER JOIN dimgeography AS G
	 ON R.GeographyKey = G.GeographyKey
);

SELECT * FROM VIEW_RESELLER;

#3. CREA UNA VISTA DENOMINATA SALES CHE DEVE RESTITUIRE: LA DATA ORDINE, IL CODICE DOCUMENTO,
#LA RIGA DI CORPO DEL DOCUMENTO, LA QUANTITA' VENDUTA, L'IMPORTO TOTALE E IL PROFITTO

#DETTAGLIO DI FACTRESELLERSALES
DESCRIBE factresellersales;
#VISUALIZZO GLI ELEMENTI
SELECT * FROM factresellersales;
#SALESORDERNUMBER-SALESORDERLINENUMBER - PK / 

#ESERCIZIO
CREATE VIEW VIEW_Sales AS (
SELECT S.OrderDate AS DataOrdine, S.SalesOrderNumber AS CodiceDocumento,
	   S.SalesOrderLineNumber AS RigaDocumento, P.ProductKey AS ProdottoID, 
       P.EnglishProductName AS NomeProdotto, S.OrderQuantity AS QuantitaVenduta, 
       R.ResellerKey AS ResellerID, R.BusinessType AS TipoBusiness, R.ResellerName AS Rivenditore,
       S.SalesAmount AS ImportoTotale, S.SalesAmount - S.TotalProductCost AS Profitto
FROM factresellersales AS S INNER JOIN dimproduct AS P
	 ON P.ProductKey = S.ProductKey	
							INNER JOIN dimreseller AS R
	 ON R.ResellerKey = S.ResellerKey
);       

SELECT * FROM VIEW_SALES;

#4. CREA UN REPORT IN EXCEL CHE CONSENTA AD UN UTENTE DI ANALIZZARE QUANTITA' VENDUTA, IMPORTO TOTALE 
#E PROFITTI PER PRODOTTO/CATEGORIA PRODOTTO E RESELLER/REGIONE
