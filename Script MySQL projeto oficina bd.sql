-- criação do banco de dados para o cenário de Oficina mecânica

drop database oficina;

show databases;
create database oficina;
use oficina;

-- criar tabela cliente

create table clients(
	idClient int auto_increment primary key not null,
    Fname varchar(15) not null,
    Minit varchar(3),
    Lname varchar(20) not null,
    Adress varchar(255) not null,
    CPF char(11) not null,
    Contact char(11) not null,
    constraint unique_id_client unique (idClient),
    constraint unique_cpf_client unique (CPF)
) auto_increment=1;

-- criar tabela mecânicos

create table mechanics(
	idMechanic int auto_increment primary key not null,
    Fname varchar(15) not null,
    Minit varchar(3),
    Lname varchar(20) not null,
    Adress varchar(255) not null,
    CPF char(11) not null,
    Contact char(11) not null,
    Specialty enum('Mecânica', 'Elétrica', 'Hidráulica') not null,
    constraint unique_id_mechanic unique (idMechanic),
    constraint unique_cpf_mechanic unique (CPF)
) auto_increment=1;

-- criar tabela peças

create table parts(
	idPart int auto_increment primary key not null,
    PDescription varchar(255) not null,
    PPrice float not null,
    Supplier varchar(255) not null,
    Stock int not null,
    constraint unique_id_part unique (idPart)
) auto_increment=1;

-- criar tabela mão-de-obra

create table labor(
	idLabor int auto_increment primary key not null,
    LDescription varchar(255) not null,
    LPrice float not null,
    constraint unique_id_labor unique (idLabor)
) auto_increment=1;

-- criar tabela veículo

create table vehicles(
	idVehicle int auto_increment primary key not null,
    idOwner int not null,
    Plate char(7) not null,
    Model varchar(45) not null,
    Brand varchar(45) not null,
    constraint fk_vehicles_clients foreign key (idOwner) references clients(idClient),
    constraint unique_id_vehicle unique (idVehicle),
    constraint unique_plate_vehicle unique (Plate)
) auto_increment=1;

-- criar tabela Ordem de Serviço

create table workOrder(
	idWorkOrder int auto_increment primary key not null,
    idVehicle int not null,
    IssueDate date not null,
    Autorization enum('Autorizado', 'Não autorizado') not null default 'Não autorizado',
    ConclusionDate date,
    WOStatus enum('Processando', 'Em andamento', 'Finalizado') not null default 'Processando',
    constraint fk_workorder_vehicles foreign key (idVehicle) references vehicles(idVehicle),
    constraint unique_id_workorder unique (idWorkOrder)
) auto_increment=1;

-- criar tabela Peças_OS

create table WOParts(
	idWOPWorkOrder int not null,
    idWOPParts int not null,
    PartsQuantity int not null,
    primary key (idWOPWorkOrder, idWOPParts),
    constraint fk_woparts_workorder foreign key (idWOPWorkOrder) references workOrder(idWorkOrder),
    constraint fk_woparts_parts foreign key (idWOPParts) references parts(idPart)
);

-- criar tabela Mão-de-obra_OS

create table WOLabor(
	idWOLWorkOrder int not null,
    idWOLLabor int not null,
    LaborHours float not null,
    primary key (idWOLWorkOrder, idWOLLabor),
    constraint fk_wolabor_workorder foreign key (idWOLWorkOrder) references workOrder(idWorkOrder),
    constraint fk_wolabor_labor foreign key (idWOLLabor) references labor(idLabor)
);

-- criar tabela Time_Execução/Avaliação

create table teams(
	idTVehicle int not null,
    idTMechanic int not null,
    idTWorkOrder int not null,
    primary key (idTVehicle, idTMechanic, idTWorkOrder),
    constraint fk_teams_vehicles foreign key (idTVehicle) references vehicles(idVehicle),
    constraint fk_teams_mechanics foreign key (idTMechanic) references mechanics(idMechanic),
    constraint fk_teams_workorder foreign key (idTWorkOrder) references workOrder(idWorkOrder)
);

show tables;

