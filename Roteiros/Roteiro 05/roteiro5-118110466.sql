-- 01 Retornar quantas funcionárias estão cadastradas
SELECT COUNT(*) FROM employee WHERE sex = 'f';

-- 02 Retornar a média de salário dos funcionários homens que moram no estado do Texas
SELECT AVG(e.salary) FROM employee where sex='M' AND adress LIKE '%TX'

-- 03 Retornar os ssn do supervisores e a quantidade de funcionários que cada um deles supervisiona(contar
-- também os que não são supervisionados por ninguém). Ordenar o resultado pela quantidade.
SELECT
    s.ssn AS ssn_supervisor,
    COUNT(*) AS qtd_supervisionados
FROM
    employee AS e
    LEFT JOIN employee AS s ON e.superssn = s.ssn
GROUP BY
    ssn_supervisor
ORDER BY
    qtd_supervisionados;

-- 04 Para cada funcionário que supervisiona alguém, retornar seu nome e a quantidade de funcionários que 
-- supervisiona. O resultado deve ser ordenado pela quantidade de funcionários supervisionados.
SELECT
    s.fname AS nome_supervisor,
    COUNT(*) AS qtd_supervisionados
FROM
    employee AS e
    INNER JOIN employee AS s ON s.ssn = e.superssn
GROUP BY
    s.fname
ORDER BY
    COUNT(*);


-- 05 Faça uma consulta equivalente à anterior, porém considerando os funcionários que não possuem supervisor.

SELECT
    s.fname AS nome_supervisor,
    COUNT(*) AS qtd_supervisionados
FROM
    employee AS e
    LEFT JOIN employee AS s ON s.ssn = e.superssn
GROUP BY
    s.fname
ORDER BY
    COUNT(*);

-- 06 Retornar a quantidade de funcionários que trabalham no(s) projeto(s) que contém menos funcionários.

SELECT
    MIN(qtd) AS qtd_empregados
FROM
    (
        SELECT
            COUNT(essn) AS qtd
        FROM
            works_on
        GROUP BY
            pno
    ) as qtds;


--QUESTAO 7--
SELECT pno AS proj,
       COUNT(essn) AS qtd
FROM works_on

GROUP BY pno

HAVING COUNT(essn) = (
    SELECT MIN(qtd) AS qtd_empregados
    FROM (
        SELECT
            COUNT(essn) AS qtd
        FROM
            works_on
        GROUP BY
            pno
    ) as qtds);       


--QUESTAO 8--
SELECT
    w.pno AS num_proj,
    AVG(e.salary)
FROM
    works_on as w,
    employee as e
WHERE
    e.ssn = w.essn
GROUP BY
    pno;
--QUESTAO 9-- !!
SELECT
    w.pno AS proj_num,
    p.pname AS proj_nome,
    AVG(e.salary) AS media_sal
FROM
    works_on as w,
    employee as e,
    project as p
WHERE
    e.ssn = w.essn
    AND w.pno = p.pnumber
GROUP BY
    pno;
--QUESTAO 10--
SELECT
    distinct e.fname,
    e.salary
FROM
    works_on AS w,
    employee AS e
WHERE
    e.ssn NOT IN (
        SELECT
            w.essn
        FROM
            works_on AS w
        WHERE
            w.pno = 92
    )
    AND e.salary > (
        SELECT
            MAX(salary)
        FROM
            works_on AS w,
            employee AS e
        WHERE
            w.essn = e.ssn
            AND w.pno = 92
    );
--QUESTAO 11--
SELECT
    e.ssn,
    COUNT(w.essn) AS qtd_proj
FROM
    employee as e
    LEFT JOIN works_on AS w on e.ssn = w.essn
GROUP BY
    e.ssn
ORDER BY
    COUNT(w.essn);

