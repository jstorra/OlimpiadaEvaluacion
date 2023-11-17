USE OlimpiadaEvaluacion;

INSERT INTO sedes VALUES (1, 5, 1500000.00),
                         (2, 10, 2500000.00);

INSERT INTO polideportivos VALUES (1, 'La Españolita', 100.5, 1),
                                  (2, 'La Argentina', 510.6, 2);
                    
INSERT INTO personas VALUES (1, 'jefe', 'Raul', 'Gomez', '284383258', 'raul@gmail.com', null),
                            (2, 'jefe', 'Juan', 'Torra', '823582855', 'torra@gmail.com', null),
                            (3, 'comisario', 'Kevin', 'Ramirez', '929595267', 'kevin@gmail.com', 'juez'),
                            (4, 'comisario', 'Violeta', 'Perez', '914998500', 'violeta@gmail.com', 'juez'),
                            (5, 'comisario', 'Miguel', 'Castro', '120250929', 'miguel@gmail.com', 'observador'),
                            (6, 'comisario', 'Jaider', 'Mendoza', '029509599', 'jaider@gmail.com', 'observador');

INSERT INTO deportivos VALUES (1, 'baseball', 'Flor de Mar', 200.10, 1, 1),
                              (2, 'basketball', 'Tigres Azules', 50.1, 2, 2);

INSERT INTO equipamientos VALUES (1, 'Arcos'),
                                 (2, 'Barras paralelas');


INSERT INTO eventosDeportivo VALUES (1, '2023-11-10', '01:50:00', 10, 5, 1, 1),
                                    (2, '2023-09-27', '03:00:00', 40, 10, 2, 2);

INSERT INTO eventosPolideportivo VALUES (1, '2023-12-07', '02:00:00', 16, 7, 1, 1),
                                        (2, '2023-08-18', '00:50:00', 30, 15, 2, 2);

INSERT INTO comisario_eventoDeportivo VALUES (3, 1),
                                             (4, 2);

INSERT INTO comisario_eventoPolideportivo VALUES (5, 1),
                                                 (6, 2);