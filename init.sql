CREATE DATABASE IF NOT EXISTS ACM;
USE ACM;

DROP TABLE IF EXISTS VERIFICATION;
DROP TABLE IF EXISTS MEMBERPATH;
DROP TABLE IF EXISTS DISCORDSCHEDULE;
DROP TABLE IF EXISTS CLASS;
DROP TABLE IF EXISTS MEMBER;

CREATE TABLE IF NOT EXISTS MEMBER (
	email VARCHAR(64) NOT NULL,
	discordId CHAR(18) UNIQUE,
	firstName VARCHAR(32) NOT NULL,
	lastName VARCHAR(32) NOT NULL,
	pronouns VARCHAR(16),
	status VARCHAR(16),
	PRIMARY KEY (email)
);

CREATE TABLE IF NOT EXISTS CLASS (
	id SMALLINT,
	subject CHAR(4),
	`number` CHAR(4),
	section TINYINT(2),
	`name` VARCHAR(64),
	`year` YEAR,
	semester CHAR(6),
	instructor VARCHAR(32),
	location VARCHAR(32),
	startTime TIME,
	endTime TIME,
	days CHAR(4),
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS COURSECHANNEL (
	subject CHAR(4),
	`number` CHAR(4),
	discordChannel CHAR(18),
	PRIMARY KEY(subject, number)
)

CREATE TABLE IF NOT EXISTS DISCORDSCHEDULE (
	discordId CHAR(18),
	classId SMALLINT,
	FOREIGN KEY(discordId) REFERENCES MEMBER(discordId),
	FOREIGN KEY(classId) REFERENCES CLASS(id),
	PRIMARY KEY(discordId, classId)
);

CREATE TABLE IF NOT EXISTS MEMBERPATH (
	email VARCHAR(32),
	`path` CHAR(8),
	FOREIGN KEY (email) REFERENCES MEMBER(email),
	PRIMARY KEY (email, `path`)
);

CREATE TABLE IF NOT EXISTS VERIFICATION (
	discordId VARCHAR(18),
	email VARCHAR(64) NOT NULL,
	firstName VARCHAR(32) NOT NULL,
	lastName VARCHAR(32) NOT NULL,
	pronouns VARCHAR(16),
	code CHAR(6) NOT NULL,
	createdAt DATETIME NOT NULL,
	PRIMARY KEY (discordId)
);

