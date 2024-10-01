--Readable version of batabase creation --
CREATE TABLE "country" (
	"id"	INTEGER NOT NULL,
	"name"	varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "builders" (
	"id"	INTEGER NOT NULL,
	"country"	INTEGER NOT NULL,
	"name"	varchar(255) NOT NULL UNIQUE,
	FOREIGN KEY("country") REFERENCES "country"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "category" (
	"id"	INTEGER NOT NULL,
	"name"	varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "scale" (
	"id"	INTEGER NOT NULL,
	"name"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "brand" (
	"id"	INTEGER NOT NULL,
	"name"	varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "period" (
	"id"	INTEGER NOT NULL,
	"name"	varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "model" (
	"id"	INTEGER NOT NULL,
	"builder"	INTEGER NOT NULL,
	"category"	INTEGER NOT NULL,
	"brand"	INTEGER NOT NULL,
	"period"	INTEGER NOT NULL,
	"scale"	INTEGER NOT NULL,
	"name"	varchar(255) NOT NULL,
	"reference"	varchar(50) NOT NULL,
	"picture"	varchar(255),
	"scalemates"	varchar(255),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category") REFERENCES "category"("id"),
	FOREIGN KEY("builder") REFERENCES "builders"("id"),
	FOREIGN KEY("scale") REFERENCES "scale"("id"),
	FOREIGN KEY("brand") REFERENCES "brand"("id"),
	FOREIGN KEY("period") REFERENCES "period"("id")
);
CREATE TABLE "provider" (
	"id"	INTEGER NOT NULL,
	"name"	varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "orders" (
	"id"	INTEGER NOT NULL,
	"reference"	varchar(50) NOT NULL,
	"date_order"	varchar(10) NOT NULL,
	"provider"	INTEGER NOT NULL,
	FOREIGN KEY("provider") REFERENCES "provider"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "model_order" (
	"id"	INTEGER NOT NULL,
	"model_id"	INTEGER NOT NULL,
	"qtty"	INTEGER NOT NULL,
	"price"	REAL NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("model_id") REFERENCES "model"("id")
);
CREATE TABLE "status" (
	"id"	INTEGER NOT NULL,
	"name"	varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "model_user" (
	"id"	INTEGER NOT NULL,
	"model_id"	INTEGER NOT NULL,
	"state"	INTEGER NOT NULL,
	FOREIGN KEY("model_id") REFERENCES "model"("id"),
	FOREIGN KEY("state") REFERENCES "status"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);

INSERT INTO "main"."status"
("id","name")
VALUES (1,'En stock'),(2,'En cours'),(3,'Terminé'),(4,'Liste de souhaits'),(5,'Commandé');

INSERT INTO "main"."country"
("id", "name")
VALUES (1, 'France'), (2,'Allemagne');

INSERT INTO "main"."period"
("id", "name")
VALUES (1, 'WWI'),(2, 'WWII'),(3, 'Vietnam');

INSERT INTO "main"."brand"
("id", "name")
VALUES (1, 'Tamiya');

INSERT INTO "main"."builders"
("country", "name")
VALUES (1, 'Morane Saulnier');

INSERT INTO "main"."scale"
("name")
VALUES ('1/35');

INSERT INTO "main"."category"
("name")
VALUES ('Voitures');

