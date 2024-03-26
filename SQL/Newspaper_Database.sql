USE Newspaper_Database;


DROP TABLE IF EXISTS Illustrates;
DROP TABLE IF EXISTS Photographer;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Publishes;
DROP TABLE IF EXISTS ArticleEdition;
DROP TABLE IF EXISTS Edition;
DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Journalist;
DROP TABLE IF EXISTS Newspaper;

CREATE TABLE Newspaper
(NewspaperTitle VARCHAR (100),
 FoundingDate DATE,
 Periodicity INT,
 PRIMARY KEY (NewspaperTitle)
); 

CREATE TABLE Journalist 
	(CPR 			CHAR(10) NOT NULL,
     FirstName  	VARCHAR(25),
     LastName   	VARCHAR(50),
     StreetName 	VARCHAR(100),
     CivicNumber 	INT,
     City		 	VARCHAR(30),
     ZipCode	 	INT,
     Country	 	VARCHAR(30),
     Telephone 		INT,
     Email 	   		VARCHAR(50),
     PRIMARY KEY(CPR)
	);
    
CREATE TABLE Article
    (ArticleTitle   VARCHAR(100) NOT NULL UNIQUE,
     Content        VARCHAR(10000),
     Topic          VARCHAR(50),
     ReadCount      INT,
     CPR            CHAR(10),
     PRIMARY KEY(ArticleTitle),
     FOREIGN KEY(CPR) REFERENCES Journalist(CPR) ON DELETE SET NULL
    );
    
CREATE TABLE Role (
     RoleType ENUM('Managing Editor', 'Copy Editor', 'Writer', 'Graphics Designers'),
     ArticleTitle VARCHAR(100),
	 CPR CHAR(10),
	 FOREIGN KEY (CPR) REFERENCES Journalist(CPR) ON DELETE SET NULL,
	 FOREIGN KEY (ArticleTitle) REFERENCES Article(ArticleTitle) ON DELETE SET NULL
	);

CREATE TABLE Photo (
	PhotoTitle VARCHAR(255),
	DateTaken DATE,
	CPR CHAR(10),
	PRIMARY KEY (PhotoTitle),
	FOREIGN KEY (CPR) REFERENCES Journalist (CPR) ON DELETE SET NULL
);

CREATE TABLE Illustrates 
	(PhotoTitle		VARCHAR(100),
     ArticleTitle	VARCHAR(100),
     PRIMARY KEY(PhotoTitle, ArticleTitle),
     FOREIGN KEY(PhotoTitle) REFERENCES Photo(PhotoTitle),
     FOREIGN KEY(ArticleTitle) REFERENCES Article(ArticleTitle)
     );
     
CREATE TABLE Photographer
	(PhotoTitle		VARCHAR(100),
	 CPR			CHAR(10),
     PRIMARY KEY(PhotoTitle, CPR),
     FOREIGN KEY(PhotoTitle) REFERENCES Photo(PhotoTitle),
     FOREIGN KEY(CPR) REFERENCES Journalist(CPR)
     );
	
CREATE TABLE Edition(
	NewspaperTitle VARCHAR(100), 
	PublishDate DATE NOT NULL UNIQUE,
	CPR CHAR(10),
    PRIMARY KEY(NewspaperTitle, PublishDate),
    FOREIGN KEY(NewspaperTitle) REFERENCES Newspaper(NewspaperTitle),
	FOREIGN KEY(CPR) REFERENCES Journalist(CPR) ON DELETE SET NULL
);

CREATE TABLE ArticleEdition(
	PublishDate 	DATE,
    ArticleTitle 	VARCHAR(100),
    PRIMARY KEY(PublishDate, ArticleTitle),
    FOREIGN KEY(PublishDate) REFERENCES Edition(PublishDate),
    FOREIGN KEY(ArticleTitle) REFERENCES Article(ArticleTitle)
);

CREATE TABLE Employee(
	NewspaperTitle VARCHAR(100),
	CPR CHAR(10),
    PRIMARY KEY(NewspaperTitle, CPR),
	FOREIGN KEY (NewspaperTitle) REFERENCES Newspaper (NewspaperTitle),
	FOREIGN KEY (CPR) REFERENCES Journalist (CPR)
);
