-- -----------------------------------------------------
-- Consultas a una sola tabla
-- -----------------------------------------------------

SELECT * FROM db_patrimonio_inmobiliario.tbl_tipo_usuario;
SELECT * FROM db_patrimonio_inmobiliario.tbl_usuarios;
SELECT * FROM db_patrimonio_inmobiliario.tbl_departamento;
SELECT * FROM db_patrimonio_inmobiliario.tbl_ciudad;
SELECT * FROM db_patrimonio_inmobiliario.tbl_vivienda;
SELECT * FROM db_patrimonio_inmobiliario.tbl_alquileres;

-- -----------------------------------------------------
-- Consultas multi tabla
-- -----------------------------------------------------

-- consultar fecha inicio y fin y el valor de un arriendo y a que persona pertence el arriendo

select tbl_alquileres.fecha_inicio,tbl_alquileres.fecha_fin,tbl_alquileres.canon_mensual,
		tbl_usuarios.documento, tbl_usuarios.nombre
from tbl_alquileres inner join tbl_usuarios
on tbl_alquileres.id_usuario = tbl_usuarios.id_usuario;  

-- consultar en que departamento, ciudad, direccion esta ubicada la casa

select tbl_vivienda.calle, tbl_vivienda.numero, tbl_vivienda.descripcion,
		tbl_ciudad.nombre,
        tbl_departamento.nombre
from tbl_vivienda inner join tbl_ciudad
on tbl_vivienda.id_ciudad = tbl_ciudad.id_ciudad
inner join tbl_departamento
on tbl_ciudad.id_departamento = tbl_departamento.id_departamento;

-- consultar fecha inicio y fin y el valor de un arriendo direccion completa del inmueble y el tipo de inmueble y quien es el inquilino    

select tbl_alquileres.fecha_inicio,tbl_alquileres.fecha_fin,tbl_alquileres.canon_mensual,
		tbl_usuarios.documento, tbl_usuarios.nombre, 
         tbl_tipo_usuario.tipo_usuario,
        tbl_vivienda.calle, tbl_vivienda.numero, tbl_ciudad.nombre,
        tbl_vivienda.descripcion      
from tbl_alquileres  inner join tbl_usuarios
on tbl_alquileres.id_usuario = tbl_usuarios.id_usuario
inner join tbl_vivienda on tbl_alquileres.id_vivienda = tbl_vivienda.id_vivienda
inner join tbl_ciudad on tbl_vivienda.id_ciudad = tbl_ciudad.id_ciudad
inner join tbl_tipo_usuario ON tbl_usuarios.id_tipo_usuario = tbl_tipo_usuario.id_tipo_usuario   
where tbl_tipo_usuario.id_tipo_usuario = 2;
     
      

-- consultar todos los propietarios de inmuebles
SELECT 
    tbl_usuarios.nombre, tbl_tipo_usuario.tipo_usuario
FROM
	tbl_usuarios
        INNER JOIN
    tbl_tipo_usuario ON tbl_usuarios.id_tipo_usuario = tbl_tipo_usuario.id_tipo_usuario
WHERE
    tbl_tipo_usuario.id_tipo_usuario = 1; 

-- consultar todos los arrendatarios de inmuebles

SELECT 
    tbl_usuarios.nombre, tbl_tipo_usuario.tipo_usuario
FROM
	tbl_usuarios
        INNER JOIN
    tbl_tipo_usuario ON tbl_usuarios.id_tipo_usuario = tbl_tipo_usuario.id_tipo_usuario
WHERE
    tbl_tipo_usuario.id_tipo_usuario = 2; 
 

-- -----------------------------------------------------
-- Actualizaciones a las tablas
-- -----------------------------------------------------

-- actualizar el cannon de un alquiler
UPDATE tbl_alquileres SET canon_mensual = 350000 WHERE id_alquiler = 2; 


-- actualizar el nombre de un usuario
UPDATE tbl_usuarios SET nombre='Pedro Actualizado' WHERE id_usuario = 1;


-- -----------------------------------------------------
-- Borrrar registros de una tabla
-- -----------------------------------------------------
-- eliminar alquiler
DELETE FROM tbl_alquileres WHERE id_alquiler =2;

-- eliminar un usuario del sistema
DELETE FROM tbl_usuarios WHERE id_usuario =2;

select * from information_schema.tables
where table_schema = 'db_patrimonio_inmobiliario'
and table_name like 'tbl_alquileres';


