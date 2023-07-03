-- -----------------------------------------------------
-- Populando as tabelas
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Populando a tabela gravadora.instrumento
-- -----------------------------------------------------
INSERT INTO gravadora.instrumento (
        nome,
        marca,
        modelo,
        tom_musical
    )
VALUES (
        'Guitarra',
        'Fender',
        'Stratocaster',
        'Mi'
    ),
    (
        'Guitarra',
        'Gibson',
        'Les Paul',
        'Mi'
    ),
    (
        'Baixo',
        'Fender',
        'Precision',
        'Sol'
    ),
    (
        'Baixo',
        'Music Man',
        'Stingray',
        'Sol'
    ),
    (
        'Bateria',
        'Pearl',
        'Export',
        'Mi'
    ),
    (
        'Bateria',
        'DW',
        'Collector''s',
        'Mi'
    ),
    (
        'Teclado',
        'Korg',
        'Kronos',
        'Dó'
    ),
    (
        'Teclado',
        'Roland',
        'Jupiter',
        'Dó'
    ),
    (
        'Saxofone',
        'Yamaha',
        'Alto',
        'Sol'
    ),
    (
        'Saxofone',
        'Selmer',
        'Mark VI',
        'Sol'
    ),
    (
        'Guitarra',
        'Gibson',
        'SG',
        'Mi'
    ),
    (
        'Baixo',
        'Ibanez',
        'BTB',
        'Sol'
    ),
    (
        'Bateria',
        'Tama',
        'Superstar',
        'Mi'
    ),
    (
        'Teclado',
        'Nord',
        'Stage',
        'Dó'
    ),
    (
        'Saxofone',
        'Yamaha',
        'Tenor',
        'Sol'
    ),
    (
        'Violino',
        'Stradivarius',
        'Cremonese',
        'Ré'
    ),
    (
        'Viola',
        'Stentor',
        'Student',
        'Sol'
    ),
    (
        'Violoncelo',
        'Gliga',
        'Gems',
        'Dó'
    ),
    (
        'Trompete',
        'Bach',
        'Stradivarius',
        'Dó'
    ),
    (
        'Trombone',
        'Yamaha',
        'YSL',
        'Si bemol'
    );
-- -----------------------------------------------------
-- Populando a tabela gravadora.endereco
-- -----------------------------------------------------
INSERT INTO gravadora.endereco (
        rua,
        bairro,
        numero,
        cidade,
        complemento,
        estado,
        cep
    )
VALUES (
        'Rua A',
        'Centro',
        123,
        'São Paulo',
        'Apto 101',
        'SP',
        '01010-010'
    ),
    (
        'Rua B',
        'Jardim',
        456,
        'Rio de Janeiro',
        NULL,
        'RJ',
        '20000-000'
    ),
    (
        'Rua C',
        'Centro',
        789,
        'Belo Horizonte',
        'Sala 102',
        'MG',
        '30110-000'
    ),
    (
        'Rua D',
        'São Francisco',
        1011,
        'Curitiba',
        NULL,
        'PR',
        '80010-010'
    ),
    (
        'Rua E',
        'Copacabana',
        1213,
        'Porto Alegre',
        'Casa 201',
        'RS',
        '90010-010'
    ),
    (
        'Rua F',
        'Praia de Iracema',
        1415,
        'Fortaleza',
        NULL,
        'CE',
        '60000-000'
    ),
    (
        'Rua G',
        'Barra',
        1617,
        'Salvador',
        'Casa 301',
        'BA',
        '40000-000'
    ),
    (
        'Rua H',
        'Boa Viagem',
        1819,
        'Recife',
        NULL,
        'PE',
        '50000-000'
    ),
    (
        'Rua I',
        'Bela Vista',
        2021,
        'Campinas',
        'Apto 402',
        'SP',
        '13010-010'
    ),
    (
        'Rua J',
        'Califórnia',
        2223,
        'Santos',
        NULL,
        'SP',
        '11010-010'
    ),
    (
        'Rua K',
        'São Cristóvão',
        2425,
        'Niterói',
        'Sala 502',
        'RJ',
        '24000-000'
    ),
    (
        'Rua L',
        'Batel',
        2627,
        'Curitiba',
        NULL,
        'PR',
        '80010-020'
    ),
    (
        'Rua M',
        'Alto da Boa Vista',
        2829,
        'São Paulo',
        'Casa 301',
        'SP',
        '01010-020'
    ),
    (
        'Rua N',
        'Centro',
        3031,
        'Belo Horizonte',
        NULL,
        'MG',
        '30110-010'
    ),
    (
        'Rua O',
        'Jardins',
        3233,
        'São Paulo',
        'Apto 201',
        'SP',
        '01010-030'
    ),
    (
        'Rua P',
        'Laranjeiras',
        3435,
        'Rio de Janeiro',
        NULL,
        'RJ',
        '20000-010'
    ),
    (
        'Rua Q',
        'Centro',
        3637,
        'Salvador',
        'Loja 103',
        'BA',
        '40000-010'
    ),
    (
        'Rua R',
        'Boa Viagem',
        3839,
        'Recife',
        NULL,
        'PE',
        '50000-010'
    ),
    (
        'Rua S',
        'Centro',
        4041,
        'Fortaleza',
        'Sala 502',
        'CE',
        '60000-010'
    ),
    (
        'Rua T',
        'Copacabana',
        4243,
        'Porto Alegre',
        NULL,
        'RS',
        '90010-020'
    );
-- -----------------------------------------------------
-- Populando a tabela gravadora.musico
-- -----------------------------------------------------
INSERT INTO gravadora.musico (
        nome,
        cpf,
        telefone,
        celular,
        email,
        endereco_id_endereco
    )
VALUES (
        'João Silva',
        '123.456.789-00',
        '(21) 1234-5678',
        '(21) 99999-9999',
        'joao.silva@gmail.com',
        1
    ),
    (
        'Maria Souza',
        '987.654.321-00',
        '(11) 2345-6789',
        '(11) 99999-9999',
        'maria.souza@gmail.com',
        2
    ),
    (
        'Pedro Santos',
        '234.567.890-00',
        '(31) 3456-7890',
        '(31) 99999-9999',
        'pedro.santos@gmail.com',
        3
    ),
    (
        'Ana Oliveira',
        '765.432.109-00',
        '(41) 4567-8901',
        '(41) 99999-9999',
        'ana.oliveira@gmail.com',
        4
    ),
    (
        'Carlos Pereira',
        '456.789.012-00',
        '(51) 5678-9012',
        '(51) 99999-9999',
        'carlos.pereira@gmail.com',
        5
    ),
    (
        'Julia Costa',
        '098.765.432-00',
        '(81) 6789-0123',
        '(81) 99999-9999',
        'julia.costa@gmail.com',
        6
    ),
    (
        'Lucas Ferreira',
        '567.890.123-00',
        '(85) 7890-1234',
        '(85) 99999-9999',
        'lucas.ferreira@gmail.com',
        7
    ),
    (
        'Mariana Alves',
        '210.987.654-00',
        '(67) 8901-2345',
        '(67) 99999-9999',
        'mariana.alves@gmail.com',
        8
    ),
    (
        'Gustavo Rodrigues',
        '678.901.234-00',
        '(92) 9012-3456',
        '(92) 99999-9999',
        'gustavo.rodrigues@gmail.com',
        9
    ),
    (
        'Isabela Nunes',
        '321.098.765-00',
        '(13) 0123-4567',
        '(13) 99999-9999',
        'isabela.nunes@gmail.com',
        10
    ),
    (
        'Ricardo Costa',
        '890.123.456-00',
        '(85) 2345-6789',
        '(85) 99999-9999',
        'ricardo.costa@gmail.com',
        11
    ),
    (
        'Patricia Lima',
        '432.109.876-00',
        '(31) 3456-7890',
        '(31) 99999-9999',
        'patricia.lima@gmail.com',
        12
    ),
    (
        'Fernando Gomes',
        '901.234.567-00',
        '(41) 4567-8901',
        '(41) 99999-9999',
        'fernando.gomes@gmail.com',
        13
    ),
    (
        'Larissa Santos',
        '109.876.543-00',
        '(51) 5678-9012',
        '(51) 99999-9999',
        'larissa.santos@gmail.com',
        14
    ),
    (
        'Diego Almeida',
        '234.567.890-00',
        '(21) 6789-0123',
        '(21) 99999-9999',
        'diego.almeida@gmail.com',
        15
    ),
    (
        'Mariana Silva',
        '765.432.109-00',
        '(11) 2345-6789',
        '(11) 99999-9999',
        'mariana.silva@gmail.com',
        16
    ),
    (
        'Tiago Oliveira',
        '456.789.012-00',
        '(31) 3456-7890',
        '(31) 99999-9999',
        'tiago.oliveira@gmail.com',
        17
    ),
    (
        'Amanda Pereira',
        '098.765.432-00',
        '(41) 4567-8901',
        '(41) 99999-9999',
        'amanda.pereira@gmail.com',
        18
    ),
    (
        'Lucas Costa',
        '567.890.123-00',
        '(51) 5678-9012',
        '(51) 99999-9999',
        'lucas.costa@gmail.com',
        19
    ),
    (
        'Gabriela Alves',
        '210.987.654-00',
        '(21) 6789-0123',
        '(21) 99999-9999',
        'gabriela.alves@gmail.com',
        20
    );
-- --------------------------------------------------------
-- Populando a tabela de Estilo Musical
-- --------------------------------------------------------
INSERT INTO gravadora.estilo_musical (nome, descricao)
VALUES (
        'Samba',
        'Samba é um gênero musical e estilo de dança brasileiro, com suas raízes na África através do comércio de escravos africanos e tradições religiosas africanas, especialmente de Angola e do Congo, através do gênero samba de roda do estado brasileiro do nordeste da Bahia, do qual se originou.'
    ),
    (
        'Forró',
        'Forró é um gênero de música brasileira que se originou no Nordeste do Brasil. Ele abrange vários estilos de dança, bem como vários ritmos musicais diferentes. A palavra forró vem da palavra forrobodó, que significa "grande festa" ou "tumulto".'
    ),
    (
        'Bossa Nova',
        'Bossa Nova é um estilo de música brasileira que se originou no final da década de 1950. É caracterizado por suas melodias suaves e fluidas e ritmos suaves, e muitas vezes é associado à cultura de praia do Rio de Janeiro.'
    ),
    (
        'MPB',
        'Música Popular Brasileira (MPB) é um gênero de música brasileira que abrange muitos estilos e influências diferentes, incluindo samba, bossa nova e música folclórica de várias regiões do Brasil.'
    ),
    (
        'Tropicalismo',
        'Tropicalismo é um movimento cultural brasileiro que surgiu no final dos anos 1960. Ele abrangeu música, arte e literatura, e foi caracterizado por sua irreverência, experimentação e abraço da identidade cultural brasileira.'
    ),
    (
        'Baião',
        'Baião é um gênero de música brasileira que se originou no estado nordestino de Pernambuco. É caracterizado por seu ritmo distinto, que se baseia no tambor zabumba, e muitas vezes é associado à música tradicional do sertão ou do interior do Nordeste brasileiro.'
    ),
    (
        'Choro',
        'Choro é um gênero de música brasileira que se originou no final do século XIX. É caracterizado por suas melodias complexas, habilidades instrumentais virtuosísticas e improvisação, e muitas vezes é associado à cidade do Rio de Janeiro.'
    ),
    (
        'Maracatu',
        'Maracatu é um gênero de música brasileira que se originou no estado nordestino de Pernambuco. É caracterizado por sua percussão pesada e ritmos majestosos, e muitas vezes é associado às tradições religiosas afro-brasileiras.'
    ),
    (
        'Frevo',
        'Frevo é um gênero de música brasileira que se originou no estado nordestino de Pernambuco. É caracterizado por seus ritmos rápidos e sincopados, e muitas vezes é associado às celebrações de carnaval da região.'
    ),
    (
        'Sertanejo',
        'Sertanejo é um gênero de música brasileira que se originou nas áreas rurais do país, especialmente nas regiões nordeste e centro-oeste. É caracterizado pelo uso de violões acústicos, acordeões e outros instrumentos tradicionais, e muitas vezes é associado a temas de amor e à vida rural.'
    ),
    (
        'Axé',
        'Axé é um gênero de música brasileira que se originou no estado da Bahia na década de 1980. É caracterizado por seus ritmos animados e letras otimistas, e muitas vezes é associado às celebrações de carnaval da região.'
    ),
    (
        'Pagode',
        'Pagode é um gênero de música brasileira que se originou na cidade do Rio de Janeiro na década de 1970. É caracterizado pelo uso de instrumentos de percussão, especialmente o pandeiro, e muitas vezes é associado ao samba.'
    ),
    (
        'Funk Carioca',
        'Funk Carioca é um gênero de música brasileira que se originou nas favelas do Rio de Janeiro na década de 1980. É caracterizado por suas linhas de baixo pesadas e letras explícitas, e muitas vezes é associado ao estilo de dança conhecido como passinho.'
    ),
    (
        'Manguebeat',
        'Manguebeat é um gênero de música brasileira que se originou na cidade de Recife na década de 1990. É caracterizado por sua mistura de ritmos tradicionais do Nordeste com influências de rock e hip-hop, e muitas vezes é associado aos movimentos sociais e políticos da época.'
    ),
    (
        'Funk Ostentação',
        'Funk Ostentação é um gênero de música brasileira que se originou na cidade de São Paulo na década de 2010. É caracterizado por suas letras sobre riqueza, luxo e posses materiais, e muitas vezes é associado às favelas da cidade.'
    ),
    (
        'Samba-Enredo',
        'Samba-Enredo é um gênero de música brasileira que está associado às celebrações de carnaval do país. É caracterizado pelo uso de arranjos de percussão elaborados e seu foco em contar uma história ou transmitir uma mensagem através das letras.'
    ),
    (
        'Sertanejo Universitário',
        'Sertanejo Universitário é um subgênero do Sertanejo que surgiu na década de 2000. É caracterizado pelo uso de guitarras elétricas e teclados, e seu foco em temas de amor e relacionamentos românticos.'
    ),
    (
        'Música Gospel',
        'Música Gospel é um gênero de música brasileira que está associado ao culto cristão e ao evangelismo. Ela abrange muitos estilos diferentes, incluindo rock, pop e samba.'
    ),
    (
        'Reggaeton Brasileiro',
        'Reggaeton Brasileiro é um gênero de música brasileira que é influenciado pelo gênero latino-americano de reggaeton. É caracterizado pelo uso de batidas eletrônicas e seu foco em temas de amor e sexualidade.'
    ),
    (
        'Piseiro',
        'Piseiro é um gênero de música brasileira que se originou no estado nordestino da Paraíba na década de 2010. É caracterizado pelo uso de acordeão e instrumentos de percussão, e seu foco em ritmos dançantes e melodias cativantes.'
    );
-- --------------------------------------------------------
-- Popula a tabela de musica_has_estilo
-- --------------------------------------------------------
INSERT INTO gravadora.musica_has_estilo (musica_id_musica, estilo_id_estilo)
VALUES
    (1, 4),
    (1, 8),
    (2, 4),
    (2, 8),
    (3, 5),
    (3, 10),
    (4, 5),
    (4, 10),
    (5, 5),
    (5, 10),
    (6, 5),
    (6, 10),
    (7, 6),
    (7, 11),
    (8, 6),
    (8, 11),
    (9, 1),
    (9, 2),
    (10, 1),
    (10, 2);
-- --------------------------------------------------------
-- Popula a tabela de autor_letra
-- --------------------------------------------------------
INSERT INTO gravadora.autor_letra (musico_id_musico, musica_id_musica)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (1, 5),
       (2, 6),
       (2, 7),
       (2, 8),
       (2, 9),
       (2, 10),
       (3, 11),
       (3, 12),
       (3, 13),
       (3, 14),
       (4, 15),
       (4, 16),
       (4, 17),
       (4, 18),
       (5, 19),
       (5, 20);
-- --------------------------------------------------------
-- Popula a tabela de autor_musica
-- --------------------------------------------------------
INSERT INTO gravadora.autor_musica (musico_id_musico, musica_id_musica)
VALUES (6, 1),
       (6, 2),
       (6, 3),
       (6, 4),
       (6, 5),
       (7, 6),
       (7, 7),
       (7, 8),
       (7, 9),
       (7, 10),
       (8, 11),
       (8, 12),
       (8, 13),
       (8, 14),
       (9, 15),
       (9, 16),
       (9, 17),
       (9, 18),
       (10, 19),
       (10, 20);
-- --------------------------------------------------------
-- Popula a tabela de banda
-- --------------------------------------------------------
INSERT INTO gravadora.banda (
        nome,
        descricao,
        data_criacao,
        musico_id_membro,
        estilo_musical_id_estilo_musical,
        musico_id_lidera
    )
VALUES (
        'Os Paralamas do Sucesso',
        'Banda brasileira de rock formada em 1982',
        '1982-05-01',
        1,
        7,
        1
    ),
    (
        'Legião Urbana',
        'Banda brasileira de rock formada em Brasília em 1982',
        '1982-01-01',
        2,
        4,
        2
    ),
    (
        'Titãs',
        'Banda brasileira de rock formada em São Paulo em 1982',
        '1982-02-01',
        3,
        4,
        3
    ),
    (
        'Engenheiros do Hawaii',
        'Banda brasileira de rock formada em Porto Alegre em 1984',
        '1984-01-01',
        4,
        4,
        4
    ),
    (
        'Os Mutantes',
        'Banda brasileira de rock formada em São Paulo em 1966',
        '1966-01-01',
        5,
        5,
        5
    ),
    (
        'Raimundos',
        'Banda brasileira de rock formada em Brasília em 1987',
        '1987-01-01',
        6,
        1,
        6
    ),
    (
        'O Rappa',
        'Banda brasileira de rock formada no Rio de Janeiro em 1993',
        '1993-01-01',
        7,
        2,
        7
    ),
    (
        'Charlie Brown Jr.',
        'Banda brasileira de rock formada em Santos em 1992',
        '1992-01-01',
        8,
        1,
        8
    ),
    (
        'Cidade Negra',
        'Banda brasileira de reggae formada no Rio de Janeiro em 1986',
        '1986-01-01',
        9,
        1,
        9
    ),
    (
        'Skank',
        'Banda brasileira de rock formada em Belo Horizonte em 1991',
        '1991-01-01',
        10,
        7,
        10
    ),
    (
        'Barão Vermelho',
        'Banda brasileira de rock formada no Rio de Janeiro em 1981',
        '1981-01-01',
        11,
        7,
        11
    ),
    (
        'Paralamas do Sucesso',
        'Banda brasileira de rock formada em 1982',
        '1982-05-01',
        12,
        7,
        12
    ),
    (
        'Tribalistas',
        'Banda brasileira de MPB formada em 2002',
        '2002-01-01',
        13,
        3,
        13
    ),
    (
        'Mamonas Assassinas',
        'Banda brasileira de rock cômico formada em Guarulhos em 1990',
        '1990-01-01',
        14,
        4,
        14
    ),
    (
        'Novos Baianos',
        'Banda brasileira de MPB formada em Salvador em 1969',
        '1969-01-01',
        15,
        1,
        15
    ),
    (
        'Rappa Mundi',
        'Banda brasileira de rock formada em 1995',
        '1995-01-01',
        16,
        2,
        16
    ),
    (
        'Blitz',
        'Banda brasileira de rock formada no Rio de Janeiro em 1980',
        '1980-01-01',
        17,
        4,
        17
    ),
    (
        'Kid Abelha',
        'Banda brasileira de rock formada no Rio de Janeiro em 1981',
        '1981-01-01',
        18,
        2,
        18
    ),
    (
        'Ira!',
        'Banda brasileira de rock formada em São Paulo em 1981',
        '1981-01-01',
        19,
        4,
        19
    ),
    (
        'Roupa Nova',
        'Banda brasileira de pop rock formada no Rio de Janeiro em 1970',
        '1970-01-01',
        20,
        4,
        20
    );
-- --------------------------------------------------------
-- Popula a tabela de musica
-- --------------------------------------------------------
INSERT INTO gravadora.musica (nome, duracao, banda_id_banda, musico_id_musico)
VALUES ('Garota de Ipanema', '3:17', 6, 6),
    ('Chega de Saudade', '4:12', 6, 6),
    ('Aquele Abraço', '2:43', 7, 7),
    ('Meu Erro', '4:14', 7, 7),
    ('Toda Forma de Amor', '3:05', 8, 8),
    ('Pro Dia Nascer Feliz', '4:00', 8, 8),
    ('Catedral', '5:00', 9, 9),
    ('Faz Parte do Meu Show', '4:10', 9, 9),
    ('Tempo Perdido', '3:10', 10, 10),
    ('Pais e Filhos', '4:50', 10, 10),
    ('Asa Branca', '3:00', 5, 5),
    ('Festa do Interior', '3:30', 5, 5),
    ('Fio de Cabelo', '3:20', 3, 3),
    ('Epitáfio', '3:30', 3, 3),
    ('Pintura Íntima', '3:50', 2, 2),
    ('Faroeste Caboclo', '9:00', 2, 2),
    ('Ainda é Cedo', '3:10', 1, 1),
    ('Vital e Sua Moto', '3:00', 1, 1),
    ('Puro Sangue', '2:30', 11, 11),
    ('Bete Balanço', '3:30', 11, 11);
-- --------------------------------------------------------
-- Popula a tabela de toca
-- --------------------------------------------------------
INSERT INTO gravadora.instrumento_musico (instrumento_id_instrumento, musico_id_musico)
VALUES (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4),
    (9, 5),
    (10, 5),
    (11, 6),
    (12, 6),
    (13, 7),
    (14, 7),
    (15, 8),
    (16, 8),
    (17, 9),
    (18, 9),
    (19, 10),
    (20, 10);
-- --------------------------------------------------------
-- Popula a tabela de album
-- --------------------------------------------------------
INSERT INTO gravadora.album (
        titulo,
        cod_album,
        data_lancamento,
        formato,
        musico_id_produtor,
        banda_id_banda
    )
VALUES (
        'Acústico MTV',
        001,
        '1997-01-01',
        'CD',
        1,
        1
    ),
    (
        'Dois',
        002,
        '1986-01-01',
        'Vinil',
        2,
        2
    ),
    (
        'Cabeça Dinossauro',
        003,
        '1986-01-01',
        'Vinil',
        3,
        3
    ),
    (
        'O Papa é Pop',
        004,
        '1988-01-01',
        'Vinil',
        4,
        4
    ),
    (
        'Mutantes',
        005,
        '1968-01-01',
        'Vinil',
        5,
        5
    ),
    (
        'Só no Forévis',
        006,
        '1999-01-01',
        'CD',
        6,
        6
    ),
    (
        'Lado B Lado A',
        007,
        '1999-01-01',
        'CD',
        7,
        7
    ),
    (
        'Transpiração Contínua Prolongada',
        008,
        '1997-01-01',
        'CD',
        8,
        8
    ),
    (
        'Sobre Todas as Forças',
        009,
        '1994-01-01',
        'CD',
        9,
        9
    ),
    (
        'O Samba Poconé',
        010,
        '1996-01-01',
        'CD',
        10,
        10
    ),
    (
        'Barão Vermelho 2',
        011,
        '1983-01-01',
        'Vinil',
        11,
        11
    ),
    (
        'Hey Na Na',
        012,
        '2002-01-01',
        'Digital',
        12,
        12
    ),
    (
        'Mamonas Assassinas',
        013,
        '1995-01-01',
        'CD',
        13,
        13
    ),
    (
        'Tribalistas',
        014,
        '2002-01-01',
        'CD',
        14,
        14
    ),
    (
        'Mamonas Assassinas',
        015,
        '1995-01-01',
        'Vinil',
        15,
        15
    ),
    (
        'Sinais do Sim',
        016,
        '2017-01-01',
        'Digital',
        16,
        16
    ),
    (
        'Música Popular Caiçara',
        017,
        '2007-01-01',
        'Digital',
        17,
        17
    ),
    (
        'Skank 91',
        018,
        '1992-01-01',
        'CD',
        18,
        18
    ),
    (
        'Lô Borges',
        019,
        '1972-01-01',
        'Vinil',
        19,
        19
    ),
    (
        'Estudando o Samba',
        020,
        '1976-01-01',
        'Vinil',
        20,
        20
    );

-- --------------------------------------------------------
-- Popula a tabela de album_musica
-- --------------------------------------------------------
INSERT INTO gravadora.album_musica (album_id_album, musica_id_musica)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 5),
  (3, 6),
  (4, 7),
  (4, 8),
  (5, 9),
  (5, 10),
  (6, 11),
  (6, 12),
  (7, 13),
  (7, 14),
  (8, 15),
  (8, 16),
  (9, 17),
  (9, 18),
  (10, 19),
  (10, 20);
-- --------------------------------------------------------
-- Popula a tabela de gravacao
-- --------------------------------------------------------
INSERT INTO gravadora.gravacao (
        musica_id_musica,
        musico_id_musico,
        instrumento_id_instrumento,
        data_gravacao
    )
VALUES (1, 1, 1, '2022-01-01'),
    (1, 2, 2, '2022-01-02'),
    (2, 3, 3, '2022-01-03'),
    (2, 4, 4, '2022-01-04'),
    (3, 5, 5, '2022-01-05'),
    (3, 6, 6, '2022-01-06'),
    (4, 7, 7, '2022-01-07'),
    (4, 8, 8, '2022-01-08'),
    (5, 9, 9, '2022-01-09'),
    (5, 10, 10, '2022-01-10'),
    (6, 11, 11, '2022-01-11'),
    (6, 12, 12, '2022-01-12'),
    (7, 13, 13, '2022-01-13'),
    (7, 14, 14, '2022-01-14'),
    (8, 15, 15, '2022-01-15'),
    (8, 16, 16, '2022-01-16'),
    (9, 17, 17, '2022-01-17'),
    (9, 18, 18, '2022-01-18'),
    (10, 19, 19, '2022-01-19'),
    (10, 20, 20, '2022-01-20');