-- Consultas - SQL/DML - Simples Seleção/projeção

-- 1. Listar a data de nascimento e o endereço dos empregados com nome: John B Smith
SELECT e.bdate   AS "Data de Aniversário",
       e.address AS "Endereço"
FROM employee e
WHERE e.fname = 'John'
  AND e.minit = 'B'
  AND e.lname = 'Smith';

-- 2. Listar o nome e endereço dos empregados que trabalham no departamento ’Research’
SELECT e.fname   AS "Nome",
       e.address AS "Endereço"
       --d.dname AS "Depto"
FROM (employee e JOIN department d ON dno = d.dnumber)
WHERE dname = 'Research';

-- 3. Para todo projeto localizado em ’Stafford’, listar o número do projeto, o número 
--  do departamento que o controla e o último nome, endereço e data de nascimento do gerente do departamento.
SELECT p.pnumber AS "Nome Projeto",
       p.dnum    AS "Nro Depto",
       e.lname   AS "Gerente: Último Nome",
       e.address AS "Gerente: Endereço",
       e.bdate   AS "Gerente: Data de Nascimento"
FROM project p,
     employee e,
     department d
WHERE p.dnum = d.dnumber
  AND e.ssn = d.mgrssn
  AND p.plocation = 'Stafford';

-- 4. Listar o nome e endereço dos empregados que trabalham no departamento ’Research’ considerando os novos esquemas
SELECT e.fname   AS "Nome",
       e.address AS "Endereço"
FROM (employee e JOIN department d ON e.dno = d.dnumber)
WHERE dname = 'Research';

-- 5. Para cada empregado, liste o seu primeiro e o seu último nome acompanhados 
-- do último nome de seu supervisor.
SELECT e.fname AS "Empregado: Primeiro Nome",
       e.lname AS "Empregado: Último Nome",
       s.lname AS "Supervisor: Último Nome"
FROM (employee e JOIN employee s ON e.superssn = s.ssn);

-- 6. Listar o nome e o endereço dos empregados que trabalham no departamento ’Research’ 
-- considerando as novas tabelas employee e department e usando apelidos
SELECT e.fname   AS "Nome",
       e.address AS "Endereço"
FROM (employee e JOIN department d ON e.dno = d.dnumber)
WHERE dnumber = '5';

-- 7. Listar o produto cartesiano de empregados e departamentos
SELECT *
FROM employee e
         CROSS JOIN department d;

-- 8. Listar todos os salários distintos
SELECT DISTINCT e.salary AS "Salário"
FROM employee e;

-- 9. Listar os números dos projetos que envolvam um empregado cujo último nome 
-- é ’Wong’ sendo que o empregado deve ser trabalhador ou gerente do departamento 
-- que controla o projeto.
(SELECT DISTINCT p.pnumber AS "Nro Projeto"
 FROM project p,
      department d,
      employee e
 WHERE p.dnum = d.dnumber
   AND d.mgrssn = e.ssn
   AND e.lname = 'Wong')
UNION
(SELECT DISTINCT wo.pno
 FROM works_on wo,
      employee e
 WHERE wo.essn = e.ssn
   AND e.lname = 'Wong')
ORDER BY "Nro Projeto";

-- 10. Listar o nome de todo empregado cujo endereço está em Houston, Texas
SELECT e.fname   AS "Nome",
       e.lname   AS "Ultimo Nome",
       e.address AS "Endereço"
FROM employee e
WHERE e.ssn IN (SELECT ssn WHERE address LIKE '%Houston%TX%');

-- 11. Listar o nome de todos os empregados nascidos na década de 50
SELECT e.fname AS "Nome",
       e.bdate AS "Data de Nascimento"
FROM employee e
--WHERE CAST(e.bdate AS text) LIKE '__5%';
WHERE e.bdate >= '1950-01-01'
  AND e.bdate < '1959-12-31';

-- 12. Listar o nome e os salários resultantes de um aumento de 10% para 
-- os funcionários do projeto ’Productx’
SELECT e.fname        AS "Nome",
       e.salary       AS "Salário",
       e.salary * 1.1 AS "Salário com Aumento de 10%"
FROM (employee e JOIN works_on wo ON e.ssn = wo.essn);

-- 13. Listar todos os empregados no departamento 5 cujo salário está entre 30000 e 40000
SELECT e.fname  AS "Nome",
       e.salary AS "Salário",
       e.dno    AS "Dpto"
FROM employee e
WHERE e.dno = '5'
  AND e.salary BETWEEN 30000 AND 40000;

-- 14. Listar os empregados e projetos em que eles estão trabalhando, ordenados 
-- pelo departamento e, dentro de cada departamento, ordenado pelo último e primeiro nome
SELECT e.fname AS "Empregado: Nome",
       p.pname AS "Empregado: Projeto"
FROM ((employee e JOIN works_on wo ON e.ssn = wo.essn) JOIN project p ON wo.pno = p.pnumber)
ORDER BY e.dno, e.lname, e.fname;

-- 15. Listar a soma de salários, o maior salário e a média de salários, 
-- somente para funcionários do departamento 'Research'
SELECT SUM(e.salary) AS "Soma",
       MAX(e.salary) AS "Máximo",
       AVG(e.salary) AS "Média"
FROM (employee e JOIN department d ON e.dno = d.dnumber)
WHERE dname = 'Research';

-- 16. Listar o número de salários distintos
SELECT COUNT(DISTINCT e.salary)
FROM employee e;

-- 17. Listar o nome dos empregados que têm dois ou mais dependentes
SELECT e.fname, e.lname
FROM (employee e INNER JOIN dependent d ON e.ssn = d.essn)
GROUP BY e.ssn, e.fname
HAVING COUNT(d.dependent_name) >= 2;

-- SELECT lname, fname
-- FROM employee
-- WHERE (SELECT COUNT(*)
--        FROM dependent
--        WHERE essn = ssn) >= 2;

-- 18. Listar para cada departamento seu número, a quantidade de empregados 
-- e a média salarial de seus empregados.
SELECT e.dno         AS "Departamento",
       COUNT(e.*)    AS "Funcionários",
       AVG(e.salary) AS "Média Salarial"
FROM employee e
GROUP BY e.dno;

-- 19. Listar para cada projeto seu número, nome e a quantidade 
-- de empregados que trabalham no projeto.
SELECT p.pnumber AS "Num Projeto",
       p.pname   AS "Nome",
       COUNT(*)  AS "Quantidade de Empregados"
FROM (project p JOIN works_on wo ON p.pnumber = wo.pno)
GROUP BY p.pnumber, p.pname
ORDER BY p.pnumber;

-- 20. Listar para cada projeto onde trabalham mais de dois empregados 
-- seu número e a quantidade de empregados que trabalham no projeto
SELECT p.pnumber AS "Nro Projeto",
       p.pname   AS "Nome Projeto",
       COUNT(*)  AS "Qtde de Empregados"
FROM project p,
     works_on wo
GROUP BY p.pnumber, p.pname
HAVING COUNT(*) > 2;

-- 21. Listar para cada departamento que tem mais que 2 empregados, o número 
-- do departamento e o número de empregados que ganham mais que 40000
SELECT e.dno    AS "Número Dpto",
       COUNT(*) AS "Quantidade de Empregados"
FROM employee e
WHERE e.salary > 40000
  AND e.dno IN
      (SELECT d.dnumber
       FROM department d
       WHERE (SELECT COUNT(*)
              FROM employee e2
              WHERE e2.dno = d.dnumber) > 2)
GROUP BY e.dno;

-- Consultas - SQL/DML – Consultas Aninhadas

-- 22. Listar todos os números de projetos que envolvam um empregado cujo 
-- último nome é ’Smith’ sendo que o empregado deve ser trabalhador ou 
-- gerente do departamento que controla o projeto.
(SELECT DISTINCT p.pnumber AS "Nro Projeto"
 FROM project p,
      department d,
      employee e
 WHERE p.dnum = d.dnumber
   AND d.mgrssn = e.ssn
   AND e.lname = 'Smith')
UNION
(SELECT DISTINCT wo.pno
 FROM works_on wo,
      employee e
 WHERE wo.essn = e.ssn
   AND e.lname = 'Smith');

-- 23. Reformulando a consulta, removendo a cláusula UNION e incluindo a cláusula IN
SELECT DISTINCT p.pnumber AS "Nro Projeto"
FROM project p
WHERE p.pnumber IN
      (SELECT p.pnumber
       FROM project p,
            department d,
            employee e
       WHERE p.dnum = d.dnumber
         AND d.mgrssn = e.ssn
         AND e.lname = 'Smith')
   OR p.pnumber IN (SELECT wo.pno
                    FROM works_on wo,
                         employee e2
                    WHERE wo.essn = e2.ssn
                      AND e2.lname = 'Smith')
ORDER BY "Nro Projeto";

-- 24. Listar o nome dos empregados com dependente(s) de mesmo 
-- ’first name’ e sexo que o empregado – usando sub-consulta
(SELECT e.fname AS "Nome",
        e.lname AS "Sobrenome"
 FROM employee e
 WHERE e.ssn IN (SELECT essn
                 FROM dependent d
                 WHERE e.fname = d.dependent_name
                   AND e.sex = d.sex));

-- 25. Mesma consulta anterior substituindo sub-consulta por join (produto cartesiano)
SELECT e.fname AS "Nome",
       e.lname AS "Sobrenome"
FROM (employee e JOIN dependent d ON e.fname = d.dependent_name AND e.sex = d.sex);

-- 26. Listar os nomes de empregados sem dependentes
SELECT e.fname AS "Nome",
       e.lname AS "Sobrenome"
FROM (employee e LEFT JOIN dependent d ON e.ssn = d.essn)
WHERE d.essn IS NULL;

SELECT e.fname AS "Nome",
       e.lname AS "Sobrenome"
FROM employee e
WHERE NOT EXISTS (SELECT *
                  FROM dependent d
                  WHERE e.ssn = d.essn);

-- 27. Listar o nome dos empregados que trabalham em todos os projetos 
-- controlados pelo departamento número 4 – divisão de duplas negação
SELECT e.lname AS "Sobrenome", e.fname AS "Nome"
FROM employee e
WHERE NOT EXISTS(SELECT *
                 FROM project p
                 WHERE p.dnum = 4
                   AND NOT EXISTS(SELECT *
                                  FROM works_on wo
                                  WHERE p.pnumber = wo.pno
                                    AND wo.essn = e.ssn));

-- 28. Mesma consulta - divisão negação e subtração
SELECT e.lname AS "Sobrenome", e.fname AS "Nome"
FROM employee e
WHERE NOT EXISTS(SELECT p.pnumber
                 FROM project p
                 WHERE p.dnum = 4
                 EXCEPT
                 (SELECT wo.pno
                  FROM works_on wo
                  WHERE wo.essn = e.ssn));

-- Consultas - SQL/DML – Join e Agregação

-- 29. Listar o nome e endereço dos empregados que trabalham no departamento ’Research’
SELECT fname, minit, lname
FROM (employee INNER JOIN department ON dno = department.dnumber)
WHERE dname = 'Research';

-- 30. Listar o nome e endereço dos empregados que trabalham no departamento ’Research’
SELECT fname, minit, lname, address
FROM (employee JOIN department ON dno = department.dnumber)
WHERE dname = 'Research';

-- 31. Na junção natural iguala-se, de forma implícita, os atributos de mesmo nome.
SELECT fname, minit, lname, address
FROM (employee NATURAL JOIN department)
WHERE dname = 'Research';

-- 32. Para cada empregado, liste o seu primeiro nome acompanhado do primeiro nome 
-- de seu supervisor, mesmo se o empregado não tiver supervisor, liste seu nome
SELECT e.fname AS "Empregado", s.fname AS "Supervisor"
FROM (employee e LEFT JOIN employee s ON e.ssn = s.superssn);

-- 33. Liste o primeiro nome do supervisor e o primeiro nome de seus supervisionados, 
-- ordenado pelo primeiro. Mesmo se o empregado não for supervisor de ninguém, liste seu nome 
-- na primeira coluna e mesmo se o empregado não tiver supervisor, liste seu nome na segunda coluna.
SELECT e.fname AS "Empregado", s.fname AS "Supervisor"
FROM (employee e FULL JOIN employee s ON e.ssn = s.superssn)
ORDER BY 1;

-- 34. Para todo projeto localizado em ’Stafford’, listar o número do projeto, 
--  o número do departamento que o controla e o último nome do gerente do departamento.
SELECT p.pnumber AS "Nome Projeto",
       p.dnum    AS "Nro Depto",
       e.lname   AS "Gerente: Último Nome"
FROM ((project p JOIN department d ON p.dnum = d.dnumber) 
    JOIN employee e ON d.mgrssn = e.ssn)
WHERE p.plocation = 'Stafford';

-- Outros:


-- {[INNER] | {LEFT | RIGHT | FULL}[OUTER]} JOIN
-- Listar o nome e endereço dos empregados que trabalham no departamento ’Research’
SELECT fname, minit, lname
FROM (employee JOIN department ON dno = department.dnumber)
WHERE dname = 'Research';
-- Para cada empregado, liste o seu primeiro nome acompanhado do primeiro nome de seu supervisor, mesmo se o empregado não tiver supervisor
SELECT e.fname AS employee_name, s.fname AS supervisor_name
FROM (employee AS e LEFT JOIN employee AS s ON e.superssn = s.ssn);
-- Para cada supervisor, liste o primeiro nome do empregado que supervisiona, mesmo que não supervisione ninguém.
SELECT e.fname AS employee_name, s.fname AS supervisor_name
FROM (employee AS e RIGHT JOIN employee AS s ON e.superssn = s.ssn)
ORDER BY s.fname;
-- Liste o primeiro nome do supervisor e o primeiro nome de seus supervisionado, ordenado pelo 
-- primeiro. Mesmo se o empregado não for supervisor de ninguém, liste seu nome na primeira 
-- coluna e mesmo se o empregado não tiver supervisor, liste seu nome na segunda coluna.
SELECT s.fname AS "Supervisor", e.fname AS "Empregado"
FROM (employee AS s FULL JOIN employee AS e ON e.superssn = s.ssn)
ORDER BY s.fname, e.fname;