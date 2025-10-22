/*
 Elenco delle aziende **manifatturiere**
 con emissioni di $CO_{2}$ minori di un dato valore
 nell'ultimo anno.

 Si assume che il dato valore sia 51.0 tonnellate
 e che l'ultimo anno sia il periodo tra un anno fa e oggi.
*/
SELECT
    A.denominazione,
    marcaTemporale,
    valore,
    unitaMisura,
    I.nome
FROM
    Settore AS S INNER JOIN
    Azienda AS A ON S.id=A.idSettore INNER JOIN
    Misurazione AS M USING (partitaIVA) INNER JOIN
    Indicatore AS I ON M.idIndicatore=I.id
 WHERE
    settore = 'Manifatturiero'
    AND I.nome='Carbon Footprint'
    AND M.marcaTemporale >= strftime('%Y-%m-%d', 'now', '-1 year') -- ultimo anno (dalla data corrente)
    AND valore < 51;
