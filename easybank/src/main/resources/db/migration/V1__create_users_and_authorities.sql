-- Create Users Table
CREATE TABLE users (
    username VARCHAR(50) NOT NULL PRIMARY KEY,
    password VARCHAR(500) NOT NULL,
    enabled BOOLEAN NOT NULL
);

-- Create Authorities Table
CREATE TABLE authorities (
    username VARCHAR(50) NOT NULL,
    authority VARCHAR(50) NOT NULL,
    CONSTRAINT fk_authorities_users FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE
);

-- Create Unique Index on authorities table
CREATE UNIQUE INDEX ix_auth_username ON authorities (username, authority);
