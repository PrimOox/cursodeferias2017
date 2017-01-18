create sequence seq_TIME
minvalue 1 maxvalue 9999999999999999999999999999
start with 1 increment by 1
nocache;

create sequence seq_TECNICO
minvalue 1 maxvalue 9999999999999999999999999999
start with 1 increment by 1
nocache;

create sequence seq_JOGADOR
minvalue 1 maxvalue 9999999999999999999999999999
start with 1 increment by 1
nocache;

INSERT INTO time (id_time, nome) VALUES (SEQ_TIME.nextval,'BARCELONA');
INSERT INTO time (id_time, nome) VALUES (SEQ_TIME.nextval,'REAL MADRID');

INSERT INTO tecnico (id_tecnico, nome, dt_nascimento, salario) VALUES (SEQ_TECNICO.nextval,'DUNGA', '30-10-1970', 200);
INSERT INTO tecnico (id_tecnico, nome, dt_nascimento, salario) VALUES (SEQ_TECNICO.nextval,'TITE', '25-12-1988', 5000);

INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'CAFU', '18-05-1984', 99500, 4);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'RONALDO', '15-11-1948', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'Piqué', '15-11-1948', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'J. Mascherano', '15-11-1948', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'I. Rakitić', '15-11-1968', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'Denis Suárez', '15-11-1978', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'Iniesta', '15-11-1947', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'Sergi Roberto', '15-11-1944', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'Aleix Vidal', '15-11-1942', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'André Gomes', '15-11-1941', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'A. Turan', '15-11-1945', 99500, 3);
INSERT INTO jogador (id_jogador, nome, dt_nascimento, salario, id_time) VALUES (SEQ_JOGADOR.nextval,'Jordi Alba', '15-11-1949', 99500, 3);

SELECT NOME FROM JOGADOR WHERE ID_TIME = 3;
SELECT * FROM TIME;
SELECT nome, dt_nascimento, trunc(months_between( sysdate, dt_nascimento)/ 12) as idade FROM TECNICO where dt_nascimento < sysdate - 14600
AND nome = 'DUNGA';

-- INSERT COM SELECT
INSERT INTO JOGADOR
SELECT seq_jogador.nextval,
       jog.nome,
       jog.dt_nascimento,
       jog.salario,
       4
from jogador jog where jog.id_time = 3;
--

UPDATE TIME
SET NOME = 'BARCELONA FC'
WHERE ID_TIME = 3;

-- INSERIR UM NOVO TIME
INSERT INTO time (id_time, nome) VALUES (SEQ_TIME.nextval,'MILAN');
-- ALTERAR TODOS OS JOGADORES DE UM TIME PARA OUTRO
UPDATE JOGADOR
SET ID_TIME = 6
WHERE ID_TIME = 3;
-- AUMENTAR EM 10% O SALARIO DOS JOGADORES DO NOVO TIME
UPDATE JOGADOR
SET SALARIO = SALARIO * 1.1
WHERE ID_TIME = 6;
--AUMENTAR O SALARIO DE TODOS OS TECNICOS EM 20%
UPDATE TECNICO
SET SALARIO = SALARIO * 1.2;
