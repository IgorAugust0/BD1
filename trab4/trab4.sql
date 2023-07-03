-------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Criar 2 comandos de alteração/inserção de atributo em uma tabela:
-- A) Criação de nova coluna com o nome "País":
ALTER TABLE gravadora.endereco
    ADD COLUMN pais VARCHAR(45);
-- Populando
UPDATE gravadora.endereco
SET pais = 'Brasil';
SELECT e.*
FROM gravadora.endereco e;

-- B) Criação de nova coluna com o nome "categoria" que se refere a qualidade do instrumento:
ALTER TABLE gravadora.instrumento
    ADD COLUMN categoria varchar(45)
-- Populando
UPDATE gravadora.instrumento
SET categoria = 'Classe A';
SELECT e.*
FROM gravadora.instrumento e;


------------------------------------------------------------------------------------------------------
-- 2. Criar 2 comandos de alteração de uma tabela, para alteração/inserção de restrição (constraint):

-- A) Adicionando uma validação no número do endereço, onde é necessário o cadastro de um número positivo.
ALTER TABLE gravadora.endereco
    ADD CONSTRAINT check_numero_positivo CHECK (numero > 0);
-- Teste Inválido
INSERT INTO gravadora.endereco(rua, bairro, numero, cidade, complemento, estado, cep)
VALUES ('Rua Teste Check', 'Centro', -123, 'São Paulo','Apto 101','SP','01010010');
-- Teste válido
INSERT INTO gravadora.endereco(rua, bairro, numero, cidade, complemento, estado, cep)
VALUES ('Rua Teste Check', 'Centro', 123, 'São Paulo', 'Apto 101','SP','01010010');
SELECT e.*
FROM gravadora.endereco e;

-- B) A restrição verifica se o valor da coluna "email" contém a sequência do ID+"@gmail.com".
ALTER TABLE gravadora.musico
ADD CONSTRAINT email_check CHECK (email LIKE '%@gmail.com');
SELECT e.*
FROM gravadora.musico e;


------------------------------------------------------------------------------------------------------
-- 3. Criar 2 comandos novos de inserção nas principais tabelas do modelo:

-- A) Inserção na tabela de estilo musical
INSERT INTO gravadora.estilo_musical (nome, descricao)
VALUES ('Pagofunk', 'Estilo musical criado no século 21 que tem como base unir 2 generos distintos para a criação de um novo, nesse exemplo, os generos utilizados foram PAGODE e FUNK');
SELECT em.*
FROM gravadora.estilo_musical em;
-- B) Inserção na tabela
INSERT INTO gravadora.musico (nome,cpf, telefone, celular, email, endereco_id_endereco)
VALUES ('Igor Augusto', '135.658.698-00', '(34) 1234-5678', '(34) 99999-1234', 'joao.silva@gmail.com', 1);
SELECT m.*
FROM gravadora.musico m;


------------------------------------------------------------------------------------------------------
-- 4. Criar comandos de deleção nas principais tabelas:

-- A) Remove a coluna pais que foi feita na inserção anterior.
ALTER TABLE gravadora.endereco
    DROP COLUMN pais;
SELECT e.*
FROM gravadora.endereco e;


------------------------------------------------------------------------------------------------------
-- 5. Criar 2 comandos de atualização de dados nas principais tabelas do modelo, sendo que pelo menos 1 delas deve obter o(s) novo(s) valor(es) a serem armazenados a partir de consulta(s) a outra(s) tabela(s):

-- A) O novo valor é obtido através de uma subconsulta que consulta a tabela musico usando o ID do líder da banda (coluna musico_id_lidera). O valor do estilo musical do líder da banda é usado para atualizar o estilo musical da banda correspondente.
UPDATE gravadora.banda
SET estilo_musical_id_estilo_musical = (
    SELECT estilo_musical_id_estilo_musical
    FROM gravadora.musico
    WHERE id_musico = banda.musico_id_lidera
)
WHERE id_banda = 1;

-- B) Neste exemplo, o comando atualiza a descrição de um estilo musical específico na tabela estilo_musical com base na contagem de bandas que possuem esse estilo musical.
UPDATE gravadora.estilo_musical
SET descricao = (
    SELECT CONCAT('Este estilo musical está presente em ', COUNT(*), ' bandas.')
    FROM gravadora.banda AS b
    WHERE b.estilo_musical_id_estilo_musical = 2
        )
        WHERE id_estilo_musical = 2;

SELECT m.*
FROM gravadora.estilo_musical m;

------------------------------------------------------------------------------------------------------
--6. Criar 3 consultas simples nas principais tabelas do modelo usando as cláusulas WHERE, DISTINCT, BETWEEN, LIKE e ORDER BY;

--A) Consulta na tabela musico usando a cláusula WHERE e ORDER BY para obter músicos com um nome específico em ordem alfabética:
SELECT *
FROM gravadora.musico
WHERE nome = ('Maria')
ORDER BY nome;

-- B) Consulta na tabela estilo_musical usando a cláusula DISTINCT para obter estilos musicais distintos e removendo as duplicatas:
SELECT DISTINCT nome
FROM gravadora.estilo_musical;

-- C) Consulta na tabela Album músicas lançadas entre os anos 1950 e 1990.
SELECT *
FROM gravadora.album
WHERE data_lancamento BETWEEN '1950-01-01' AND '1990-12-31';


------------------------------------------------------------------------------------------------------
-- 7. Criar 3 consultas aninhadas (sub consultas) usando IN e NOT IN;

--A) A consulta retorna todos os registros da tabela musico cujo ID não está presente na coluna musico_id_membro da tabela banda, ou seja,
-- músicos que não estão associados a nenhuma banda
SELECT *
FROM gravadora.musico
WHERE id_musico NOT IN (
    SELECT musico_id_membro
    FROM gravadora.banda
);

--B) A consulta retorna todos os registros da tabela musico cujo ID está presente na coluna musico_id_membro da tabela banda, ou seja,
-- músicos que estão associados a nenhuma banda
SELECT *
FROM gravadora.musico
WHERE id_musico IN (
    SELECT musico_id_membro
    FROM gravadora.banda
);

--C) A consulta retorna todos os musicos presentes em uma banda que não está associada ao Estilo POP.
SELECT *
FROM gravadora.musico
WHERE id_musico IN (
    SELECT musico_id_membro
    FROM gravadora.banda
    WHERE estilo_musical_id_estilo_musical NOT IN (
        SELECT id_estilo_musical
        FROM gravadora.estilo_musical
        WHERE nome = 'Pop'
    )
);


------------------------------------------------------------------------------------------------------
--8. Criar 3 consultas que envolvem funções de agregação (COUNT, SUM, MIN, MAX, AVG) com agrupamento (GROUP BY) e HAVING;

--A) A consulta conta o número de registros da tabela musica agrupados pelo banda_id_banda. Em seguida, a cláusula HAVING é usada para filtrar apenas as bandas com mais de 1 música.
SELECT banda_id_banda, COUNT(*) AS total_musicas
FROM gravadora.musica
GROUP BY banda_id_banda
HAVING COUNT(*) > 1 ;

--B) A consulta conta o número de registros da tabela album agrupados pelo formato e cod_album. Em seguida, a consulta principal usa a função de agregação SUM para obter a soma de cada formato
SELECT formato, SUM(total) AS totais
FROM (
    SELECT formato, COUNT(*) AS total
    FROM gravadora.album
    GROUP BY formato, cod_album
) subquery
GROUP BY formato;

--C) Consulta na tabela musico para obter a contagem de músicos por cidade, retornando apenas as cidades com mais de 5 músico
SELECT endereco.cidade, COUNT(*) AS num_musicos
FROM gravadora.musico
JOIN gravadora.endereco ON musico.endereco_id_endereco = endereco.id_endereco
GROUP BY endereco.cidade
HAVING COUNT(*) > 5;


------------------------------------------------------------------------------------------------------
--9) Criar 3 consultas avançadas usando INNER JOIN e (INNER, RIGHT, LEFT, FULL) OUTER JOIN;

--A) A consulta combina registros das tabelas musica e banda usando INNER JOIN, com base na correspondência da coluna
-- banda_id_banda na tabela musica com a coluna id_banda na tabela banda. A consulta retorna o nome da música e da banda associada.
SELECT musica.nome, banda.nome
FROM gravadora.musica
INNER JOIN gravadora.banda ON musica.banda_id_banda = banda.id_banda;

--B) a consulta combina todos os registros da tabela banda com os registros correspondentes da tabela musica.
SELECT banda.nome, musica.nome
FROM gravadora.banda
LEFT OUTER JOIN gravadora.musica ON banda.id_banda = musica.banda_id_banda;

--C)A consulta combina registros das tabelas banda e musica usando FULL OUTER JOIN. O WHERE é utilizado para filtrar os
-- resultados, retornando apenas as combinações em que o nome da banda ou o nome da música é nulo
SELECT banda.nome, musica.nome
FROM gravadora.banda
FULL OUTER JOIN gravadora.musica ON banda.id_banda = musica.banda_id_banda
WHERE banda.nome IS NULL OR musica.nome IS NULL;