-- creating the database

CREATE DATABASE timeitBank;

--using the database

use timeitBank;

--creating tables
CREATE TABLE usuario (
  id_usuario INT NOT NULL, 
  nombres VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  fechaNacimineto DATE NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  celular VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_usuario)
);

CREATE TABLE oferta(
	id_oferta INT NOT NULL,
  id_usuario INT NOT NULL,
  descripcion VARCHAR(400)NOT NULL,
  fechaCreacion DATE NOT NULL,
  PRIMARY KEY (id_oferta),
  
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
  ON DELETE CASCADE
  ON UPDATE CASCADE 
);

CREATE TABLE categoria(
	id_categoria INT,
  descripcion VARCHAR(200),
  PRIMARY KEY (id_categoria)
);


CREATE TABLE oferta_categoria(
  id_oferta_categoria INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  id_oferta INT NOT NULL,
  PRIMARY KEY(id_oferta_categoria),
  
  FOREIGN KEY (id_oferta) REFERENCES oferta(id_oferta)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


CREATE TABLE tiempo (
  id_tiempo INT NOT NULL,
  id_usuario INT NOT NULL,
  valorTiempo INT NOT NULL,
  PRIMARY KEY(id_tiempo),
  
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
  ON DELETE CASCADE
  ON UPDATE CASCADE 
);


CREATE TABLE calificacion (
	id_calificacion INT NOT NULL,
  id_usuario INT NOT NULL,
  valorCalificacion INT NOT NULL,
  PRIMARY KEY(id_calificacion),
  
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


CREATE TABLE solicitud (
  id_solicitud INT,
  id_oferta INT,
  id_usuario INT,
  tiempoOferta INT,
  descripcion VARCHAR(400),
  estado BOOLEAN,
  fechaSolicitud DATETIME,
  PRIMARY KEY(id_solicitud),
  
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
  ON DELETE CASCADE
  ON UPDATE CASCADE, 
  
  FOREIGN KEY (id_oferta) REFERENCES oferta(id_oferta)
  ON DELETE CASCADE
  ON UPDATE CASCADE 
);


CREATE TABLE transaccion (
  id_transaccion INT NOT NULL,
  id_solicitud INT NOT NULL,
  fechaTransaccion INT NOT NULL,
  PRIMARY KEY (id_transaccion),
  
  FOREIGN KEY (id_solicitud) REFERENCES solicitud(id_solicitud)
  ON DELETE CASCADE
  ON UPDATE CASCADE 
);