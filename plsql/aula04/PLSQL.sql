/**
ALTER TABLE jogador DROP CONSTRAINT fk_time_jogador;
ALTER TABLE tecnico DROP CONSTRAINT fk_time_tecnico;
--
DROP TABLE jogo;
DROP TABLE jogador;
DROP TABLE tecnico;
DROP TABLE time;
--
CREATE TABLE time(
  id_time NUMBER NOT NULL,
  nome VARCHAR2(400)
);
--
CREATE TABLE jogador(
  id_jogador NUMBER NOT NULL,
  nome VARCHAR2(400) NOT NULL,
  dt_nascimento DATE NOT NULL,
  salario NUMBER(18,2),
  id_time NUMBER NOT NULL
);
--
CREATE TABLE tecnico(
  id_tecnico NUMBER NOT NULL,
  nome VARCHAR2(400) NOT NULL,
  dt_nascimento DATE NOT NULL,
  salario NUMBER(18,2),
  id_time NUMBER NOT NULL
);
--
CREATE TABLE jogo(
  id_jogo NUMBER NOT NULL,
  id_time_a NUMBER NOT NULL,
  id_time_b NUMBER NOT NULL,
  nr_gol_a NUMBER,
  nr_gol_b NUMBER,
  dh_inicio DATE,
  dh_fim DATE
);
--
ALTER TABLE time ADD CONSTRAINT pk_time PRIMARY KEY (id_time);
ALTER TABLE jogador ADD CONSTRAINT pk_jogador PRIMARY KEY (id_jogador);
ALTER TABLE tecnico ADD CONSTRAINT pk_tecnico PRIMARY KEY (id_tecnico);
--
ALTER TABLE jogador ADD CONSTRAINT fk_time_jogador FOREIGN KEY(id_time) REFERENCES time(id_time);
ALTER TABLE tecnico ADD CONSTRAINT fk_time_tecnico FOREIGN KEY(id_time) REFERENCES time(id_time);
--
ALTER TABLE jogo ADD CONSTRAINT pk_jogo PRIMARY KEY (id_jogo);
ALTER TABLE jogo ADD CONSTRAINT fk_jogo_time_a FOREIGN KEY(id_time_a) REFERENCES time(id_time);
ALTER TABLE jogo ADD CONSTRAINT fk_jogo_time_b FOREIGN KEY(id_time_b) REFERENCES time(id_time);
--

DROP TABLE time;
ALTER TABLE time ADD CONSTRAINT pk_time PRIMARY KEY (id_time);
ALTER TABLE time DROP CONSTRAINT pk_time;
ALTER TABLE time DROP COLUMN id_tecnico;
**/
/*
DECLARE
  vnIdTimeA NUMBER;
  vnIdTimeB NUMBER;
  vnExisteTimeA NUMBER;
  vnExisteTimeB NUMBER;
BEGIN
  vnIdTimeA := &timeA;
  vnIdTimeB := &timeB;
  
  SELECT COUNT(1) INTO vnExisteTimeA 
  FROM time WHERE id_time = vnIdTimeA;
  
  SELECT COUNT(1) INTO vnExisteTimeB 
  FROM time WHERE id_time = vnIdTimeB;
  
  IF vnExisteTimeA = 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: Time A não existe!');  
  ELSIF vnExisteTimeB = 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: Time B não existe!');  
  ELSIF vnIdTimeA = vnIdTimeB THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: O Time A e B não podem ser iguais!');  
  ELSE
    INSERT INTO jogo (id_jogo, id_time_a, id_time_b) 
    VALUES (seq_jogo.nextval, vnIdTimeA, vnIdTimeB);
    DBMS_OUTPUT.PUT_LINE('JOGO SALVO COM SUCESSO');  
  END IF;
    EXCEPTION 
     WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('ERRO AO EXECUTAR OPERACOES: '|| SQLERRM);  
END;


DECLARE
  
BEGIN
  INSERT INTO TECNICO (NOME)
  VALUES ('TESTE ERRO');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERRO AO EXECUTAR OPERACOES: '|| SQLERRM);  
END;


DECLARE
  vnIdTimeA NUMBER;
  vnIdTimeB NUMBER;
  vnExisteTimeA NUMBER;
  vnExisteTimeB NUMBER;
  TIME_INVALIDO_EXCEPTION EXCEPTION;
BEGIN
  vnIdTimeA := &timeA;
  vnIdTimeB := &timeB;
  
  SELECT COUNT(1) INTO vnExisteTimeA 
  FROM time WHERE id_time = vnIdTimeA;
  
  --SELECT id_time INTO vnExisteTimeA 
  --FROM time;
  
  SELECT COUNT(1) INTO vnExisteTimeB 
  FROM time WHERE id_time = vnIdTimeB;
  
  IF vnExisteTimeA = 0 THEN
    RAISE TIME_INVALIDO_EXCEPTION;
  ELSIF vnExisteTimeB = 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: Time B não existe!');  
  ELSIF vnIdTimeA = vnIdTimeB THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: O Time A e B não podem ser iguais!');  
  ELSE
    INSERT INTO jogo (id_jogo, id_time_a, id_time_b) 
    VALUES (seq_jogo.nextval, vnIdTimeA, vnIdTimeB);
    DBMS_OUTPUT.PUT_LINE('JOGO SALVO COM SUCESSO');  
  END IF;
  
  EXCEPTION
  WHEN TIME_INVALIDO_EXCEPTION THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: Time A não existe!');  
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('MUITOS PARA UM CAMPO');  
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('DADOS INCORRETOS'); 
   
END;

*/

DECLARE
  vnNumero NUMBER := 0;
BEGIN
  WHILE vnNumero <= 100 LOOP
      DBMS_OUTPUT.PUT_LINE ('num: ' || vnNumero);
      vnNumero := vnNumero + 1;
    END LOOP;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERRO AO EXECUTAR OPERACOES: '|| SQLERRM);  
END;
