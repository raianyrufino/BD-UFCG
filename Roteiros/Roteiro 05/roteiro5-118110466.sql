-- 01 Retornar quantas funcionárias estão cadastradas
SELECT COUNT(e) 
FROM employee AS e
e.sex = 'F';

-- 02 Retornar a média de salário dos funcionários homens que moram no estado do Texas
SELECT AVG(e.salary)
FROM employee AS e
WHERE e.sex = 'M' AND e.adress LIKE '%TX'

-- 03 Retornar os ssn do supervisores e a quantidade de funcionários que cada um deles supervisiona(contar
-- também os que não são supervisionados po ninguém). Ordenar o resultado pela quantidade.

SELECT e.superssn AS ssn_supervisor, COUNT(e.ssn) AS qtd_supervisionados
FROM employee AS e 
GROUP BY e.superssn
ORDER BY qtd_supervisionados;

-- 04 Para cada funcionário que supervisiona alguém, retornar seu nome e a quantidade de funcionários que 
-- supervisiona. O resultado deve ser ordenado pela quantidade de funcionários supervisionados.

SELECT s.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados
FROM employee AS s INNER JOIN employee AS e ON s.ssn = e.superssn
GROUP BY s.fname
ORDER BY qtd_supervisionados;

-- 05 Faça uma consulta equivalente à anterior, porém considerando os funcionários que não possuem supervisor.
SELECT s.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados
FROM employee AS s RIGHT OUTER JOIN employee AS e ON s.ssn = e.superssn
GROUP BY s.fname
ORDER BY qtd_supervisionados;
