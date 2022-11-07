-- inserção de dados e queries

use oficina;
show tables;

-- clients
-- idClient, Fname, Minit, Lname, Adress, CPF, Contact
insert into clients (Fname, Minit, Lname, Adress, CPF, Contact)
	values ('Maria','M','Silva', 'rua silva de prata 29, Carangola - Cidade das flores', 12346789012, 99914520315),
		   ('Matheus','O','Pimentel', 'rua alemeda 289, Centro - Cidade das flores', 98765432154, 99945108432),
		   ('Ricardo','F','Silva', 'avenida alemeda vinha 1009, Centro - Cidade das flores', 45678913354, 99485136547),
		   ('Julia','S','França', 'rua lareijras 861, Centro - Cidade das flores', 78912345602, 99845632187),
		   ('Roberta','G','Assis', 'avenida de koller 19, Centro - Cidade das flores', 98745631069, 99987462135),
		   ('Isabela','M','Cruz', 'rua alemeda das flores 28, Centro - Cidade das flores', 65478912374, 99845632103);

select * from clients;

-- mechanics
-- idMechanic, Fname, Minit, Lname, Adress, CPF, Contact, Specialty
insert into mechanics (Fname, Minit, Lname, Adress, CPF, Contact, Specialty)
	values ('Gabriela', 'D', 'Santos', 'rua bento gonçalvez 549, Periquitos - Cidade Especulativa', 21854563218, 99765436698, 'Elétrica'),
		   ('Lauren', 'F', 'Silva', 'rua arigatô 842, Centro - Cidade Especulativa', 78546231025, 99969965438, 'Elétrica'),
           ('Matheus', 'S', 'Borell', 'rua guerra junqueira 8842, Centro - Cidade Especulativa', 87456231564, 99786451236, 'Mecânica'),
           ('José', 'G', 'Freire', 'rua francisco josé 651, Centro - Cidade Especulativa', 21032645879, 99876969894, 'Hidráulica'),
           ('Claudia', 'W', 'Cardoso', 'rua manoel da silva 931 , Centro - Cidade Especulativa', 01236547896, 99856432954, 'Mecânica'),
           ('Gustavo', 'J', 'Farias', 'rua quatorze de abril 784 , Centro - Cidade Especulativa', 12364985630, 99987456103, 'Hidráulica');

select * from mechanics;

-- parts
-- idPart, PDescription, PPrice, Supplier, Stock
insert into parts (PDescription, PPrice, Supplier, Stock)
	values ('Arruela da parafuseta', 85.00, 'Fornecedor X', 666),
		   ('Parafuseta da arruela', 150.00, 'Fornecedor X', 300),
           ('Óleo de motor', 60.00, 'Fornecedor Y', 45),
           ('Pneu', 99.00, 'Fornecedor Z', 80),
           ('Bateria', 170.00, 'Fornecedor W', 50),
           ('Pastilha de freio', 80.00, 'Fornecedor W', 35);

select * from parts;

-- labor
-- idLabor, LDescription, LPrice
insert into labor (LDescription, LPrice)
	values ('Fazer algo', 50.00),
		   ('Apertar aquele lugar', 100.00),
           ('Trocar aquela peça', 75.00),
           ('Ligar aquilo naquele outro', 30.00),
           ('Ver se está tudo certo', 20.00),
           ('Rezar para que dê certo', 666.00);
           
select * from labor;

-- vehicles
-- idVehicle, idOwner, Plate, Model, Brand
insert into vehicles (idOwner, Plate, Model, Brand)
	values (1, 'abc1234', 'Modelo X', 'Marca Tal'),
		   (2, 'qwer123', 'Modelo X', 'Marca Tal'),
           (2, 'asdf321', 'Modelo Y', 'Marca 1'),
           (3, 'kdoa845', 'Modelo Z', 'Marca 2'),
           (4, 'oej7418', 'Modelo W', 'Marca 1'),
           (5, 'lfkd357', 'Modelo R', 'Marca Tal');
           
select * from vehicles;

-- workOrder
-- idWorkOrder, idVehicle, IssueDate, Autorization, ConclusionDate, WOStatus
insert into workOrder (idVehicle, IssueDate, Autorization, ConclusionDate, WOStatus)
	values (1, '2022-02-03', 'Autorizado', '2022-02-28', 'Finalizado'),
		   (1, '2022-04-26', 'Autorizado', '2022-05-10', 'Finalizado'),
           (3, '2021-03-20', default, null, 'Finalizado'),
           (2, '2022-05-11', 'Autorizado', null, 'Em andamento'),
           (5, '2022-01-01', default, null, default),
           (4, '2022-06-06', 'Autorizado', '2022-06-07', 'Finalizado');
           
select * from workOrder;

-- WOParts
-- idWOPWorkOrder, idWOPParts, PartsQuantity
insert into WOParts (idWOPWorkOrder, idWOPParts, PartsQuantity)
	values (1, 1, 2),
		   (2, 3, 1),
           (3, 2, 3),
           (4, 5, 2),
           (5, 1, 5),
           (6, 6, 1);
           
select * from WOParts;

-- WOLabor
-- idWOLWorkOrder, idWOLLabor, LaborHours
insert into WOLabor (idWOLWorkOrder, idWOLLabor, LaborHours)
	values (1, 3, 2),
		   (2, 1, 5),
           (3, 5, 4),
           (4, 3, 7),
           (5, 6, 1),
           (6, 2, 10);
           
select * from WOLabor;

-- teams
-- idTVehicle, idTMechanic, idTWorkOrder
insert into teams (idTVehicle, idTMechanic, idTWorkOrder)
	values (1, 1, 1),
		   (1, 2, 1),
           (5, 5, 3),
           (2, 3, 5),
           (6, 1, 6),
           (1, 2, 2);
           
select * from vehicles;
select * from workOrder;
select * from teams order by idTWorkOrder;

--
--
-- Queries

select count(*) from clients;

select * from vehicles;
select * from workOrder;
select * from vehicles v join workOrder w on v.idVehicle = w.idVehicle;

select * from clients;
select * from vehicles;
select * from clients c join vehicles v on c.idClient = v.idOwner;
select concat(Fname, ' ', Lname) CompleteName, CPF, Contact, Plate, Model from clients c join vehicles v on c.idClient = v.idOwner;

select concat(Fname, ' ', Lname) CompleteName, CPF, Contact, count(*) Number_of_cars from clients c join vehicles v on c.idClient = v.idOwner
	group by c.idClient;

select concat(Fname, ' ', Lname) CompleteName, CPF, Contact, count(*) Number_of_cars from clients c join vehicles v on c.idClient = v.idOwner
	group by c.idClient
    having count(*) > 1;

select * from workOrder;
select * from WOParts;
select * from workOrder, WOParts where idWorkOrder = idWOPWorkOrder;

-- Custo Total das peças por OS
select * from parts;
select idWorkOrder, idVehicle, PartsQuantity, idPart, PPrice, (PPrice*PartsQuantity) TotalCost from workOrder w 
	join WOParts wop on w.idWorkOrder = wop.idWOPWorkOrder
    join parts p on wop.idWOPParts = p.idPart
    group by w.idWorkOrder;
    
-- Custo Total da mão-de-obra por OS
select * from WOLabor;
select * from labor;
select idWorkOrder, idVehicle, idLabor, LDescription, LaborHours, LPrice, (LPrice*LaborHours) TotalCost from workOrder w 
	join WOLabor wol on w.idWorkOrder = wol.idWOLWorkOrder
    join labor l on wol.idWOLLabor = l.idLabor
    group by w.idWorkOrder;

-- Custo Total da OS
select idWorkOrder, idVehicle, ((LPrice*LaborHours)+(PPrice*PartsQuantity)) TotalCost from workOrder w 
	join WOLabor wol on w.idWorkOrder = wol.idWOLWorkOrder
    join labor l on wol.idWOLLabor = l.idLabor
    join WOParts wop on w.idWorkOrder = wop.idWOPWorkOrder
    join parts p on wop.idWOPParts = p.idPart
    group by w.idWorkOrder;