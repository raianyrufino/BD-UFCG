--Q1 Retornar todos os elementos da tabela departament
SELECT *FROM department;

--Q2
SELECT *FROM dept_locations;

--Q3
SELECT *FROM employee;

--Q4
SELECT *FROM dependent;

--Q5
SELECT *FROM project;

--Q6
SELECT *FROM works_on;

--Q7 Retornar os nomes(primeiro e último) dos funcionários homens
SELECT e.fname, e.lname
FROM employee AS e
WHERE e.sex = 'M';

--Q8 Retornar os nomes dos funcionários homens que não possuem supervisor
SELECT e.fname
FROM employee AS e
WHERE e.sex = 'M' AND e.superssn IS NULL;

--Q9 Retornar os nomes dos funcionários(primeiro) e o nome(primeiro) do seu supervisor, apenas
-- para os funcionário que possuem supervisor
SELECT e.fname, s.fname
FROM employee AS e, employee AS s
WHERE e.superssn = s.essn;

--Q10 Retornar os nomes(primeiro) dos funcionários supervisionados 
SELECT e.fname
FROM employee AS e, employee AS s
WHERE e.ssn = s.superssn AND
	  s.fname = 'Franklin';

--Q11 Retornar os nomes dos departamentos e suas localizações
SELECT d.dname, l.dlocation
FROM department AS d, dept_locations AS l
WHERE d.dnumber = l.dnumber;

--Q12 Retornar os nomes dos departamentos localizados em cidades que começam com a letra 'S'
SELECT d.dname
FROM department AS d, dept_locations AS l
WHERE d.dnumber = l.dnumber AND
l.dlocation LIKE 'S%';

--Q13 Retornar os nomes(primeiro e último) dos funcionários e seus dependentes(apenas para os funcionários que possuem dependentes)
SELECT e.fname, e.lname, d.dependent_name
FROM employee AS e, dependent AS d
WHERE e.ssn = d.essn;

--Q14 Retornar o nome completo dos funcionários que possuem salário maior do que 50 mil. A relação do retorno deve ter apenas
-- duas colunas: "full_name" e "salary". O nome completo deve ser formado pela concatenação dos valores das 3 colunas com dados sobre nome. 
-- Use o operador || para concatenar strings
SELECT (e.fname || '' || e.minit || '' || e.lname) AS full_name, e.salary
FROM employee As e 
WHERE e.salary > 50000;

--Q15 Retornar os projetos(nome) e os departamentos responsáveis(nome)
SELECT p.pname, d.dname
FROM project AS p, department AS d
WHERE d.dnumber = p.pnumber;

--Q16 Retornar os projetos(nome) e os gerentes dos departamentos responsáveis(primeiro nome). Retornar resultados apenas
-- para os projetos com código maior do que 30.
SELECT p.pname, e.fname
FROM project AS p, department d, employee AS e
WHERE p.dnum = d.dnumber AND
	  e.fname = d.mgrssn AND
	  p.pnumber > 30;
	  
--Q17 Retornar os projetos(nome) e os funcionários que trabalham neles(primeiro nome)
SELECT p.pname, e.fname
FROM project AS p, employee AS e, works_on AS w
WHERE p.pnumber = w.pno AND
	  e.ssn = w.essn;

--Q18 Retornar os nomes dos dependentes dos funcionáros que trabalham no projeto 91.
-- Retornar também o nome(pprimeiro) do funcionário e o relacionamento entre eles.
SELECT d.dname, e.fname, d.relationship
FROM dependent AS d, employee AS e works_on w
WHERE  e.ssn = d.essn AND
	   d.essn = w.essn AND 
	   w.pno = 91;
	   





