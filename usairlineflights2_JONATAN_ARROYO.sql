SELECT * FROM usairlineflights2.flights;

/*1.Quantitat de registres a la taula de vols*/
SELECT COUNT(*) FROM flights;/*2972*/

/*2. Retard promig de sortida i arribada segons l’aeroport origen.*/
SELECT Origin, AVG(ArrDelay), AVG(DepDelay) FROM flights GROUP BY Origin;

/*3. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen. A més,
volen que els resultat es mostrin de la següent forma: " LAX, 2000, 01, retard"*/
SELECT Origin, colYear, colMonth,  AVG(ArrDelay) FROM flights GROUP BY colMonth, Origin, colYear ORDER BY Origin, colYear, colMonth;

/* 4. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa
consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes
del codi de l’aeroport es mostri el nom de la ciutat.
Los Angeles, 2000, 01, retard
Los Angeles, 2000, 02, retard*/
SELECT city,Origin,colYear,colMonth,AVG(flights.ArrDelay) AS delay FROM usairlineflights2.flights
INNER JOIN  usairlineflights2.usairports  ON flights.Origin=usairports.IATA
group by colMonth,colYear,Origin;

/*5. Les companyies amb més vols cancelats. A més, han d’estar ordenades de forma
que les companyies amb més cancelacions apareguin les primeres.*/
SELECT UniqueCarrier, COUNT(Cancelled) AS totalCancelled FROM usairlineflights2.flights WHERE Cancelled=true
GROUP BY UniqueCarrier ORDER BY totalCancelled DESC;

/*6. L’identificador dels 10 avions que més distància han recorregut fent vols.*/
SELECT TailNum, sum(Distance) as TotDistance FROM usairlineflights2.flights GROUP BY TailNum
ORDER BY TotDistance DESC LIMIT 10;

/*7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols
arriben al seu destí amb un retràs promig major de 10 minuts.*/
SELECT UniqueCarrier, AVG(ArrDelay) AS delay FROM usairlineflights2.flights 
GROUP BY UniqueCarrier HAVING delay>10;


