declare
 vsHello VARCHAR2(200);
 vnIdTime NUMBER;
 vsNomeTime VARCHAR2(200);
 vsTecnico VARCHAR2(200);
begin 
vsHello := 'Hello DBMS';
DBMS_OUTPUT.PUT_LINE(vsHello);

  SELECT t.id_time,
         t.nome
  into vnIdTime,
       vsNomeTime
FROM time t WHERE t.id_time = 5;

DBMS_OUTPUT.PUT_LINE('código do time: ' || vnIdTime);

DBMS_OUTPUT.PUT_LINE('nome do time: ' || vsNomeTime);

end;

