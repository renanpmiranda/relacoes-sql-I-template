-- Active: 1673873944178@@127.0.0.1@3306

-- Práticas 1 e 2

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, name, email, password)
VALUES 
    ("u001", "Fulano", "fulano@email.com", "123456"),
    ("u002", "Ciclano", "ciclano@gmail.com", "654321");

INSERT INTO phones (id, phone_number, user_id)
VALUES
    ("p001", "5511983968242", "u001"),
    ("p002", "5511985268697", "u001"),
    ("p003", "5511999326098", "u002");

SELECT * FROM users;

SELECT * FROM phones;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

-- Prática 3

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

INSERT INTO licenses (id, register_number, category)
VALUES
    ("l001", "1111111111", "A"),
    ("l002", "2222222222", "AB");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
    ("d001", "Fulano", "fulano@gmail.com", "123456", "l001"),
    ("d002", "Beltrano", "beltrano@gmail.com", "654321", "l002");

SELECT * FROM licenses;

SELECT * FROM drivers;

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;

-- Fixação

CREATE TABLE teams (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE players (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    team_id TEXT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(id)
);

INSERT INTO teams (id, name, country)
VALUES
    ("t001", "Liverpool FC", "England"),
    ("t002", "Manchester United", "England"),
    ("t003", "FC Barcelona", "Spain");

INSERT INTO players (id, name, age, team_id)
VALUES
    ("p001", "Thiago Alcântara", 30, "t001"),
    ("p002", "Antony dos Santos", 25, "t002"),
    ("p003", "Robert Lewandowski", 32, "t003"),
    ("p004", "Virgil Van Dijk", 29, "t001"),
    ("p005", "Casemiro", 31, "t002"),
    ("p006", "Alisson", 30, "t001");

SELECT * FROM teams;

SELECT * FROM players;

SELECT * FROM players
INNER JOIN teams
ON players.team_id = teams.id;