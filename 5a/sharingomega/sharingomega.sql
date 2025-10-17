-- ******************************************************
-- SEZIONE 1: CREAZIONE DELLE TABELLE (CREATE TABLE)
-- ******************************************************

-- 1. Anagrafica: Contiene i dati personali/aziendali comuni a Gestori e Produttori
CREATE TABLE Anagrafica (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cognome TEXT,
    denominazione TEXT,
    luogoNascita TEXT,
    dataNascita DATE,
    CodiceFiscale TEXT UNIQUE,
    PartitaIVA TEXT UNIQUE,
    comune TEXT,
    indirizzo TEXT,
    civico TEXT,
    email TEXT UNIQUE NOT NULL,
    pec TEXT,
    telefono TEXT
);

-- 2. Gestore: Dati specifici del ruolo di Gestore (Superclasse/Sottoclasse per Anagrafica)
CREATE TABLE Gestore (
    idAnagrafica INTEGER PRIMARY KEY,
    scadenzaContratto DATE NOT NULL,
    FOREIGN KEY (idAnagrafica) REFERENCES Anagrafica(id)
);

-- 3. Produttore: Dati specifici del ruolo di Produttore (Superclasse/Sottoclasse per Anagrafica)
CREATE TABLE Produttore (
    idAnagrafica INTEGER PRIMARY KEY,
    scadenzaContratto DATE NOT NULL,
    FOREIGN KEY (idAnagrafica) REFERENCES Anagrafica(id)
);

-- 4. Prodotto: I prodotti offerti dai Produttori
CREATE TABLE Prodotto (
    id INTEGER PRIMARY KEY,
    idProduttore INTEGER NOT NULL,
    descrizione TEXT NOT NULL,
    FOREIGN KEY (idProduttore) REFERENCES Produttore(idAnagrafica)
);

-- 5. Negozio: I negozi fisici gestiti dai Gestori
CREATE TABLE Negozio (
    id INTEGER PRIMARY KEY,
    idGestore INTEGER NOT NULL, -- Aggiunta FK basata sulla relazione Gestore 1:N Negozio
    comune TEXT NOT NULL,
    indirizzo TEXT NOT NULL,
    civico TEXT,
    FOREIGN KEY (idGestore) REFERENCES Gestore(idAnagrafica)
);

-- 6. CategoriaMerceologica: Le categorie di prodotti vendute
CREATE TABLE CategoriaMerceologica (
    id INTEGER PRIMARY KEY,
    categoria TEXT UNIQUE NOT NULL
);

-- 7. Modalita: Le modalità di utilizzo dello spazio (Es. 'Esposizione e Vendita')
CREATE TABLE Modalita (
    id INTEGER PRIMARY KEY,
    modalita TEXT UNIQUE NOT NULL
);

-- 8. SpazioEspositivo: Gli spazi offerti all'interno dei negozi
CREATE TABLE SpazioEspositivo (
    id INTEGER PRIMARY KEY,
    idNegozio INTEGER NOT NULL,
    idModalita INTEGER NOT NULL,
    denominazione TEXT NOT NULL,
    locale TEXT,
    descrizione TEXT,
    condizioni TEXT,
    estensioneInMetri2 REAL NOT NULL,
    costoGiornaliero REAL NOT NULL,
    FOREIGN KEY (idNegozio) REFERENCES Negozio(id),
    FOREIGN KEY (idModalita) REFERENCES Modalita(id)
);

-- 9. NegozioCategoria: Associazione N:M tra Negozio e CategoriaMerceologica
CREATE TABLE NegozioCategoria (
    idNegozio INTEGER NOT NULL,
    idCategoria INTEGER NOT NULL,
    PRIMARY KEY (idNegozio, idCategoria),
    FOREIGN KEY (idNegozio) REFERENCES Negozio(id),
    FOREIGN KEY (idCategoria) REFERENCES CategoriaMerceologica(id)
);

-- 10. Calendario: Il calendario per un dato Spazio Espositivo
CREATE TABLE Calendario (
    id INTEGER PRIMARY KEY,
    idSpazioEspositivo INTEGER NOT NULL,
    nome TEXT,
    organizzatore TEXT,
    descrizione TEXT,
    FOREIGN KEY (idSpazioEspositivo) REFERENCES SpazioEspositivo(id)
);

-- 11. Evento: L'occupazione specifica di uno spazio da parte di un Prodotto (e quindi un Produttore)
CREATE TABLE Evento (
    id INTEGER PRIMARY KEY,
    idCalendario INTEGER NOT NULL,
    idProdotto INTEGER, -- Può essere NULL se l'evento è un blocco/manutenzione generica
    titolo TEXT,
    descrizione TEXT,
    inizio DATETIME NOT NULL,
    fine DATETIME NOT NULL,
    luogo TEXT,
    stato TEXT, -- Es. 'Prenotato', 'Occupato', 'Terminato'
    FOREIGN KEY (idCalendario) REFERENCES Calendario(id),
    FOREIGN KEY (idProdotto) REFERENCES Prodotto(id)
);


-- ******************************************************
-- SEZIONE 2: POPOLAMENTO DELLE TABELLE (INSERT INTO)
-- ******************************************************

-- 1. Anagrafica (ID 1-2 per Gestori, ID 3-4 per Produttori)
INSERT INTO Anagrafica (id, nome, cognome, denominazione, CodiceFiscale, email) VALUES
(1, 'Marco', 'Rossi', 'Rossi Abbigliamento', 'MRCRSS70A01F205F', 'marco.rossi@gestore.it'),
(2, 'Laura', 'Bianchi', 'Bianchi Fiori', 'LRABNC85B41A001G', 'laura.bianchi@gestore.it'),
(3, 'Luca', 'Verdi', 'Artigiano Legno', 'LCVRD90C01A001H', 'luca.verdi@produttore.it'),
(4, 'Anna', 'Neri', 'Neri Bomboniere', 'ANNNRE75D01I001J', 'anna.neri@produttore.it');

-- 2. Gestore
INSERT INTO Gestore (idAnagrafica, scadenzaContratto) VALUES
(1, '2026-03-31'),
(2, '2026-06-30');

-- 3. Produttore
INSERT INTO Produttore (idAnagrafica, scadenzaContratto) VALUES
(3, '2025-12-31'),
(4, '2026-01-15');

-- 4. Prodotto (Produttore 3: Legno; Produttore 4: Bomboniere)
INSERT INTO Prodotto (id, idProduttore, descrizione) VALUES
(101, 3, 'Scultura in legno piccola'),
(102, 3, 'Tavolino artigianale'),
(103, 4, 'Bomboniera classica confetti'),
(104, 4, 'Vasetto decorativo bomboniera');

-- 5. Modalita
INSERT INTO Modalita (id, modalita) VALUES
(1, 'Esposizione e Vendita'),
(2, 'Solo Esposizione');

-- 6. Negozio (Gestore 1: Abbigliamento; Gestore 2: Fiori)
INSERT INTO Negozio (id, idGestore, comune, indirizzo, civico) VALUES
(201, 1, 'Milano', 'Corso Vittorio Emanuele', '10'),
(202, 2, 'Roma', 'Via del Corso', '50');

-- 7. CategoriaMerceologica
INSERT INTO CategoriaMerceologica (id, categoria) VALUES
(301, 'Abbigliamento'),
(302, 'Artigianato'),
(303, 'Bomboniere'),
(304, 'Fiori e Addobbi');

-- 8. NegozioCategoria (Negozio 201 vende Abbigliamento; Negozio 202 vende Fiori)
INSERT INTO NegozioCategoria (idNegozio, idCategoria) VALUES
(201, 301), -- Negozio Abbigliamento
(202, 304); -- Negozio Fiori

-- 9. SpazioEspositivo (Spazi nel Negozio 201 (Abbigliamento) e 202 (Fiori))
INSERT INTO SpazioEspositivo (id, idNegozio, idModalita, denominazione, estensioneInMetri2, costoGiornaliero) VALUES
(401, 201, 1, 'Vetrine Principali', 5.0, 50.00),   -- Negozio Abbigliamento (Esposizione e Vendita)
(402, 201, 2, 'Scaffale Lato', 1.5, 20.00),      -- Negozio Abbigliamento (Solo Esposizione)
(403, 202, 1, 'Gazebo Interno', 10.0, 45.00);  -- Negozio Fiori (Esposizione e Vendita)

-- 10. Calendario (Un calendario per ogni spazio)
INSERT INTO Calendario (id, idSpazioEspositivo, nome) VALUES
(501, 401, 'Calendario Vetrine'),
(502, 402, 'Calendario Scaffale'),
(503, 403, 'Calendario Gazebo');

-- 11. Evento (Occupazioni specifiche)
INSERT INTO Evento (id, idCalendario, idProdotto, titolo, inizio, fine, stato) VALUES
-- Occupazione di Spazio 401 (Vetrine) con Prodotto 101 (Scultura)
(601, 501, 101, 'Esposizione Sculture Legno', '2025-10-20 00:00:00', '2025-10-22 23:59:59', 'Occupato'),
-- Occupazione di Spazio 403 (Gazebo) con Prodotto 103 (Bomboniera)
(602, 503, 103, 'Stand Bomboniere Neri', '2025-11-05 00:00:00', '2025-11-05 23:59:59', 'Prenotato');
