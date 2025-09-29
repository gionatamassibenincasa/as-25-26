CREATE TABLE IF NOT EXISTS Artista (
    idArtista INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    biografia TEXT,
    nazionalita TEXT
);
---
CREATE TABLE IF NOT EXISTS Album (
    idAlbum INTEGER PRIMARY KEY AUTOINCREMENT,
    -- idArtista INTEGER,
    copertina TEXT,
    titolo TEXT NOT NULL,
    dataPubblicazione DATE
    -- FOREIGN KEY (idArtista) REFERENCES Artista(idArtista)
);
---
CREATE TABLE IF NOT EXISTS Brano (
    idBrano INTEGER PRIMARY KEY AUTOINCREMENT,
    idArtista INTEGER,
    idAlbum INTEGER,
    titolo TEXT NOT NULL,
    durataInSec INTEGER,
    dataPubblicazione DATE,
    uri TEXT NOT NULL,
    FOREIGN KEY (idArtista) REFERENCES Artista(idArtista),
    FOREIGN KEY (idAlbum) REFERENCES Album(idAlbum)
);
---
CREATE TABLE IF NOT EXISTS Utente (
    idUtente INTEGER PRIMARY KEY AUTOINCREMENT,
    cognome TEXT NOT NULL,
    nome TEXT NOT NULL,
    dataNascita DATE,
    nazionalita TEXT,
    email TEXT NOT NULL UNIQUE,
    dataScadenza DATE
);
---
CREATE TABLE IF NOT EXISTS Genere (
    idGenere INTEGER PRIMARY KEY AUTOINCREMENT,
    genere TEXT NOT NULL UNIQUE
);
---
CREATE TABLE IF NOT EXISTS Playlist (
    idPlaylist INTEGER PRIMARY KEY AUTOINCREMENT,
    idUtente INTEGER,
    titolo TEXT NOT NULL,
    dataCreazione DATE,
    FOREIGN KEY (idUtente) REFERENCES Utente(idUtente)
);
---
CREATE TABLE IF NOT EXISTS BranoPlaylist (
    idPlaylist INTEGER,
    idBrano INTEGER,
    PRIMARY KEY (idPlaylist, idBrano),
    FOREIGN KEY (idPlaylist) REFERENCES Playlist(idPlaylist),
    FOREIGN KEY (idBrano) REFERENCES Brano(idBrano)
);
---
CREATE TABLE IF NOT EXISTS Ascolto (
    idUtente INTEGER,
    idBrano INTEGER,
    inizio DATETIME,
    "like" BOOLEAN,
    PRIMARY KEY (idUtente, idBrano, inizio),
    FOREIGN KEY (idUtente) REFERENCES Utente(idUtente),
    FOREIGN KEY (idBrano) REFERENCES Brano(idBrano)
);
---
CREATE TABLE IF NOT EXISTS BranoGenere (
    idBrano INTEGER,
    idGenere INTEGER,
    PRIMARY KEY (idBrano, idGenere),
    FOREIGN KEY (idBrano) REFERENCES Brano(idBrano),
    FOREIGN KEY (idGenere) REFERENCES Genere(idGenere)
);
---
-- Dati di test
---
INSERT INTO Artista (nome, biografia, nazionalita) VALUES
('Tananai', 'Biografia di Tananai', 'Italiana'),
('Ultimo', 'Biografia di Ultimo', 'Italiana'),
('Billie Eilish', 'Biografia di Billie Eilish', 'Statunitense'),
('Imagine Dragons', 'Biografia di Imagine Dragons', 'Statunitense'),
('The Weeknd', 'Biografia di The Weeknd', 'Canadese');
---
INSERT INTO Album (copertina, titolo, dataPubblicazione) VALUES
('copertina_album_1.jpg', 'Rave, eclissi', '2022-03-11'),
('copertina_album_2.jpg', 'Colpa delle favole', '2019-04-05'),
('copertina_album_3.jpg', 'Happier Than Ever', '2021-07-30'),
('copertina_album_4.jpg', 'Mercury - Act 1', '2021-09-03');
---
INSERT INTO Brano (idArtista, idAlbum, titolo, durataInSec, dataPubblicazione, uri) VALUES
(1, 1, 'Incontro occasionale', 185, '2022-02-02', 'uri_incontro_occasionale'),
(1, 1, 'Abissale', 215, '2022-10-21', 'uri_abissale'),
(2, 2, 'I tuoi particolari', 219, '2019-02-08', 'uri_i_tuoi_particolari'),
(2, 2, 'Pianeti', 241, '2017-10-06', 'uri_pianeti'),
(3, 3, 'Happier Than Ever', 278, '2021-07-30', 'uri_happier_than_ever'),
(3, 3, 'bad guy', 194, '2019-03-29', 'uri_bad_guy'),
(4, 4, 'Wrecked', 244, '2021-07-02', 'uri_wrecked');
---
INSERT INTO Utente (cognome, nome, dataNascita, nazionalita, email, dataScadenza) VALUES
('Rossi', 'Mario', '1998-05-15', 'Italiana', 'mario.rossi@example.com', '2026-09-24'),
('Bianchi', 'Giulia', '2001-11-20', 'Italiana', 'giulia.bianchi@example.com', '2026-09-24'),
('Smith', 'John', '1995-03-10', 'Statunitense', 'john.smith@example.com', '2026-09-24');
---
INSERT INTO Genere (genere) VALUES
('Pop'),
('Indie Pop'),
('Rock'),
('Elettronica');
---
INSERT INTO Playlist (idUtente, titolo, dataCreazione) VALUES
(1, 'I miei preferiti', '2025-09-20'),
(1, 'Relax', '2025-09-18'),
(2, 'Indie Italia', '2025-09-21');
---
INSERT INTO BranoPlaylist (idPlaylist, idBrano) VALUES
(1, 1),
(1, 3),
(1, 5),
(2, 2),
(3, 1),
(3, 4);
---
INSERT INTO Ascolto (idUtente, idBrano, inizio, "like") VALUES
(1, 1, '2025-09-23 10:00:00', 1),
(1, 3, '2025-09-23 10:05:00', 1),
(1, 1, '2025-09-23 11:00:00', 0),
(2, 4, '2025-09-23 12:00:00', 1),
(3, 5, '2025-09-23 13:00:00', 1),
(3, 6, '2025-09-23 14:00:00', 1);
---
INSERT INTO BranoGenere (idBrano, idGenere) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(5, 4),
(6, 1),
(7, 3);


CREATE VIEW Q1_elenco_brani_playlist AS
SELECT B.titolo
FROM
	Brano AS B INNER JOIN
	BranoPlaylist AS BPL USING (idBrano) INNER JOIN
	Playlist AS PL USING (idPlaylist) INNER JOIN
	Utente AS U USING (idUtente)
WHERE
	cognome = 'Rossi' AND
	nome = 'Mario' AND
	PL.titolo = 'I miei preferiti';

CREATE VIEW Q2_elenco_brani_per_genere AS
SELECT titolo, nome
FROM
	Genere AS G INNER JOIN
	BranoGenere AS BG USING (idGenere) INNER JOIN
	Brano AS B USING (idBrano) INNER JOIN
	Artista AS A USING (idArtista)
WHERE
	genere = 'Pop' AND
	substr(dataPubblicazione, 1, 4) == substr(date(), 1, 4);

CREATE VIEW Q3_numero_ascolti AS
SELECT count(A.idBrano) AS nAscoltiMensili
FROM
	Ascolto AS A INNER JOIN
	Brano AS B USING (idBrano)
WHERE titolo = 'Incontro occasionale' AND
	substr(inizio,1,7) LIKE substr(date(), 1, 7)
GROUP BY A.idBrano;
