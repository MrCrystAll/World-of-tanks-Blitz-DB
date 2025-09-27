
CREATE DATABASE IF NOT EXISTS WOTB;

USE WOTB;

-- Create the table in the specified schema
CREATE TABLE IF NOT EXISTS TANKS
(
    tankId INT NOT NULL PRIMARY KEY, -- primary key column
    name VARCHAR(200),
    description VARCHAR(1500),
    nation VARCHAR(50),
    type VARCHAR(30),
    tier INT
    -- specify more columns here
);

CREATE TABLE IF NOT EXISTS SESSIONS
(
    sessionId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    password VARCHAR(128) NOT NULL
);


-- Create the table in the specified schema
CREATE TABLE IF NOT EXISTS PLAYERS
(
    accountId INT NOT NULL PRIMARY KEY, -- primary key column
    nickname VARCHAR(50) NOT NULL,
    sessionId INT,

    FOREIGN KEY (sessionId) REFERENCES SESSIONS(sessionId)
    -- specify more columns here
);

CREATE TABLE IF NOT EXISTS PLAYERTANK
(
    tankId INT NOT NULL,
    accountId INT NOT NULL,

    PRIMARY KEY(tankId, accountId),
    FOREIGN KEY (tankId) REFERENCES TANKS(tankId),
    FOREIGN KEY (accountId) REFERENCES PLAYERS(accountId)
);

CREATE TABLE IF NOT EXISTS IMAGES
(
    imageId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tankId INT UNIQUE NOT NULL,
    preview VARCHAR(500),
    normal VARCHAR(500),

    FOREIGN KEY (tankId) REFERENCES TANKS (tankId)
);

CREATE TABLE IF NOT EXISTS TOKENS
(
    tokenId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    accountId INT NOT NULL,
    token VARCHAR(128),
    expiresat INT,

    FOREIGN KEY (accountId) REFERENCES PLAYERS (accountId)
);

GRANT SELECT, INSERT, DELETE, UPDATE ON WOTB.* TO 'wotb';