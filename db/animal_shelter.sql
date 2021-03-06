DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  preferences VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  sex VARCHAR(255),
  age VARCHAR(255),
  image_url VARCHAR(255),
  admission_date DATE,
  adoption_case VARCHAR(255),
  adoption_date DATE,
  owner_id INT4 REFERENCES owners(id)
);
