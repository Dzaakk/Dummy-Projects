CREATE DATABASE learn_notification;

USE learn_notification;

SHOW TABLES;

# User

CREATE TABLE user
(
    id   VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SHOW TABLES;

INSERT INTO user(id, name)
VALUES ('user1', 'user1 user1');
INSERT INTO user(id, name)
VALUES ('user2', 'user2 user2');

SELECT * FROM user;

# Notification

CREATE TABLE notification
(
    id        INT          NOT NULL AUTO_INCREMENT,
    title     VARCHAR(255) NOT NULL,
    detail    TEXT         NOT NULL,
    create_at TIMESTAMP    NOT NULL,
    user_id   VARCHAR(100),
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SHOW TABLES;

ALTER TABLE notification
    ADD CONSTRAINT fk_notification_user
        FOREIGN KEY (user_id) REFERENCES user (id);

DESC notification;

INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Pesanan', 'Detail Pesanan', CURRENT_TIMESTAMP(), 'user1');
INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Promo', 'Detail Promo', CURRENT_TIMESTAMP(), null);
INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Pembayaran', 'Detail Pembayaran', CURRENT_TIMESTAMP(), 'user2');

SELECT *
FROM notification;

SELECT *
FROM notification
WHERE (user_id = 'user1' OR user_id IS NULL)
ORDER BY create_at DESC;

SELECT *
FROM notification
WHERE (user_id = 'user2' OR user_id IS NULL)
ORDER BY create_at DESC;

#--------------------------------
CREATE TABLE category (
    id VARCHAR(100) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
SHOW TABLES;

ALTER TABLE notification
    ADD COLUMN category_id VARCHAR(100);

DESCRIBE notification;

ALTER TABLE notification 
ADD CONSTRAINT fk_notification_category
Foreign Key (category_id) REFERENCES category(id);

SELECT * FROM notification;

INSERT INTO category(id, name) VALUES('INFO', 'Info');
INSERT INTO category(id, name) VALUES('PROMO', 'Promo');

SELECT * FROM category;

UPDATE notification
SET category_id = 'INFO'
WHERE id = 1;

UPDATE notification
SET category_id = 'PROMO'
WHERE id = 2;

UPDATE notification
SET category_id = 'INFO'
WHERE id = 3;

SELECT *
FROM notification
WHERE (user_id = 'user1' OR user_id IS NULL)
ORDER BY create_at DESC;

SELECT * 
FROM notification n 
JOIN category c ON (n.category_id = c.id)
WHERE (n.user_id = 'user1' OR n.user_id IS NULL)
ORDER BY n.create_at DESC;

SELECT * 
FROM notification n 
JOIN category c ON (n.category_id = c.id)
WHERE (n.user_id = 'user1' OR n.user_id IS NULL)
AND c.id = 'PROMO'
ORDER BY n.create_at DESC;

#------------------------------------
# notification read
CREATE TABLE notification_read(
    id INT NOT NULL AUTO_INCREMENT,
    is_read BOOLEAN NOT NULL,
    notification_id INT NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

SHOW TABLES;
ALTER TABLE notification_read
ADD CONSTRAINT fk_notifcation_read_notification
Foreign Key (notification_id) REFERENCES notification(id);

ALTER TABLE notification_read
ADD CONSTRAINT fk_notification_read_user
Foreign Key (user_id) REFERENCES user(id);

DESC notification_read;
SELECT * FROM notification;

INSERT INTO notification_read(is_read, notification_id, user_id) 
VALUES(true, 2, 'user1');
INSERT INTO notification_read(is_read, notification_id, user_id) 
VALUES(true, 2, 'user2');
SELECT * FROM notification_read;

SELECT * 
FROM notification n 
    JOIN category c ON (n.category_id = c.id)
    LEFT JOIN notification_read nr ON (nr.notification_id = n.id)
WHERE (n.user_id = 'user1' OR n.user_id IS NULL)
    AND (nr.user_id = 'user1' OR nr.user_id IS NULL)
ORDER BY n.create_at DESC;

INSERT INTO notification(title, detail, category_id, user_id, create_at)
VALUES ('Pesanan 2', 'Detail Pesanan 2', 'INFO', 'user1', CURRENT_TIMESTAMP());

INSERT INTO notification(title, detail, category_id, user_id, create_at)
VALUES ('Promo 2', 'Detail Promo 2', 'PROMO', NULL, CURRENT_TIMESTAMP());

# Counter(is read)

SELECT COUNT(*) 
FROM notification n 
    JOIN category c ON (n.category_id = c.id)
    LEFT JOIN notification_read nr ON (nr.notification_id = n.id)
WHERE (n.user_id = 'user1' OR n.user_id IS NULL)
    AND (nr.user_id IS NULL)
ORDER BY n.create_at DESC;

SELECT * FROM notification;
INSERT INTO notification_read(is_read, notification_id, user_id) 
VALUES(true, 1, 'user1');