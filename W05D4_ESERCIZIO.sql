#SHORTCUTS PER EXECUTE
#CTRL+SHIFT+ENTER=EXECUTE ALL OR SELECTED
#CTRL+SHIFT=EXECUTE KEYBOARD CURSOR

#VISUALIZZO DATABASE
SHOW DATABASES;
#INDICO CHE VOGLIO UTILIZZARE GESTIONALE_ESTETISTA
USE gestionale_estetista;
#VISUALIZZA TABELLE
SHOW TABLES;

#CREO LA TABELLA DEL GESTIONALE CLIENTE CON IDCLIENTE, NOME, COGNOME
CREATE TABLE cliente (
    clienteID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25),
    cognome VARCHAR(25)
);	
    
INSERT INTO cliente (nome,cognome)
VALUES  ('Aurora', 'Zuccarello'),
		('Marika', 'Giurintano'),
		('Chiara','Signorello');
        
#CREO LA TABELLA DEL GESTIONALE SERVIZIO CON IDSERVIZIO, NOME, COSTO
CREATE TABLE servizio (
	servizioID INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(25),
	costo DECIMAL(10,2)
);

INSERT INTO servizio (nome,costo)
VALUES  ('Manicure',15),
		('Refill',25),
        ('Ricostruzione',35),
        ('Ceretta sopracciglia',3),
        ('Massaggio corpo',25),
        ('Pulizia viso',20),
        ('Makeup cerimonia',40);

#CREO LA TABELLA DEL GESTIONALE ESTETISTA CON ESTETISTAID, NOME, SERVIZIO
CREATE TABLE estetista (
	estetistaID INT AUTO_INCREMENT KEY,
    nome VARCHAR(25),
    servizio VARCHAR(25)
    );
    

INSERT INTO estetista (nome,servizio)
VALUES  ('Nina', 'Manicure'),
		('Nina', 'Refill'),
		('Nina', 'Ricostruzione'),
		('Serena', 'Ceretta sopracciglia'),
        ('Serena', 'Massaggio corpo'),
        ('Serena', 'Pulizia viso'),
        ('Marika', 'Makeup cerimonia');
    

#VISUALIZZO LA TABELLA CREATA
SHOW TABLES;	
#VISUALIZZO NEL DETTAGLIO COM'E' COMPOSTA LA TABELLA
DESCRIBE estetista;	
#VISUALIZZO COSA CONTIENE LA TABELLA
SELECT * FROM estetista;
