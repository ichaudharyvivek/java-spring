-- Insert Users (Ignore if username already exists)
INSERT INTO users (username, password, enabled)
VALUES ('user', '{noop}EazyBytes@12345', '1')
ON CONFLICT (username) DO NOTHING;

INSERT INTO users (username, password, enabled)
VALUES ('admin', '{bcrypt}$2a$12$O7dpkEcvb97wfffg8RfqGO7sgtC0JjOLda7B6ISqrxb3vOVpC3jIK', '1')
ON CONFLICT (username) DO NOTHING;


-- Insert Authorities (Ignore if username-authority pair already exists)
INSERT INTO authorities (username, authority)
VALUES ('user', 'read')
ON CONFLICT (username, authority) DO NOTHING;

INSERT INTO authorities (username, authority)
VALUES ('admin', 'admin')
ON CONFLICT (username, authority) DO NOTHING;


-- Insert Customers (No Need for ON CONFLICT unless email is unique)
INSERT INTO customer (email, pwd, role)
VALUES ('happy@example.com', '{noop}EazyBytes@12345', 'read');

INSERT INTO customer (email, pwd, role)
VALUES ('admin@example.com', '{bcrypt}$2a$12$O7dpkEcvb97wfffg8RfqGO7sgtC0JjOLda7B6ISqrxb3vOVpC3jIK', 'admin');
