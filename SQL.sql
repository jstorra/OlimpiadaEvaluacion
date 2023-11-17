DROP DATABASE IF EXISTS OlimpiadaEvaluacion;
CREATE DATABASE OlimpiadaEvaluacion;
USE OlimpiadaEvaluacion;

CREATE TABLE sedes (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numComplejos INT NOT NULL,
    presupuesto DOUBLE NOT NULL
);

CREATE TABLE polideportivos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    localizacion VARCHAR(255) NOT NULL,
    areaTotal DOUBLE NOT NULL,
    sede_id INT NOT NULL
);

CREATE TABLE personas (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('jefe','comisario') NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(50) NOT NULL UNIQUE,
    rol VARCHAR(50)
);

CREATE TABLE deportivos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    deporte VARCHAR(50) NOT NULL UNIQUE,
    localizacion VARCHAR(255) NOT NULL,
    areaTotal DOUBLE NOT NULL,
    jefe_id INT NOT NULL,
    polideportivo_id INT NOT NULL
);

CREATE TABLE equipamientos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    equipo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE eventosDeportivo (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    duracion TIME NOT NULL,
    numParticipantes INT NOT NULL,
    numComisarios INT NOT NULL,
    deportivo_id INT NOT NULL,
    equipamiento_id INT NOT NULL
);

CREATE TABLE eventosPolideportivo (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    duracion TIME NOT NULL,
    numParticipantes INT NOT NULL,
    numComisarios INT NOT NULL,
    polideportivo_id INT NOT NULL,
    equipamiento_id INT NOT NULL
);

CREATE TABLE comisario_eventoDeportivo (
    comisario_id INT NOT NULL,
    evento_id INT NOT NULL,
    PRIMARY KEY (comisario_id, evento_id)
);

CREATE TABLE comisario_eventoPolideportivo (
    comisario_id INT NOT NULL,
    evento_id INT NOT NULL,
    PRIMARY KEY (comisario_id, evento_id)
);

-- FOREIGN KEYS
ALTER TABLE polideportivos ADD CONSTRAINT FK_Poli_Sede_id FOREIGN KEY (sede_id) REFERENCES sedes (id);

ALTER TABLE deportivos ADD CONSTRAINT FK_Deport_Jefe_id FOREIGN KEY (jefe_id) REFERENCES personas (id);
ALTER TABLE deportivos ADD CONSTRAINT FK_Deport_Deportivo_id FOREIGN KEY (polideportivo_id) REFERENCES polideportivos (id);

ALTER TABLE eventosPolideportivo ADD CONSTRAINT FK_EP_polideportivo_id FOREIGN KEY (polideportivo_id) REFERENCES polideportivos (id);
ALTER TABLE eventosPolideportivo ADD CONSTRAINT FK_EP_equipamiento_id FOREIGN KEY (equipamiento_id) REFERENCES equipamientos (id);

ALTER TABLE eventosDeportivo ADD CONSTRAINT FK_ED_deportivo_id FOREIGN KEY (deportivo_id) REFERENCES deportivos (id);
ALTER TABLE eventosDeportivo ADD CONSTRAINT FK_ED_equipamiento_id FOREIGN KEY (equipamiento_id) REFERENCES equipamientos (id);

ALTER TABLE comisario_eventoDeportivo ADD CONSTRAINT FK_ComiDep_comisario_id FOREIGN KEY (comisario_id) REFERENCES personas (id);
ALTER TABLE comisario_eventoDeportivo ADD CONSTRAINT FK_ComiDep_evento_id FOREIGN KEY (evento_id) REFERENCES eventosDeportivo (id);

ALTER TABLE comisario_eventoPolideportivo ADD CONSTRAINT FK_ComiPoli_comisario_id FOREIGN KEY (comisario_id) REFERENCES personas (id);
ALTER TABLE comisario_eventoPolideportivo ADD CONSTRAINT FK_ComiPoli_evento_id FOREIGN KEY (evento_id) REFERENCES eventosPolideportivo (id);