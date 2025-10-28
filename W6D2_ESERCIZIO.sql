#UTILIZZO DATABASE
USE AdventureWorksDW;
#MOSTRA TABELLE
SHOW TABLES;

#2. ESPLORA LA TABELLA DEI PRODOTTI (DIMPRODUCT)
#VEDO COME E' COMPOSTA LA TABELLA
SELECT * FROM dimproduct;
#VEDO I DATATYPE
DESCRIBE dimproduct;

#3. INTERROGA LA TABELLA PRODOTTI ED ESPONI IN OUTPUT I CAMPI:
#PRODUCT KEY, PRODUCT ALTERNATE KEY, ENGLISH PRODUCT NAME, COLOR, STANDARD COST, FINISHED GOODS FLAG
SELECT   productkey as IDProdotto1, productalternatekey as IDProdotto2, englishproductname as NomeProdotto,
		 color as Colore, standardcost as Prezzo, finishedgoodsflag as Finiti 
FROM dimproduct;

#4. ESPONI IN OUTPUT I SOLI PRODOTTI FINITI
SELECT productkey as IDProdotto1, englishproductname as NomeProdotto, finishedgoodsflag as Finiti 
FROM dimproduct
WHERE finishedgoodsflag=1;

#5. ESPONI IN OUTPUT I PRODOTTI IL CUI CODICE MODELLO (PRODUCT ALTERNATE KEY) COMINCIA CON FR O BR
#RESULT SET: PRODUCT KEY, MODELLO, NOME PRODOTTO, COSTO STANDARD E PREZZO DI LISTINO
SELECT  productkey as IDProdotto, productalternatekey as CodiceModello, modelname as Modello, 
		englishproductname as NomeProdotto, standardcost as CostoStandard, listprice as PrezzoListino
FROM dimproduct
WHERE productalternatekey LIKE "FR%" OR "BK%";

#6. ARRICCHISCI LA QUUERY DEL MARKUP (LISTPRICE - STANDARDCOST)
SELECT  productkey as IDProdotto, productalternatekey as CodiceModello, modelname as Modello, 
		englishproductname as NomeProdotto, standardcost as CostoStandard, listprice as PrezzoListino,
        listprice - standardcost as Markup
FROM dimproduct;

#7. ESPONI L'ELENCO DEI PRODOTTI FINITI IL CUI PREZZO DI LISTINO E' COMPRESO TRA 1000 E 2000
SELECT productkey as IDProdotto, englishproductname as NomeProdotto, listprice as PrezzoListino
FROM dimproduct
WHERE listprice BETWEEN 1000 AND 2000;

#8. ESPLORA LA TABELLA DEGLI IMPIEGATI (DIMEPLOYEE)
SHOW TABLES;
DESCRIBE dimemployee;
SELECT * FROM dimemployee;

#9. ESPONI L'ELENCO DEI SOLI AGENTI, CIOE' DIPENDENTI PER I QUALI IL CAMPO SALESPERSONFLAG=1
SELECT employeekey as IDImpiegato, firstname as Nome, lastname as Cognome, salespersonflag as Agente
FROM dimemployee
WHERE salespersonflag=1;

#10. INTERROGA LA TABELLA VENDITE (FACT RESELLER SALES)
#ESPONI IN OUTPUT L'ELENCO TRANSAZIONI REGISTRATE
#A PARTIRE DAL 1 GENNAIO 2020 DEI SOLI CODICI PRODOTTO: 597, 598, 477, 214
# CALCOLA IL PROFITTO (SALESAMOUNT - TOTALPRODUCT COST)
SELECT * FROM factresellersales;
SELECT  salesordernumber, salesorderlinenumber, orderdate, duedate, shipdate, productkey, resellerkey,
		promotionkey, employeekey, salesterritorykey, orderquantity, unitprice, totalproductcost, salesamount,
        salesamount - totalproductcost as Profit
FROM factresellersales
WHERE orderdate>='2020-01-01' AND productkey IN (597, 598, 477, 214);    