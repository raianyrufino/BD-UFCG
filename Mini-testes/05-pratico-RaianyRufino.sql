-- MINITESTE 05 

SELECT DISTINCT s.fname
FROM employee AS e, employee AS s
WHERE e.address LIKE '%TX' AND
	  e.superssn = s.ssn AND
	  s.address NOT LIKE '%TX';



