drop database TechSolutions;

create database TechSolutions;
 
use TechSolutions;

create table tb_cargos(
	id_cargo int primary key auto_increment,
    nombre_cargo varchar(32)
);

create table tb_departamentos(
	id_departamento int primary key auto_increment,
    nombre_departamento varchar(32)
);

create table tb_proyectos(
	id_proyecto int primary key auto_increment,
    nombre_proyecto varchar(255)
);

create table tb_empleados(
	id_empleado int primary key auto_increment,
    nombre varchar(64),
    apellido varchar(64),
    id_cargo int not null,
    salario decimal(8,2),
    fecha_ingreso date,
    id_departamento int not null,
    constraint fk_empleado_departamento foreign key (id_departamento) 
    references tb_departamentos(id_departamento),
    constraint fk_empleado_cargo foreign key (id_cargo) 
    references tb_cargos(id_cargo) 
);

create table tb_empleados_proyectos(
	id_empleado_proyecto int primary key auto_increment,
    id_empleado int not null,
    id_proyecto int not null,
    constraint fk_empleado_proyecto foreign key (id_empleado) references tb_empleados(id_empleado),
    constraint fk_proyecto_empleado foreign key (id_proyecto) references tb_proyectos(id_proyecto)
);
