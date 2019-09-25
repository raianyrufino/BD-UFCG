-- 01 Retornar quantas funcionárias estão cadastradas
SELECT COUNT(*) FROM employee WHERE sex = 'f';

-- 02 Retornar a média de salário dos funcionários homens que moram no estado do Texas
SELECT AVG(e.salary) FROM employee where sex='M' AND adress LIKE '%TX'

-- 03 Retornar os ssn do supervisores e a quantidade de funcionários que cada um deles supervisiona(contar
-- também os que não são supervisionados por ninguém). Ordenar o resultado pela quantidade.
SELECT COUNT(*) AS qtd_supervisionados, e.ssn AS ssn_supervisor FROM employee 
				AS r RIGHT OUTER JOIN employee AS r ON e.ssn = r.superssn GROUP BY r.ssn ORDER BY qtd_supervisionados ASC; 

-- 04 Para cada funcionário que supervisiona alguém, retornar seu nome e a quantidade de funcionários que 
-- supervisiona. O resultado deve ser ordenado pela quantidade de funcionários supervisionados.
SELECT s.fname AS fname_supervisor, COUNT(*) AS qtd_supervisionados FROM employee AS s JOIN employee AS e ON 

-- 05 Faça uma consulta equivalente à anterior, porém considerando os funcionários que não possuem supervisor.

SELECT S.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados FROM employee AS S JOIN employee AS E ON E.superssn = S.ssn GROUP BY S.fname ORDER BY qtd_supervisionados ASC;

-- 06
