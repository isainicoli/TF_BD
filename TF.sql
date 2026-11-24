-- Grupo: 4
-- Matrícula 26108243 - Amanda Steglich de Oliveira
-- Matrícula 26107835 - Isadora Ivaniski Nicoli


CREATE TABLE Aeronave (
    prefixoAeronave VARCHAR2(25) NOT NULL,
    modelo VARCHAR2(25) NOT NULL,
    capacidade NUMBER(4) NOT NULL
);

ALTER TABLE Aeronave ADD CONSTRAINT PK_Aeronave PRIMARY KEY (prefixoAeronave);


CREATE TABLE Assento (
    prefixoAeronave VARCHAR2(25) NOT NULL,
    nroAssento VARCHAR2(4) NOT NULL,
    classe VARCHAR2(25) NOT NULL
);

ALTER TABLE Assento ADD CONSTRAINT PK_Assento PRIMARY KEY (prefixoAeronave, nroAssento);


CREATE TABLE Destino (
    IDDestino VARCHAR2(25) NOT NULL,
    pais VARCHAR2(25) NOT NULL,
    cidade VARCHAR2(25) NOT NULL,
    aeroportoDestino VARCHAR2(25) NOT NULL
);

ALTER TABLE Destino ADD CONSTRAINT PK_Destino PRIMARY KEY (IDDestino);


CREATE TABLE Passageiro (
    CPFPassageiro VARCHAR2(11) NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    dataNascimento DATE NOT NULL
);

ALTER TABLE Passageiro ADD CONSTRAINT PK_Passageiro PRIMARY KEY (CPFPassageiro);


CREATE TABLE Telefone (
    nroTelefone VARCHAR2(20) NOT NULL,
    CPFPassageiro VARCHAR2(11) NOT NULL
);

ALTER TABLE Telefone ADD CONSTRAINT PK_Telefone PRIMARY KEY (nroTelefone, CPFPassageiro);


CREATE TABLE Voo (
    codVoo VARCHAR2(25) NOT NULL,
    dataVoo DATE NOT NULL, 
    horaPartida TIMESTAMP NOT NULL,
    horaChegada TIMESTAMP NOT NULL,
    origem VARCHAR2(25) NOT NULL,
    IDDestino VARCHAR2(25) NOT NULL,
    prefixoAeronave VARCHAR2(25) NOT NULL
);

ALTER TABLE Voo ADD CONSTRAINT PK_Voo PRIMARY KEY (codVoo);


CREATE TABLE Reserva (
    codReserva VARCHAR2(25) NOT NULL,
    valor NUMBER(8,2) NOT NULL,
    dataReserva DATE NOT NULL,
    dataCheckIn DATE NOT NULL,
    portaoEmbarque VARCHAR2(25) NOT NULL,
    numeroBagagem NUMBER(4) NOT NULL,
    CPFPassageiro VARCHAR2(11) NOT NULL,
    codVoo VARCHAR2(25) NOT NULL,
    prefixoAeronave VARCHAR2(25) NOT NULL,
    nroAssento VARCHAR2(4) NOT NULL
);

ALTER TABLE Reserva ADD CONSTRAINT PK_Reserva PRIMARY KEY (codReserva);

ALTER TABLE Assento ADD CONSTRAINT FK_Assento_0 FOREIGN KEY (prefixoAeronave) REFERENCES Aeronave (prefixoAeronave);

ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_0 FOREIGN KEY (CPFPassageiro) REFERENCES Passageiro (CPFPassageiro);

ALTER TABLE Voo ADD CONSTRAINT FK_Voo_0 FOREIGN KEY (IDDestino) REFERENCES Destino (IDDestino);
ALTER TABLE Voo ADD CONSTRAINT FK_Voo_1 FOREIGN KEY (prefixoAeronave) REFERENCES Aeronave (prefixoAeronave);

ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_0 FOREIGN KEY (CPFPassageiro) REFERENCES Passageiro (CPFPassageiro);
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_1 FOREIGN KEY (codVoo) REFERENCES Voo (codVoo);
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2 FOREIGN KEY (prefixoAeronave, nroAssento) REFERENCES Assento (prefixoAeronave, nroAssento);

--------------------------------------------------------------------------------------------------------------------------------------------------

--Inserindo na tabela Aeronave:
insert into Aeronave (prefixoAeronave, modelo, capacidade) values ('1', 'Airbus A320', 200);
insert into Aeronave (prefixoAeronave, modelo, capacidade) values ('2', 'Boeing 737', 250);
insert into Aeronave (prefixoAeronave, modelo, capacidade) values ('3', 'Embraer E175', 85);
insert into Aeronave (prefixoAeronave, modelo, capacidade) values ('4', 'ATR 42-600', 50);
insert into Aeronave (prefixoAeronave, modelo, capacidade) values ('5', 'Airbus A380', 850);


--Inserindo na tabela Assento:
insert into Assento (prefixoAeronave, nroAssento, classe) values ('1', '22', 'Executiva');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('1', '15', 'Primeira Classe');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('2', '11', 'Econômica');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('2', '38', 'Primeira Classe');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('3', '5', 'Executiva');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('3', '72', 'Econômica');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('4', '48', 'Primeira Classe');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('4', '23', 'Econômica');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('5', '1', 'Executiva');
insert into Assento (prefixoAeronave, nroAssento, classe) values ('5', '76', 'Primeira Classe');


--Inserindo na tabela Destino:
insert into Destino (IDDestino, pais, cidade, aeroportoDestino) values ('1', 'Brasil', 'São Paulo', 'Guarulhos (GRU)');
insert into Destino (IDDestino, pais, cidade, aeroportoDestino) values ('2', 'Brasil', 'Rio de Janeiro', 'Galeão (GIG)');
insert into Destino (IDDestino, pais, cidade, aeroportoDestino) values ('3', 'Portugal', 'Lisboa', 'Humberto Delgado (LIS)');
insert into Destino (IDDestino, pais, cidade, aeroportoDestino) values ('4', 'Argentina', 'Buenos Aires', 'Ezeiza (EZE)');
insert into Destino (IDDestino, pais, cidade, aeroportoDestino) values ('5', 'Chile', 'Santiago', 'Arturo Merino Benítez');


--Inserindo na tabela Passageiro:
insert into Passageiro (CPFPassageiro, nome, email, dataNascimento) values ('11111111111', 'Ana Souza', 'ana.souza@email.com', DATE '1995-03-14');
insert into Passageiro (CPFPassageiro, nome, email, dataNascimento) values ('22222222222', 'Bruno Lima', 'bruno.lima@email.com', DATE '1988-07-22');
insert into Passageiro (CPFPassageiro, nome, email, dataNascimento) values ('33333333333', 'Carla Mendes', 'carla.mendes@email.com', DATE '2001-11-05');
insert into Passageiro (CPFPassageiro, nome, email, dataNascimento) values ('44444444444', 'Diego Ferreira', 'diego.ferreira@email.com', DATE '1979-01-30');
insert into Passageiro (CPFPassageiro, nome, email, dataNascimento) values ('55555555555', 'Elisa Rocha', 'elisa.rocha@email.com', DATE '1992-09-18');


--Inserindo na tabela Telefone:
insert into Telefone (nroTelefone, CPFPassageiro) values ('51911111111', '11111111111');
insert into Telefone (nroTelefone, CPFPassageiro) values ('51922222222', '11111111111');
insert into Telefone (nroTelefone, CPFPassageiro) values ('21966666666', '44444444444');
insert into Telefone (nroTelefone, CPFPassageiro) values ('51933333333', '22222222222');
insert into Telefone (nroTelefone, CPFPassageiro) values ('21944444444', '33333333333');
insert into Telefone (nroTelefone, CPFPassageiro) values ('51977777777', '33333333333');
insert into Telefone (nroTelefone, CPFPassageiro) values ('51955555555', '33333333333');
insert into Telefone (nroTelefone, CPFPassageiro) values ('51999999999', '44444444444');
insert into Telefone (nroTelefone, CPFPassageiro) values ('51988888888', '55555555555');


--Inserindo na tabela Voo:
insert into Voo (codVoo, dataVoo, horaPartida, horaChegada, origem, IDDestino, prefixoAeronave)
    values ('101', DATE '2026-12-10', TIMESTAMP '2026-12-10 08:00:00', TIMESTAMP '2026-12-10 09:30:00', 'Porto Alegre', '1', '1');
insert into Voo (codVoo, dataVoo, horaPartida, horaChegada, origem, IDDestino, prefixoAeronave)
    values ('102', DATE '2026-12-10', TIMESTAMP '2026-12-10 14:30:00', TIMESTAMP '2026-12-10 16:15:00', 'Porto Alegre', '2', '2');
insert into Voo (codVoo, dataVoo, horaPartida, horaChegada, origem, IDDestino, prefixoAeronave)
    values ('103', DATE '2026-12-12', TIMESTAMP '2026-12-12 09:00:00', TIMESTAMP '2026-12-12 21:30:00', 'São Paulo', '3', '5');
insert into Voo (codVoo, dataVoo, horaPartida, horaChegada, origem, IDDestino, prefixoAeronave)
    values ('104', DATE '2026-12-15', TIMESTAMP '2026-12-15 07:45:00', TIMESTAMP '2026-12-15 09:10:00', 'Porto Alegre', '1', '3');
insert into Voo (codVoo, dataVoo, horaPartida, horaChegada, origem, IDDestino, prefixoAeronave)
    values ('105', DATE '2026-12-18', TIMESTAMP '2026-12-18 18:00:00', TIMESTAMP '2026-12-18 20:20:00', 'Rio de Janeiro', '4', '4');
insert into Voo (codVoo, dataVoo, horaPartida, horaChegada, origem, IDDestino, prefixoAeronave)
    values ('106', DATE '2026-12-20', TIMESTAMP '2026-12-20 11:00:00', TIMESTAMP '2026-12-20 13:30:00', 'Porto Alegre', '5', '2');


--Inserindo na tabela Reserva:
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('1', 450.00, DATE '2026-11-01', DATE '2026-12-09', 'A12', 1, '11111111111', '101', '1', '22');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('2', 450.00, DATE '2026-11-02', DATE '2026-12-09', 'A12', 2, '22222222222', '101', '1', '15');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('3', 620.50, DATE '2026-11-05', DATE '2026-12-10', 'B03', 1, '44444444444', '102', '2', '11');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('4', 3200.00, DATE '2026-11-10', DATE '2026-12-11', 'C01', 2, '33333333333', '103', '5', '1');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('5', 3200.00, DATE '2026-11-10', DATE '2026-12-11', 'C01', 1, '44444444444', '103', '5', '76');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('6', 380.90, DATE '2026-11-12', DATE '2026-12-14', 'A05', 0, '55555555555', '104', '3', '5');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('7', 890.00, DATE '2026-11-15', DATE '2026-12-17', 'D02', 1, '22222222222', '105', '4', '48');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('8', 980.00, DATE '2026-11-16', DATE '2026-12-17', 'D02', 2, '33333333333', '105', '4', '23');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('9', 710.00, DATE '2026-11-18', DATE '2026-12-19', 'B07', 1, '44444444444', '106', '2', '11');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('10', 710.00, DATE '2026-11-18', DATE '2026-12-19', 'B07', 1, '55555555555', '106', '2', '38');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('11', 620.50, DATE '2026-11-06', DATE '2026-12-10', 'B03', 2, '33333333333', '102', '2', '38');
insert into Reserva (codReserva, valor, dataReserva, dataCheckIn, portaoEmbarque, numeroBagagem, CPFPassageiro, codVoo, prefixoAeronave, nroAssento)
    values ('12', 380.90, DATE '2026-11-13', DATE '2026-12-14', 'A05', 1, '11111111111', '104', '3', '72');

commit;


--Buscando nome do Passageiro e o nroAssento do Assento, passando por Reserva para conectar Passageiro -> Assento
select p.nome, r.nroAssento
from Passageiro p
inner join Reserva r
on p.CPFPassageiro = r.CPFPassageiro;


--Buscando a data da Reserva, ID do destino do Voo e o país e cidade do Destino:
select r.dataReserva, v.IDDestino, d.pais, d.cidade
from Reserva r
inner join Voo v
on r.codVoo = v.codVoo
inner join Destino d
on v.IDDestino = d.IDDestino;


--Buscando com subconsulta não-correlacionada:
--CPFs e telefones dos passageiros que fizeram a reserva de maior valor. 
select t.CPFPassageiro, t.nroTelefone
from Telefone t
where t.CPFPassageiro in (select CPFPassageiro from Reserva
                          where valor = (select max(valor)
                                         from Reserva));

--Busca com operador INTERSECT:
--CPFs dos passageiros que estão cadastrados e que também possuem telefone, em ordem crescente.
select CPFPassageiro
from Passageiro
intersect
select CPFPassageiro
from Telefone
order by CPFPassageiro;

--Buscando com filtro na tabela Aeronave:
--Modelo e capacidade das aeronaves que tem capacidade igual ou superior a 100, retornando em ordem decrescente.
select modelo, capacidade
from Aeronave 
where capacidade >= 100
order by capacidade desc;

--Buscando com filtro na tabela Assento:
--Prefixo da aeronave e nro do assento onde a classe dos assentos é igual a "Primeira Classe".
select prefixoaeronave, nroAssento
from Assento
where classe like '%Primeira Classe%';

--Buscando com filtro na tabela Destino:
--Aeroporto do destino, país e cidade do destino que tem seu ID diferente de 4. 
select aeroportoDestino, pais, cidade
from Destino
where IDDestino != '4';

--Buscando com filtro na tabela Passageiro:
--CPF e data de nascimento dos passageiros que nasceram depois de 1990.
select CPFPassageiro, dataNascimento
from Passageiro
where dataNascimento > TO_DATE('01/01/1990', 'DD/MM/YYYY');

--Buscando com filtro na tabela Telefone:
--Telefones da passageira Carla Mendes e do passageiro Diego Ferreira
select nroTelefone, CPFPassageiro
from Telefone
where CPFPassageiro = '33333333333' or CPFPassageiro = '44444444444';

--Buscando com filtro na tabela Voo:
--Código do voo, data e a hora da partida, de todos os voos com seus códigos entre 102 e 106.
select codVoo, dataVoo, horaPartida
from Voo
where codVoo between '102' and '106';

--Buscando com filtro na tabela Reserva:
--Valor mínimo e valor máximo das reservas, sendo consideradas as que tem valor maior que 500, agrupando pelo Código da reserva.
select min(valor), max(valor)
from Reserva
where valor > 500
group by codReserva;


--drop table Reserva;
--drop table Voo;
--drop table Telefone;
--drop table Passageiro;
--drop table Destino;
--drop table Assento;
--drop table Aeronave;
