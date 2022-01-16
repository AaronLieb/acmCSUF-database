CREATE DATABASE IF NOT EXISTS ACM;
USE ACM;

DROP TABLE IF EXISTS MEMBER;
CREATE TABLE IF NOT EXISTS MEMBER (
	email VARCHAR(32) NOT NULL,
	discordId CHAR(18) UNIQUE,
	firstName VARCHAR(32),
	lastName VARCHAR(32),
	status VARCHAR(16),
	year INT,
	PRIMARY KEY (email)
);

DROP TABLE IF EXISTS CLASS;
CREATE TABLE IF NOT EXISTS CLASS (
	id SMALLINT,
	subject CHAR(4),
	`number` SMALLINT(3),
	section TINYINT(2),
	`year` YEAR,
	semester CHAR(6),
	instructor VARCHAR(32),
	startTime TIME,
	endTime TIME,
	PRIMARY KEY(id)
);

DROP TABLE IF EXISTS DISCORDSCHEDULE;
CREATE TABLE IF NOT EXISTS DISCORDSCHEDULE (
	discordId CHAR(18),
	classId SMALLINT,
	FOREIGN KEY(discordId) REFERENCES MEMBER(discordId),
	FOREIGN KEY(classId) REFERENCES CLASS(id),
	PRIMARY KEY(discordId)
);


