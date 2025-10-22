-- Impostazione per chiavi esterne in SQLite
PRAGMA foreign_keys = ON;

-- Tabella RagioneSociale (ipotizzata come forma giuridica)
CREATE TABLE RagioneSociale (
    sigla TEXT PRIMARY KEY NOT NULL, -- Es: SPA, SRL, SNC
    nome TEXT NOT NULL
);

-- Tabella Settore
CREATE TABLE Settore (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    settore TEXT NOT NULL UNIQUE -- Es: Manifatturiero, Servizi, Commercio
);

-- Tabella Provincia
CREATE TABLE Provincia (
    sigla TEXT PRIMARY KEY NOT NULL, -- Es: RM, MI, AN
    capoluogo TEXT NOT NULL
);

-- Tabella Azienda
CREATE TABLE Azienda (
    partitaIVA TEXT PRIMARY KEY NOT NULL,
    denominazione TEXT NOT NULL,
    siglaRagioneSociale TEXT NOT NULL,
    idSettore INTEGER NOT NULL,
    siglaProvincia TEXT NOT NULL,
    FOREIGN KEY (siglaRagioneSociale) REFERENCES RagioneSociale(sigla),
    FOREIGN KEY (idSettore) REFERENCES Settore(id),
    FOREIGN KEY (siglaProvincia) REFERENCES Provincia(sigla)
);

-- Tabella Indicatore (i tre parametri base)
CREATE TABLE Indicatore (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE, -- Carbon Footprint, Water Footprint, LCA
    descrizione TEXT,
    unitaMisura TEXT NOT NULL -- tonnellate, metri cubi, percentuale
);

-- Tabella Misurazione (valori rilevati ogni sei mesi)
CREATE TABLE Misurazione (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    partitaIVA TEXT NOT NULL,
    idIndicatore INTEGER NOT NULL,
    marcaTemporale DATE NOT NULL,
    valore REAL NOT NULL,
    FOREIGN KEY (partitaIVA) REFERENCES Azienda(partitaIVA),
    FOREIGN KEY (idIndicatore) REFERENCES Indicatore(id),
    UNIQUE (partitaIVA, idIndicatore, marcaTemporale) -- Una misurazione per indicatore per azienda in un dato momento
);

-- Tabella Iniziativa (azioni sociali)
CREATE TABLE Iniziativa (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    partitaIVA TEXT NOT NULL,
    nomeProgetto TEXT NOT NULL,
    descrizione TEXT,
    dataAvvio DATE NOT NULL,
    durata INTEGER, -- Durata in giorni (ipotesi aggiuntiva)
    FOREIGN KEY (partitaIVA) REFERENCES Azienda(partitaIVA)
);

-- Tabella Sanzione (sanzioni ambientali)
CREATE TABLE Sanzione (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    partitaIVA TEXT NOT NULL,
    importo REAL NOT NULL,
    data DATE NOT NULL,
    descrizioneViolazione TEXT NOT NULL,
    FOREIGN KEY (partitaIVA) REFERENCES Azienda(partitaIVA)
);
