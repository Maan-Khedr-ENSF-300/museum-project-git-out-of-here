DROP DATABASE IF EXISTS ART;
CREATE DATABASE ART; 
USE ART;

DROP TABLE IF EXISTS EXHIBITIONS;
CREATE TABLE EXHIBITIONS
( Name_              VARCHAR(500)      NOT NULL,
  start_date         DATE,
  end_date           DATE,
  exhib_id           INT               NOT NULL,
PRIMARY KEY (exhib_id));

INSERT INTO EXHIBITIONS
VALUES      ('Cubism and the Trompe l’Oeil Tradition', '2022-08-20', '2023-01-22', 1),
            ('The Tudors','2022-08-10', '2023-01-08', 2),
            ('Hear Me Now', '2022-09-09', '2023-02-05', 3),
            ('Major Events in History', '2021-08-23', '2023-08-23',4),
            ('The art of portraits', '2022-08-10','2023-01-08', 5);
            
DROP TABLE IF EXISTS ARTISTS;
CREATE TABLE ARTISTS
( Artist_id            INT              NOT NULL,
  Name_A               VARCHAR(500),
  DateBorn             INT,
  Date_died            INT,
  Country_of_origin    VARCHAR(500),
  Epoch                VARCHAR(500),
  main_style		   VARCHAR(500),
  description_A 	   VARCHAR(500),
PRIMARY KEY (Artist_id));

INSERT INTO ARTISTS
VALUES      (201, 'Pablo Picasso',1881, 1973 ,'Spain', 'Rose era', 'Cubism', 'spanish painter, sculptor, printmakers, ceramicist, theater designer who spent most of his time in france'),
            (202, 'Jefferson D.Chalfant', 1856, 1931, 'America', 'Trompe-l’œil', 'still life',  'A man who is remembered for his style life of American culture'),
            (203, 'Evaristo Baschenis', 1617, 1677, 'Italy', 'Baroque', 'Renaissance', 'Evaristo Baschenis was an Italian Baroque painter of the 17th century, active mainly around his native city of Bergamo'),
            (204, 'Alexandre Isidore Leroy de Barde', 1777 , 1828, 'French', 'Enlightenment Era', 'Realism', 'Alexandre Isidore Leroy de Barde , born in February 1777 in Montreuil-sur-Mer and died in 1828 or 1829 in Paris , is a French painter active in England' ),
            (205, 'Zed Zidane', null,null, null, null, null, null),
            (901, 'Benedetto da Rovezzano', 1474, 1552, 'Italy', 'Figurative', 'Renaissance', 'Italian architect and sculptor who worked mainly in Florence'),
            (911, 'Pietro Torrigiano', 1472, 1528, 'Italy', 'Renaissance', 'Florentine painting', 'An Italian renaissance sculptor from florenece who had to flee the city after breaking michelangelos nose'),
			(912, 'Hans Holbein The Younger', 1500, 1543, 'Germany', 'Renaissance', 'Portraits', 'German-Swiss painter and printmaker who worked in a Northern renaissance style and is considered one of the greatest portraits of the 16th century'),
            (2200, 'Neymar Koplasz',null,null,null,null,null,null),
            (382, 'Simone Leigh', 1967, null, 'America', 'Modern', 'Pottery and Statues', 'Simone Leigh is an American artist who specializes in pottery, sculptures, video, installation, and social practice.'),
            (784, 'Robert Pruitt', 1975, null, 'America', 'Modern', 'Paintings and Installations', 'Robert Pruitt is a Houston-based artist most known for drawings, videos, and installations dedicated to examination of the historical and contemporary experiences of African Americans'),
            (467, 'Woody de Othello', 1991, null, 'America', 'Modern', 'Ceramics and Installations', 'Woody de Othello is a ceramist best known for his work with ceramics and ways in which they can be presented as sculptures'),
            (890, 'Vili (Kongo)', null, null, 'The Democratic Republic of the Congo', 'Gilded Age', 'Nkisi Nkondi figures (power figures)', 'A Central African ethnic group stemmed from the Bantu ethnic group of the Kongo people. They created Nkisi Nkondi figures to be used as a connection between the divine and the physical world.'),
            (10, 'Antoine Caron', 1521, 1599, 'France', 'Protestant', 'Mannerist', 'Northern Mannerist painter and a product of the School of Fontainebleau. He is one of the few French painters of his time who had a pronounced artistic personality'),
            (11, 'Francesco Trevisani', 1656, 1746, 'Slovenia', 'Rococo', 'Roman', 'Francesco Trevisani (April 9, 1656 – July 30, 1746) was an Italian painter active in the period called either early Rococo or late Baroque (barochetto)'),
            (7, 'Archain Denisty',null, null, null, null, null, null),
            (18, 'Joseph Ducreux', 1735, 1802, 'France', 'Late modern period', 'Portrait painting', 'French noble, portrait painter, pastelist, miniaturist, and engraver'),
            (2091, 'Jean-Louis', 1707, 1802, 'France', 'renaissance', 'sculptor', 'a french sculptor who specialized in portraits of living people');

            
DROP TABLE IF EXISTS ART_OBJECTS;
CREATE TABLE ART_OBJECTS
( id_no          INT  	     NOT NULL,      
  artist         CHAR(255),
  year_    	     INT,         
  title          VARCHAR(500),   
  description_   VARCHAR(500),		  
  atrist_id      INT  		 NOT NULL,
  exhibnum       INT		 NOT NULL,
  culture_of_origin  VARCHAR(500),
  epoch             VARCHAR(500),
PRIMARY KEY (id_no),
FOREIGN KEY (exhibnum) REFERENCES EXHIBITIONS(exhib_id), 
FOREIGN KEY (atrist_id) REFERENCES ARTISTS(Artist_id)); 

INSERT INTO ART_OBJECTS
VALUES      (501, 'Pablo Picasso', 1914, 'Glass and die', 'Carved and marbleized piece of wood fixed to the backboard may represent a curtain' ,201,1, 'Spain', 'Rose Era'),
            (502, 'Pablo Picasso', 1914, 'The Absinthe Glass', 'Life size rendering of a glass of alcohol for is visualization of banality', 201, 1, 'Spain', 'Rose Era'),
            (503, 'Jefferson D Chalfant', 1890, 'A US stamp', 'stamp onto a canvas beside a hand-painted double', 202, 1, 'American', 'trompe l’oeil'),
            (504, 'Evaristo baschenis', 1665, 'Musical Instruments', 'Decaying apples and fruits against ribbons and musical instruments',203, 1, 'Italian', 'Renaissance'),
            (507, 'Pablo Picasso', 1912, 'Violin and Grapes', 'picasso’s violin on a wall that hardens back on the trompe l’oeil board paintings', 201,1, 'Italian', 'Renaissance'),
            (505, 'Isidore Leroy', 1894, 'Wallpaper: pattern 11355', 'a pattern of wood like wallpaper', 204, 1, 'French', 'Modern'),
			(506, 'Tournai', 1780, 'Coffeepot', 'Motif of a print attached to a wood planking', 205, 1, 'Belgian', 'Imperialism'),
            (601, 'Benedetto da Rovezzano', 1524,  'Angle Bearing Candlestick', 'an angle slouching down with a candle light with a gown', 901, 2, 'Italy', 'Renaissance'),
            (608, 'Pietro Torrigiano', 1510,  'Portrait Bust of John Fisher, Bishop of Rochester', 'a questionable identification of the bishop of Rochester',  911, 2, 'British', 'Renaissance'),
            (620, 'Hans Holbein the Younger', 1537, 'Henry VIII', ' A jewel in the crown of tudor England', 912, 2, 'German', 'Renissance'),
            (621, 'Hans Holbein the Younger', 1538, 'Edward VI as Child', 'The king Edward VI as a child on an oil canvas', 912, 2, 'German', 'Renissance'),
            (602, 'Benedetto da Rovezzano', 1500, 'Candelabrum', 'A candelabrum designed in a dark like renaissance way', 901, 2, 'Italy', 'Renaissance'),
            (603, 'Jacques Androuet Du Cerceau', 1575, 'The Sea Dog Table',  'a table with a sea dog on both ends with turtles at the bottom as support and simple storage compartments', 901, 2, 'French', 'Renaissance'),
            (310, 'Unrecorded Edgefield District potter (American)', 1850, 'Face jug', 'A Harvest jug materialized as the earliest visual depiction of an Edgefield Face Vessel. The vessel is described as alkaline-glazed stoneware with a horizontal handle on top and facial features on its anterior', 2200, 3, 'American', 'Gilded Age'),
            (108, 'Simone Leigh', 2019, '108 (Face Jug Series)', 'A modern take on the face vessel designs of old Edgefield.', 382, 3, 'American', 'Modern'),
            (66, 'Robert Pruitt', 2019, 'Birth and Rebirth and Rebirth', 'A depiction of a black woman in contemporary garments on one panel and interacting with African Art pieces on the flip panel.', 784, 3, 'America', 'Modern'),
            (202,'Woody de Othello', 2021, 'Applying Pressure', 'A vessel atop a bench depicting the pressure that slavery had on stability.', 467, 3, 'America', 'Modern'),
            (192,'Vili (Kongo)', 1850, 'Power Figure', 'A figure central to the beliefs of the Kongo Peoples (The Democratic Republic of the Congo) and more specifically, the Vili peoples in that they are considered a container for sacred substances that can be summoned into the physical world.', 890, 3,  'Kongo (The Democratic Republic of the Congo)', 'Gilded Age'),
            (20, 'Caron Antonie', 1566, 'The Triumvirate Massacres', 'an imaginary landscape, Caron depicts the massacres perpetrated during the roman civil war', 10, 4, 'France', 'Roman'),
            (21, 'Trevisani Francesco', 1737, 'The family of darius at the feet of alexander', 'Multiple people bowing down to two men standing', 11, 4, 'French', 'Renaissance'),
            (22, 'Caron Antonie', 1566, 'The Triumvirate Massacres', 'an imaginary landscape, Caron depicts the massacres perpetrated during the roman civil war', 10, 4, 'Lagash', 'Carved'),
            (40, 'Joseph Ducreux', 1793, 'Potrait of the artist in the guise of a mockingbird', 'a man pointing to the viewer of the painting', 18, 5, 'French', 'Industrial era'),
            (41, 'Joseph Ducreux', 1793, 'Portrait of Ducreux, by himself', 'a self portrait of ducreux created by himself', 18, 5, 'French', 'Industrial era'),
            (43, 'Jean Louis', 1784, 'Alexandre Emilie Brongniart', 'a scupltor, of alexandrine emilie brongniart the daughter of the architect alexandre theodore brongniart', 2091, 5, 'French', 'Industrial era');


DROP TABLE IF EXISTS PAINTINGS;
CREATE TABLE PAINTINGS
( PID_no          INT          NOT NULL,
  paint_type      VARCHAR(500),
  draw_on         VARCHAR(500),
  style           VARCHAR(500),
PRIMARY KEY (PID_no),
FOREIGN KEY (PID_no) REFERENCES ART_OBJECTS(id_no));


INSERT INTO PAINTINGS
VALUES     (503, 'Oil', 'printed paper on wood', 'Trompe l’oeil'),
           (504, 'Oil', 'canvas', 'Tromp l’oeil'),
           (507, 'Oil', 'canvas','Cubism'),
           (620, 'Oil', 'Panel', 'Portrait'),
           (621, 'Oil', 'Panel', 'Portrait'),
           (66, 'Conte/charcoal', 'Paper', 'Modern'),
           (20, 'oil', 'canvas' , 'Imaginary landscape'),
           (21, 'oil', 'canvas' , 'Realism'),
           (40, 'Oil', 'canvas', 'Realism'),
           (41, 'pastel', 'paper', 'Portrait');
           

DROP TABLE IF EXISTS SCULPTURE_STATUE;
CREATE TABLE SCULPTURE_STATUE
( SSID_no           INT            NOT NULL,
  material          VARCHAR(500),
  height            VARCHAR(500), 
  weight            VARCHAR(500),       
  style				VARCHAR(500),       
PRIMARY KEY (SSID_no),
FOREIGN KEY (SSID_no) REFERENCES ART_OBJECTS(id_no));

INSERT INTO SCULPTURE_STATUE
VALUES      (501, 'Wood', '21.9 cm', '98 lb', 'realism'),
            (502, 'Bronze and tin',  '22.5 cm', '76kg', 'Cubism'),
            (601, 'Bronze', '39 inches', '141 pounds', 'Realism'),
			(608, 'Polychrome terracotta', '24 inches', '62 kg', 'Realism'),
            (202, 'Ceramic, glaze, and red oak wood', '38 inches', '30 kg', 'Modern'),
            (192, 'Wood, iron, nails, blades, fragments, and fiber cord', '40.75 inches', '40 lb', 'Gilded Age'),
            (22, 'Clay', '27 cm', '300 lb', 'Prehistoric Art'),
            (43, 'Terracotta', '0.352 m','97 lb','Abstracty'),
            (602, 'Bronze', '120cm', '13.71 kg', 'Metalwork'),
            (603, 'Furniture', '42 cm', '200 lb', 'Carved furniture');


DROP TABLE IF EXISTS OTHER;
CREATE TABLE OTHER
( OID_no           INT             NOT NULL,
  type_            VARCHAR(500),
  style            VARCHAR(500),    
PRIMARY KEY (OID_no),
FOREIGN KEY (OID_no) REFERENCES ART_OBJECTS(id_no));

INSERT INTO OTHER
VALUES      (505, 'Wallpaper', 'Machine-printed paper'),
            (506, 'Ceramics', 'Soft paste porcelain'),
            (310, 'Pottery', 'Alkaline glazed stoneware with kaolin'),
            (108, 'Pottery', 'Salt-fired Porcelain');
         		

DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS
( username            VARCHAR(500)             NOT NULL,
  password_           VARCHAR(500)             NOT NULL,
  account_type        VARCHAR(500) 			   NOT NULL,    
PRIMARY KEY (username));
	

INSERT INTO USERS
VALUES     ('zahwa123', 'sklmP123', 'admin'),
		   ('Kenzy_h','KH!@#',  'dataentry'),
		   ('Nessm_M6789', 'NLOK1gh', 'end');

DROP TABLE IF EXISTS PERMANENT_COLLECTION;
CREATE TABLE PERMANENT_COLLECTION
( PCID_no            INT              NOT NULL,
  Date_aquired       DATE,
  status_            VARCHAR(500)     NOT NULL,
  cost				 VARCHAR(500), 
  collec_name		 VARCHAR(500)     NOT NULL,
PRIMARY KEY (PCID_no),
FOREIGN KEY (PCID_no) REFERENCES ART_OBJECTS(id_no));


INSERT INTO PERMANENT_COLLECTION
VALUES      (501, '2022-01-17', 'On view', '1000000', 'Cubism and the Trompe l’Oeil Tradition'),
            (502, '1914-09-23', 'Not on view', '179000000', 'Cubism and the Trompe l’Oeil Tradition'),
            (503, '1997-11-14', 'On view', '52000', 'Cubism and the Trompe l’oeil tradition'),
            (504, '2022-09-21','On view', '1472000','Cubism and the Trompe l’oeil tradition'),
            (507, '2022-02-11', 'On view',  '90000', 'Cubism and the Trompe l’oeil tradition'),
            (505, '2022-03-04', 'On view', '5000', 'Cubism and the Trompe l’oeil tradition'),
            (506, '2022-07-16', 'On view', '200000', 'Cubism and the Trompe l’oeil tradition'),
            (601, '2022-08-22', 'On view', '5000000', 'The Tudors'),
            (621, '2022-08-22', 'Modification', '432421', 'The Tudors'),
            (608, '2022-04-03', 'On view', '34329022', 'The Tudors'),
            (620, '2022-07-06', 'On view', '29010101', 'The Tudors'),
            (602, '2022-12-01', 'On view', '9000000', 'The Tudors'),
            (603, '2022-10-05','On view', '2000000', 'The Tudors'),
            (310, '2017-11-05', 'On view', '175000', 'Hear Me Now'),
            (108, '2022-02-03', 'On view', '175000', 'Hear Me Now'),
            (66, '2020-08-09', 'On view', '200000', 'Hear Me Now'),
            (202, '2022-11-11', 'On view', '200000', 'Hear Me Now'),
            (192, '2005-06-19', 'On view', '150000', 'Hear Me Now');

DROP TABLE IF EXISTS COLLECTIONS;
CREATE TABLE COLLECTIONS
( collec_name    VARCHAR(500)           NOT NULL,
  type_          VARCHAR(500),           
  description_C  VARCHAR(500),
  address        VARCHAR(500),
  phone          VARCHAR(500),
  contact_person VARCHAR(500),
PRIMARY KEY (collec_name));

INSERT INTO COLLECTIONS
VALUES    ('Département des Peintures', 'Collection', 'The departement of paintings', 'Rue de Rivoli 75001 Paris', 33140205050, 'Louvre'),
		  ('Département des Sculptures du Moyen Age', 'Personal Collection', 'Departement of sculptures of the modern age', 'Rue de Rivoli 75001 Paris', '4034006243', 'Louvre');


DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED
( BID_no               INT          NOT NULL,
  Collection_borrowed  VARCHAR(500) NOT NULL,
  Date_borrowed        DATE         NOT NULL,
  date_returned        DATE         NOT NULL,
PRIMARY KEY (BID_no),
FOREIGN KEY (BID_no) REFERENCES ART_OBJECTS(id_no),
FOREIGN KEY (Collection_borrowed) REFERENCES COLLECTIONS(collec_name));

INSERT INTO BORROWED
VALUES      (20, 'Département des Peintures', '2022-03-19','2025-05-19'),
            (21, 'Département des Peintures', '2001-05-20', '2019-05-20'),
            (22, 'Département des Peintures', '2019-03-20', '2011-05-19'),
            (40, 'Département des Sculptures du Moyen Age', '2010-03-04', '2090-05-07'),
            (41, 'Département des Sculptures du Moyen Age', '2010-03-04', '2090-05-07'),
            (43, 'Département des Sculptures du Moyen Age', '2010-03-04', '2050-06-19');
		
            
