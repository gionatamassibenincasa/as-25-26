-- Dati di base
INSERT INTO RagioneSociale (sigla, nome) VALUES
('SRL', 'Società a Responsabilità Limitata'),
('SPA', 'Società Per Azioni'),
('SAS', 'Società in Accomandita Semplice');

INSERT INTO Settore (settore) VALUES
('Manifatturiero'),
('Servizi'),
('Commercio');

INSERT INTO Provincia (sigla, capoluogo) VALUES
('MI', 'Milano'),
('RM', 'Roma'),
('FI', 'Firenze');

-- Indicatori
INSERT INTO Indicatore (nome, descrizione, unitaMisura) VALUES
('Carbon Footprint', 'Emissioni di CO2', 'tonnellate'), -- id 1
('Water Footprint', 'Consumo idrico', 'metri cubi'),   -- id 2
('LCA', 'Percentuale di rifiuti riciclabili', 'percentuale'); -- id 3

-- Aziende
INSERT INTO Azienda (partitaIVA, denominazione, siglaRagioneSociale, idSettore, siglaProvincia) VALUES
('01234567890', 'MetalCostrutt S.R.L.', 'SRL', 1, 'MI'), -- Manifatturiero MI
('11223344556', 'EcoTech S.P.A.', 'SPA', 1, 'MI'),       -- Manifatturiero MI
('98765432109', 'ServiziGlobali S.A.S.', 'SAS', 2, 'RM'), -- Servizi RM
('55544433322', 'CommercialeEst S.P.A.', 'SPA', 3, 'FI'); -- Commercio FI

-- Misurazioni (Carbon Footprint - id 1)
-- Azienda '01234567890' (Manifatturiero) - Rilevazioni nell'ultimo anno e prima
INSERT INTO Misurazione (partitaIVA, idIndicatore, marcaTemporale, valore) VALUES
('01234567890', 1, '2025-04-01', 50.5), -- Ultimo Anno
('01234567890', 1, '2024-10-01', 60.0), -- Ultimo Anno (valore > 55)
('01234567890', 1, '2024-04-01', 52.0); -- Prima dell'ultimo anno

-- Azienda '11223344556' (Manifatturiero) - Rilevazioni nell'ultimo anno
INSERT INTO Misurazione (partitaIVA, idIndicatore, marcaTemporale, valore) VALUES
('11223344556', 1, '2025-04-01', 45.0), -- Ultimo Anno (valore < 55) -> Deve essere selezionata
('11223344556', 1, '2024-10-01', 48.0); -- Ultimo Anno (valore < 55) -> Deve essere selezionata

-- Azienda '98765432109' (Servizi)
INSERT INTO Misurazione (partitaIVA, idIndicatore, marcaTemporale, valore) VALUES
('98765432109', 1, '2025-04-01', 10.0);

-- Iniziative Sociali
-- Azienda '01234567890' (Ultimi due anni)
INSERT INTO Iniziativa (partitaIVA, nomeProgetto, dataAvvio, durata) VALUES
('01234567890', 'Formazione Inclusiva', '2024-01-15', 180), -- Manifatturiero - Ultimi 2 anni
('01234567890', 'Supporto Comunità Locale', '2023-01-01', 365); -- Manifatturiero - Ultimi 2 anni

-- Azienda '98765432109' (Prima degli ultimi due anni)
INSERT INTO Iniziativa (partitaIVA, nomeProgetto, dataAvvio, durata) VALUES
('98765432109', 'Parità di Genere', '2022-06-01', 90); -- Servizi - Fuori dai 2 anni

-- Azienda '55544433322' (Ultimi due anni)
INSERT INTO Iniziativa (partitaIVA, nomeProgetto, dataAvvio, durata) VALUES
('55544433322', 'Sicurezza sul Lavoro', '2025-01-01', 30); -- Commercio - Ultimi 2 anni

-- Sanzioni Ambientali
-- Azienda '01234567890'
INSERT INTO Sanzione (partitaIVA, importo, data, descrizioneViolazione) VALUES
('01234567890', 15000.00, '2025-03-10', 'Scarico non autorizzato'), -- Sanzione recente (deve essere selezionata, importo alto)
('01234567890', 8000.00, '2021-12-01', 'Smaltimento non corretto'); -- Sanzione vecchia (fuori dai 5 anni)

-- Azienda '11223344556'
INSERT INTO Sanzione (partitaIVA, importo, data, descrizioneViolazione) VALUES
('11223344556', 5000.00, '2023-05-20', 'Superamento limiti emissioni CO2'); -- Sanzione (deve essere selezionata, importo basso)

-- Azienda '98765432109'
INSERT INTO Sanzione (partitaIVA, importo, data, descrizioneViolazione) VALUES
('98765432109', 12000.00, '2022-10-05', 'Violazione norme idriche'); -- Sanzione (deve essere selezionata, importo medio)
