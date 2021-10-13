INSERT INTO `db_patrimonio_inmobiliario`.`tbl_tipo_usuario`
(`tipo_usuario`)VALUES
("propietario"),
("inquilino");


INSERT INTO `db_patrimonio_inmobiliario`.`tbl_usuarios`
(`documento`,`nombre`,`correo`,`id_tipo_usuario`)
VALUES
("95258789","Juan","juan@Gmail.com",1),
("1101569874","Maria","maria@Gmail.com",2),
("13569874","Pedro","pedro@Gmail.com",1),
("1100987456","Pablo","pablo@Gmail.com",1),
("1014587896","Jacinto","jacinto@Gmail.com",2),
("254587896","Luisa","luisa@Gmail.com",2);


INSERT INTO `db_patrimonio_inmobiliario`.`tbl_departamento`
(`nombre`)
VALUES
("cundinamarca"),
("santander"),
("boyacá"),
("atlántico"),
("cesar"),
("antioquia");


INSERT INTO `db_patrimonio_inmobiliario`.`tbl_ciudad`
(
`nombre`,
`id_departamento`)
VALUES
("Bogotá",1),
("Bucaramanga",2),
("Tunja",3),
("Barranquilla",4),
("Medellin",5);


INSERT INTO `db_patrimonio_inmobiliario`.`tbl_vivienda`
(`calle`,`numero`,`descripcion`,`cantidad_personas`,`id_ciudad`)
VALUES
("64-25 sur",237,"apartamento",3,1),
("cra 20-32",2598,"casa",4,2),
("cra 25-32 ",3,"casa",5,4),
("cra 58-14",312,"apartamento",1,5);


INSERT INTO `db_patrimonio_inmobiliario`.`tbl_alquileres`
(`fecha_inicio`,`fecha_fin`,`canon_mensual`,`id_usuario`,`id_vivienda`)
VALUES
(NOW(),
DATE_ADD(NOW(), INTERVAL 364 DAY),
800000,2,1),
(NOW(),
DATE_ADD(NOW(), INTERVAL 364 DAY),
550000,5,2),
(NOW(),
DATE_ADD(NOW(), INTERVAL 364 DAY),
750000,6,3);






















