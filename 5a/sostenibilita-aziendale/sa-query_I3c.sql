/*
 Elenco delle aziende che hanno ricevuto sanzioni ambientali
 negli ultimi 5 anni,
 ordinate in modo decrescente per importo delle sanzioni ricevute
*/
SELECT
    A.denominazione,
    A.partitaIVA,
    S.data AS dataSanzione,
    S.importo
FROM
    Azienda AS A INNER JOIN
    Sanzione S USING (partitaIVA)
WHERE
    S.data >= strftime('%Y-%m-%d', 'now', '-5 years') -- Ultimi 5 anni (dalla data corrente)
ORDER BY
    S.importo DESC;
