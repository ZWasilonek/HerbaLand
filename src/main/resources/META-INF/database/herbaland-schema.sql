drop database if exists herbaland;
create database herbaland char set utf8mb4 collate utf8mb4_unicode_ci;

USE herbaland;

create table `users` (
	id int AUTO_INCREMENT NOT NULL,
    email varchar(50) NOT NULL,
    first_name varchar(20) NOT NULL,
    last_name varchar(50) NOT NULL,
    password varchar(200) NOT NULL,
    is_enabled BIT NOT NULL,

    PRIMARY KEY(id)
);

create table `polish_plant_description` (
  id INT NOT NULL AUTO_INCREMENT,
  name NVARCHAR(100) NOT NULL,
  family NVARCHAR(100) NOT NULL,
  type NVARCHAR(30) NOT NULL,
  species NVARCHAR(200) NOT NULL,
  raw_material NVARCHAR(100) NOT NULL,
  active_compounds TEXT NOT NULL,
  plant_description TEXT NOT NULL,
  properties TEXT NOT NULL,
  traditional_use TEXT NOT NULL,
  contraindications TEXT,
  synonyms NVARCHAR(200),

  PRIMARY KEY(id)
);

create table `latin_plant_description` (
	id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  family VARCHAR(50) NOT NULL,
  type VARCHAR(30) NOT NULL,
  species VARCHAR(200) NOT NULL,
  raw_material VARCHAR(100) NOT NULL,
  properties VARCHAR(200),
  synonyms VARCHAR(200),

  PRIMARY KEY(id)
);

create table `files` (
	id INT NOT NULL AUTO_INCREMENT,
  file_name VARCHAR(100) NOT NULL,
  file_type VARCHAR(50) NOT NULL,
  size BIGINT NOT NULL,
  data LONGBLOB NOT NULL,

  PRIMARY KEY(id)
);

create table `medicinal_plants` (
  id INT NOT NULL AUTO_INCREMENT,
  polish_plant_id INT NOT NULL,
  latin_plant_id INT NOT NULL,
  file_id INT NOT NULL,
  bibliography TEXT,
  dataSourceLinks TEXT,

  PRIMARY KEY(id),
  CONSTRAINT polish_plant_id FOREIGN KEY (polish_plant_id)
    REFERENCES polish_plant_description(id),
  CONSTRAINT latin_plant_id FOREIGN KEY (latin_plant_id)
    REFERENCES latin_plant_description(id),
  FOREIGN KEY (file_id)
    REFERENCES files(id)
);

create table categories (
	id INT NOT NULL AUTO_INCREMENT,
  name NVARCHAR(100) NOT NULL UNIQUE,

  PRIMARY KEY(id)
);

create table `working_areas` (
	id INT NOT NULL AUTO_INCREMENT,
  name NVARCHAR(100) NOT NULL UNIQUE,

  PRIMARY KEY(id)
);

create table `diseases` (
	id INT NOT NULL AUTO_INCREMENT,
  name NVARCHAR(100) NOT NULL UNIQUE,

  PRIMARY KEY(id)
);

create table `disease_working_areas` (
  disease_id INT NOT NULL,
  working_area_id INT NOT NULL,

	FOREIGN KEY (working_area_id)
		REFERENCES working_areas(id) ON DELETE CASCADE,
	FOREIGN KEY (disease_id)
		REFERENCES diseases(id) ON DELETE CASCADE
);

create table diseases_categories (
  category_id INT NOT NULL,
  disease_id INT NOT NULL,

  FOREIGN KEY (category_id)
    REFERENCES categories(id) ON DELETE CASCADE,
  FOREIGN KEY (disease_id)
    REFERENCES diseases(id) ON DELETE CASCADE
);

create table plants_categories (
  id INT NOT NULL AUTO_INCREMENT,
  medicinal_plant_id INT NOT NULL,
  category_id INT NOT NULL,
  disease_id INT NOT NULL,
  working_area_id INT NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY (medicinal_plant_id)
    REFERENCES medicinal_plants(id),
  FOREIGN KEY (category_id)
    REFERENCES categories(id),
  FOREIGN KEY (disease_id)
    REFERENCES diseases(id),
  FOREIGN KEY (working_area_id)
    REFERENCES working_areas(id)
);

create table `authorizations` (
  id int AUTO_INCREMENT NOT NULL,
  name varchar(20) NOT NULL,

  PRIMARY KEY(id)
);

create table `users_authorizations` (
  user_id INT NOT NULL,
  authorization_id INT NOT NULL,

  FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (authorization_id)
    REFERENCES authorizations(id) ON DELETE CASCADE
);

create table `users_plants` (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  medicinal_plant_id INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (medicinal_plant_id) REFERENCES medicinal_plants(id) ON DELETE CASCADE
);