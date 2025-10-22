/*
 Numero di iniziative sociali
 promosse negli ultimi due anni,
 raggruppate per settore di attività delle aziende
*/
SELECT
    settore,
    COUNT(I.id) AS numeroIniziative
FROM
    Iniziativa AS I INNER JOIN
    Azienda A ON I.partitaIVA = A.partitaIVA INNER JOIN
    Settore S ON A.idSettore = S.id
WHERE
    I.dataAvvio >= strftime('%Y-%m-%d', 'now', '-2 years') -- Ultimi due anni (dalla data corrente)
GROUP BY
    S.settore;
