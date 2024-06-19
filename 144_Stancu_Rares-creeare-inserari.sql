CREATE TABLE Utilizator (
    id_utilizator INT PRIMARY KEY,
    nume VARCHAR(40) NOT NULL,
    email VARCHAR(100) NOT NULL,
    parola VARCHAR(100) NOT NULL CHECK (LENGTH(parola) >= 1),
    data_inregistrare DATE NOT NULL
);

CREATE TABLE Postari (
    id_postari INT PRIMARY KEY,
    id_utilizator INT,
    data_postarii DATE NOT NULL,
    FOREIGN KEY (id_utilizator) REFERENCES Utilizator(id_utilizator)
);

CREATE TABLE Video (
    id_video INT PRIMARY KEY,
    id_postari INT,
    titlu VARCHAR(255) NOT NULL,
    durata INT NOT NULL CHECK (durata > 0),
    data_upload DATE NOT NULL,
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_postari) REFERENCES Postari(id_postari)
);

CREATE TABLE "LIKE" (
    id_like INT PRIMARY KEY,
    id_utilizator INT,
    id_postari INT,
    data_like DATE NOT NULL,
    FOREIGN KEY (id_utilizator) REFERENCES Utilizator(id_utilizator),
    FOREIGN KEY (id_postari) REFERENCES Postari(id_postari)
);

CREATE TABLE Comentarii (
    id_comentarii INT PRIMARY KEY,
    id_utilizator INT,
    id_postari INT,
    data_comentariu DATE NOT NULL,
    continut VARCHAR(255) NOT NULL CHECK (LENGTH(continut) >= 1),
    FOREIGN KEY (id_utilizator) REFERENCES Utilizator(id_utilizator),
    FOREIGN KEY (id_postari) REFERENCES Postari(id_postari)
);

CREATE TABLE Reactie (
    id_reactie INT PRIMARY KEY,
    id_postari INT,
    tip_reactie VARCHAR(25) NOT NULL CHECK (LENGTH(tip_reactie) >= 1),
    data_reactie DATE NOT NULL,
    FOREIGN KEY (id_postari) REFERENCES Postari(id_postari)
);

CREATE TABLE Tag (
    id_tag INT PRIMARY KEY,
    id_postari INT,
    nume_tag VARCHAR(100) NOT NULL CHECK (LENGTH(nume_tag) >= 1),
    FOREIGN KEY (id_postari) REFERENCES Postari(id_postari)
);

CREATE TABLE Follow (
    id_follow INT PRIMARY KEY,
    id_utilizator INT,
    data_follow DATE NOT NULL,
    FOREIGN KEY (id_utilizator) REFERENCES Utilizator(id_utilizator)
);

CREATE TABLE Poze (
    id_poze INT PRIMARY KEY,
    id_postari INT,
    nume_poze VARCHAR(100) NOT NULL CHECK (LENGTH(nume_poze) >= 1),
    data_upload DATE NOT NULL,
    FOREIGN KEY (id_postari) REFERENCES Postari(id_postari)
);

CREATE TABLE Grup (
    id_grup INT PRIMARY KEY,
    nume VARCHAR(100) NOT NULL
);
CREATE TABLE Membru_Grup (
    id_membru_grup INT PRIMARY KEY,
    id_grup INT,
    id_utilizator INT,
    data_intrare DATE NOT NULL,
    FOREIGN KEY (id_grup) REFERENCES Grup(id_grup),
    FOREIGN KEY (id_utilizator) REFERENCES Utilizator(id_utilizator)
);

CREATE TABLE Eveniment (
    id_eveniment INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    data_eveniment DATE NOT NULL
);

CREATE TABLE Participant_Eveniment (
    id_participant_eveniment INT PRIMARY KEY,
    id_utilizator INT,
    id_eveniment INT,
    data_inregistrare DATE NOT NULL,
    FOREIGN KEY (id_utilizator) REFERENCES Utilizator(id_utilizator),
    FOREIGN KEY (id_eveniment) REFERENCES Eveniment(id_eveniment)
);

CREATE TABLE Mesaj (
    id_mesaj INT PRIMARY KEY,
    id_utilizator_sender INT,
    id_utilizator_receiver INT,
    continut VARCHAR(500) NOT NULL,
    data_trimitere DATE NOT NULL,
    FOREIGN KEY (id_utilizator_sender) REFERENCES Utilizator(id_utilizator),
    FOREIGN KEY (id_utilizator_receiver) REFERENCES Utilizator(id_utilizator)
);

CREATE SEQUENCE seq_utilizator START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_postari START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_video START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_like START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_comentarii START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_reactie START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tag START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_follow START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_poze START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_grup START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_membru_grup START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_eveniment START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_participant_eveniment START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_mesaj START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_utilizator
BEFORE INSERT ON Utilizator
FOR EACH ROW
BEGIN
    SELECT seq_utilizator.NEXTVAL INTO :NEW.id_utilizator FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_postari
BEFORE INSERT ON Postari
FOR EACH ROW
BEGIN
    SELECT seq_postari.NEXTVAL INTO :NEW.id_postari FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_video
BEFORE INSERT ON Video
FOR EACH ROW
BEGIN
    SELECT seq_video.NEXTVAL INTO :NEW.id_video FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_like
BEFORE INSERT ON "LIKE"
FOR EACH ROW
BEGIN
    SELECT seq_like.NEXTVAL INTO :NEW.id_like FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_comentarii
BEFORE INSERT ON Comentarii
FOR EACH ROW
BEGIN
    SELECT seq_comentarii.NEXTVAL INTO :NEW.id_comentarii FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_reactie
BEFORE INSERT ON Reactie
FOR EACH ROW
BEGIN
    SELECT seq_reactie.NEXTVAL INTO :NEW.id_reactie FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_tag
BEFORE INSERT ON Tag
FOR EACH ROW
BEGIN
    SELECT seq_tag.NEXTVAL INTO :NEW.id_tag FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_follow
BEFORE INSERT ON Follow
FOR EACH ROW
BEGIN
    SELECT seq_follow.NEXTVAL INTO :NEW.id_follow FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_poze
BEFORE INSERT ON Poze
FOR EACH ROW
BEGIN
    SELECT seq_poze.NEXTVAL INTO :NEW.id_poze FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_grup
BEFORE INSERT ON Grup
FOR EACH ROW
BEGIN
    SELECT seq_grup.NEXTVAL INTO :NEW.id_grup FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_membru_grup
BEFORE INSERT ON Membru_Grup
FOR EACH ROW
BEGIN
    SELECT seq_membru_grup.NEXTVAL INTO :NEW.id_membru_grup FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_eveniment
BEFORE INSERT ON Eveniment
FOR EACH ROW
BEGIN
    SELECT seq_eveniment.NEXTVAL INTO :NEW.id_eveniment FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_participant_eveniment
BEFORE INSERT ON Participant_Eveniment
FOR EACH ROW
BEGIN
    SELECT seq_participant_eveniment.NEXTVAL INTO :NEW.id_participant_eveniment FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_mesaj
BEFORE INSERT ON Mesaj
FOR EACH ROW
BEGIN
    SELECT seq_mesaj.NEXTVAL INTO :NEW.id_mesaj FROM dual;
END;

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (1, 2, 'Salut! Ce mai faci?', DATE '2024-10-12  ');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (2, 3, 'Vrei să mergem la film?', DATE '2024-10-14');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (3, 4, 'Am o întrebare despre proiect.', DATE '2024-01-16');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (4, 5, 'Ne vedem mâine?', DATE '2024-05-26');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (5, 6, 'Cum a fost vacanța?', DATE '2022-03-15');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (6, 7, 'Ce ai mai făcut?', DATE '2024-02-04');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (7, 8, 'Ai terminat raportul?', DATE '2023-09-17');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (8, 9, 'Mergem la concert?', DATE '2024-02-18');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (9, 10, 'Ce părere ai despre film?', DATE '2023-07-21');

INSERT INTO Mesaj (id_utilizator_sender, id_utilizator_receiver, continut, data_trimitere)
VALUES (10, 1, 'Vrei să ieșim în weekend?', DATE '2023-11-27');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (1, 1, DATE '2024-10-11');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (2, 2, DATE '2024-10-13');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (3, 3, DATE '2024-01-15');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (4, 4, DATE '2024-05-26');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (5, 5, DATE '2022-03-14');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (6, 6, DATE '2024-02-03');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (7, 7, DATE '2023-09-16');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (8, 8, DATE '2024-02-17');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (9, 9, DATE '2023-07-20');

INSERT INTO Participant_Eveniment (id_utilizator, id_eveniment, data_inregistrare)
VALUES (10, 10, DATE '2023-11-26');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Festival Muzical', DATE '2024-12-11');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Hackathon', DATE '2024-12-01');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Expoziție de Artă', DATE '2024-03-15');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Maraton', DATE '2024-09-26');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Festival de Film', DATE '2022-06-11');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Competiție de gaming', DATE '2024-12-04');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Curs de Gătit', DATE '2023-10-16');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Noaptea Muzeelor', DATE '2024-05-17');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Concurs Fitness', DATE '2023-07-21');

INSERT INTO Eveniment (nume, data_eveniment)
VALUES ('Campionat de Șah', DATE '2023-12-26');


INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (1, 1, DATE '2024-10-11');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (2, 2, DATE '2024-10-13');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (3, 3, DATE '2024-01-15');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (4, 4, DATE '2024-05-26');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (5, 5, DATE '2022-03-14');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (6, 6, DATE '2024-02-03');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (7, 7, DATE '2023-09-16');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (8, 8, DATE '2024-02-17');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (9, 9, DATE '2023-07-20');

INSERT INTO Membru_Grup (id_grup, id_utilizator, data_intrare)
VALUES (10, 10, DATE '2023-11-26');

INSERT INTO Grup (nume)
VALUES ('Grup de prieteni');

INSERT INTO Grup (nume)
VALUES ('Grup de programatori');

INSERT INTO Grup (nume)
VALUES ('Grup de muzicieni');

INSERT INTO Grup (nume)
VALUES ('Grup de bucătari');

INSERT INTO Grup (nume)
VALUES ('Grup de naturaliști');

INSERT INTO Grup (nume)
VALUES ('Grup de sportivi');

INSERT INTO Grup (nume)
VALUES ('Grup de călători');

INSERT INTO Grup (nume)
VALUES ('Grup de marketeri');

INSERT INTO Grup (nume)
VALUES ('Grup de jurnaliști');

INSERT INTO Grup (nume)
VALUES ('Grup de vlogeri');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (1, 'vacanta.jpg', DATE '2024-10-11');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (2, 'tutorial.jpg', DATE '2024-10-13');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (3, 'concert.jpg', DATE '2024-01-15');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (4, 'reteta.jpg', DATE '2024-05-26');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (5, 'documentar.jpg', DATE '2022-03-14');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (6, 'exercitii.jpg', DATE '2024-02-03');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (7, 'ghid.jpg', DATE '2023-09-16');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (8, 'prezentare.jpg', DATE '2024-02-17');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (9, 'interviu.jpg', DATE '2023-07-20');

INSERT INTO Poze (id_postari, nume_poze, data_upload)
VALUES (10, 'vlog.jpg', DATE '2023-11-26');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (1, DATE '2024-10-11');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (2, DATE '2024-10-13');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (3, DATE '2024-01-15');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (4, DATE '2024-05-26');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (5, DATE '2022-03-14');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (6, DATE '2024-02-03');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (7, DATE '2023-09-16');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (8, DATE '2024-02-17');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (9, DATE '2023-07-20');

INSERT INTO Follow (id_utilizator, data_follow)
VALUES (10, DATE '2023-11-26');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (1, 'vacanță');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (2, 'programare');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (3, 'muzică');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (4, 'bucătărie');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (5, 'natură');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (6, 'fitness');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (7, 'călătorii');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (8, 'produs');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (9, 'interviu');

INSERT INTO Tag (id_postari, nume_tag)
VALUES (10, 'vlog');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (1, 'Love', DATE '2024-10-11');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (2, 'Wow', DATE '2024-10-13');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (3, 'Like', DATE '2024-01-15');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (4, 'Haha', DATE '2024-05-26');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (5, 'Sad', DATE '2022-03-14');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (6, 'Angry', DATE '2024-02-03');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (7, 'Haha', DATE '2023-09-16');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (8, 'Wow', DATE '2024-02-17');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (9, 'Like', DATE '2023-11-26');

INSERT INTO Reactie (id_postari, tip_reactie, data_reactie)
VALUES (10, 'Haha', DATE '2023-02-28');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (1, 1, DATE '2024-10-11', 'Frumos video!');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (2, 2, DATE '2024-10-13', 'Foarte util tutorialul!');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (3, 3, DATE '2024-01-15', 'Excelent Concert!!');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (4, 4, DATE '2024-05-26', 'Foarte Buna reteta');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (5, 5, DATE '2022-03-14', 'Foarte interesant documentar-ul.');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (6, 6, DATE '2024-02-03', 'Exercitiile au fost foarte eficiente');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (7, 7, DATE '2023-09-16', 'Foarte Util');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (8, 8, DATE '2024-02-17', 'Foarte bine facut!');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (9, 9, DATE '2023-07-20', 'Foarte interesant interviul.');

INSERT INTO Comentarii (id_utilizator, id_postari, data_comentariu, continut)
VALUES (10, 10, DATE '2023-11-26', 'Îmi place vlog-ul tău!');


INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (1, 1, DATE '2024-10-11');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (1, 2, DATE '2024-01-14');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (3, 2, DATE '2024-01-15');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (4, 4, DATE '2024-05-26');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (5, 5, DATE '2023-12-02');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (6, 6, DATE '2022-03-14');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (7, 7, DATE '2024-02-03');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (8, 8, DATE '2023-09-16');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (9, 9, DATE '2023-07-20');

INSERT INTO "LIKE" (id_utilizator, id_postari, data_like)
VALUES (10, 10, DATE '2023-11-26');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (1, 'Munte', 30, DATE '2024-10-10', 'http://mysocial.com/video1');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (2, 'Tutorial programare', 300, DATE '2024-01-15', 'http://mysocial.com/video2');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (3, 'Concert live', 180, DATE '2023-12-12', 'http://mysocial.com/video3');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (4, 'Rețetă de bucătărie', 240, DATE '2024-05-25', 'http://mysocial.com/video4');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (5, 'Documentar natura', 360, DATE '2023-12-01', 'http://mysocial.com/video5');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (6, 'Exerciții fitness', 150, DATE '2022-03-13', 'http://mysocial.com/video6');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (7, 'Tutorial', 200, DATE '2024-02-02', 'http://mysocial.com/video7');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (8, 'Prezentare proiect', 90, DATE '2023-09-15', 'http://mysocial.com/video8');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (9, 'Interviu', 180, DATE '2023-07-20', 'http://mysocial.com/video9');

INSERT INTO Video (id_postari, titlu, durata, data_upload, url)
VALUES (10, 'Vlog', 100, DATE '2023-11-26', 'http://mysocial.com/video10');


INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (1, DATE '2024-10-10');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (2, DATE '2024-01-15');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (3, DATE '2023-12-12');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (4, DATE '2024-05-25');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (5, DATE '2023-12-01');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (6, DATE '2022-03-13');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (7, DATE '2024-02-02');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (8, DATE '2023-09-15');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (9, DATE '2023-07-20');

INSERT INTO Postari (id_utilizator, data_postarii)
VALUES (10, DATE '2023-11-26');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Ion Popescu', 'ion.popescu@gmail.com', 'parola123', DATE '2024-05-05');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Maria Ionescu', 'maria.ionescu@gmail.com', 'qwreg12I2K341FK', DATE '2022-12-12');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Stancu Rares', 'rares.stancu@gmail.com', 'rares?!!', DATE '2023-10-01');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Ana Popa', 'ana.popa@gmail.com', 'parola', DATE '2023-04-01');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Madalin Ioana', 'ioana.madalin@gmail.com', 'madalin123', DATE '2024-09-09');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Elena Petrescu', 'elena.petrescu@gmail.com', '2IBB1C12sx', DATE '2021-04-02');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Mihai Dumitru', 'mihai.dumitru@gmail.com', '16232651242', DATE '2019-11-11');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Cristina Radu', 'cristina.radu@gmail.com', 'nb3i0o2bf2vy', DATE '2024-05-02');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Florin Stoica', 'florin.stoica@gmail.com', '3b4fgf43p12b', DATE '2023-09-01');

INSERT INTO Utilizator (nume, email, parola, data_inregistrare)
VALUES ('Ioana Pavel', 'ioana.pavel@gmail.com', 'VJ23GTvg33o08OHVC', DATE '2020-01-03');