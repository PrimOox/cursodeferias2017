SELECT j.id_jogo, 
       ta.nome, 
       tb.nome
FROM jogo j,
     time ta,
     time tb
WHERE j.id_time_a = ta.id_time
      AND j.id_time_b = tb.id_time;
/*
update jogo set NR_GOL_B = ID_TIME_B * 2;
*/

SELECT ta.nome "TIME A", 
       DECODE(j.nr_gol_a,
              j.nr_gol_b,
              'empate',
              j.nr_gol_a || 'x' || j.nr_gol_b) "PLACAR",
       tb.nome "TIME B"
FROM jogo j,
     time ta,
     time tb
WHERE j.id_time_a = ta.id_time
      AND j.id_time_b = tb.id_time;
