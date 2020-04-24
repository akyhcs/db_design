--CREATE DATABASE
CREATE DATABASE MOVIE_DATABASE;
Go
USE MOVIE_DATABASE;
--CREATE TABLE MOVIE--1
CREATE TABLE movie 
    (
        mov_id INT NOT NULL PRIMARY KEY,
        mov_title VARCHAR(50),
        mov_year INT,
        mov_time INT,
        mov_lang VARCHAR(50),
        mov_release_date DATE,
        mov_release_country VARCHAR(5)
    );
    GO
CREATE TABLE actors ---2
    (
        act_id INT NOT NULL PRIMARY KEY,
        first_name VARCHAR(20),
        last_name VARCHAR(20),
        gender VARCHAR(1)
    );
    GO
CREATE TABLE director ---3
    (
        dir_id INT NOT NULL PRIMARY KEY,
        first_name VARCHAR(20),
        last_name VARCHAR(20),
        
    );
    GO
CREATE TABLE reviewer --4
    (
        rev_id INT NOT NULL PRIMARY KEY,
        rev_name VARCHAR(30),
    );
GO
CREATE TABLE generes --5
    (
        gen_id INT NOT NULL PRIMARY KEY,
        gen_title VARCHAR(20),
    );
CREATE TABLE movie_cast --6
    (
        act_fk INT NOT NULL , 
        mov_fk INT NOT NULL ,
    );
GO

CREATE TABLE movie_direction ---7
    (
        dir_fk INT NOT NULL , 
        mov_fk INT NOT NULL  ,
        CONSTRAINT director_dir_id_fk FOREIGN KEY(dir_fk) REFERENCES director(dir_id),
        CONSTRAINT movie_mov_id_fk FOREIGN KEY(mov_fk) REFERENCES movie(mov_id)
    );
GO
--ALTER TABLE  movie_direction ADD CONSTRAINT director_dir_id_fk FOREIGN KEY(dir_fk) REFERENCES director(dir_id);
--ALTER TABLE movie_direction ADD CONSTRAINT movie_mov_id_fk FOREIGN KEY(mov_fk) REFERENCES movie(mov_id);

CREATE TABLE movie_genres   ---8
    (
        gen_fk INT NOT NULL , 
        mov_fk INT NOT NULL  ,
       CONSTRAINT generes_gen_id_fk FOREIGN KEY(gen_fk) REFERENCES generes(gen_id),
       CONSTRAINT movie_mov_id_fk FOREIGN KEY(mov_fk) REFERENCES movie(mov_id)
    );
GO
--ALTER TABLE movie_genres ADD  FOREIGN KEY(gen_fk) REFERENCES generes(gen_id),
 --                          FOREIGN KEY(mov_fk) REFERENCES movie(mov_id);
                            
CREATE TABLE rating 
    (
        mov_fk INT NOT NULL,
        rev_fk INT NOT NULL,
        rev_star FLOAT,
        num_o_rating INT,
        CONSTRAINT movie_mov_id_fk FOREIGN KEY(mov_fk) REFERENCES movie(mov_id),
        CONSTRAINT reviewer_rev_id_fk FOREIGN KEY(rev_fk) REFERENCES reviewer(rev_id)
    );
    GO