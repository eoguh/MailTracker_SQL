

CREATE TABLE User (
    id              SERIAL PRIMARY KEY,
    username        VARCHAR(10000) NOT NULL,
    first_name      VARCHAR(10000) NOT NULL,
    last_name       VARCHAR(10000) NOT NULL,
    email_address   VARCHAR(254) NOT NULL,
    date_joined     TIMESTAMP NOT NULL
);

CREATE TABLE Staff (
    id              SERIAL PRIMARY KEY,
    name_id         INTEGER NOT NULL REFERENCES User(id),
    bio             TEXT NOT NULL,
    academic_staff  BOOLEAN NOT NULL
);

CREATE TABLE Faculty (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(10000) NOT NULL,
    Dean_id         INTEGER NOT NULL REFERENCES Staff(id)
);

CREATE TABLE Department (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR NOT NULL,
    faculty_id      INTEGER NOT NULL REFERENCES Faculty(id),
    HOD_id          INTEGER NOT NULL REFERENCES Staff(id)
);

CREATE TABLE Student_grouping (
    id                  SERIAL PRIMARY KEY,
    department_id       INTEGER NOT NULL REFERENCES Department(id),
    student_level       INTEGER NOT NULL,
    course_advider_id   INTEGER NOT NULL REFERENCES Staff(id)
);

CREATE TABLE Student (
    id                  SERIAL PRIMARY KEY,
    name_id             INTEGER NOT NULL REFERENCES User(id),
    Registration_No     BIGINT NOT NULL,
    group_id            INTEGER NOT NULL REFERENCES Student_grouping(id),
    bio                 VARCHAR(10000)
);

CREATE TABLE Mail (
    id                  SERIAL PRIMARY KEY,
    title               VARCHAR(2000) NOT NULL,
    subject             VARCHAR(2000),
    destination_id      INTEGER NOT NULL REFERENCES User(id),
    mail                TEXT NOT NULL,
    sender_id           INTEGER NOT NULL REFERENCES User(id)
);

CREATE TABLE Mail_Tracker (
    id                      SERIAL PRIMARY KEY,
    tracking_id             INTEGER NOT NULL REFERENCES Mail(id),
    currently_with_id       INTEGER NOT NULL REFERENCES User(id),
    delivered               BOOLEAN NOT NULL DEFAULT FALSE,
    history_and_comments    TEXT NOT NULL
);

