-- -----------------------------------------------------
-- Criando as tabelas
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Esquema gravadora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS gravadora;
SET search_path = gravadora;
-- -----------------------------------------------------
-- Tabela gravadora.instrumento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.instrumento (
    id_instrumento SERIAL NOT NULL,
    nome VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    tom_musical VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_instrumento)
);
-- -----------------------------------------------------
-- Tabela gravadora.endereco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.endereco (
    id_endereco SERIAL NOT NULL,
    rua VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    numero INT NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    complemento VARCHAR(45) NULL,
    estado VARCHAR(45) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_endereco)
);
-- -----------------------------------------------------
-- Tabela gravadora.musico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.musico (
    id_musico SERIAL NOT NULL,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    email VARCHAR(45) NOT NULL,
    endereco_id_endereco INT NOT NULL,
    PRIMARY KEY (id_musico),
    CONSTRAINT fk_musico_endereco FOREIGN KEY (endereco_id_endereco) REFERENCES gravadora.endereco (id_endereco) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.estiloMusical
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.estilo_musical (
    id_estilo_musical SERIAL NOT NULL,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(350) NOT NULL,
    PRIMARY KEY (id_estilo_musical)
);
-- -----------------------------------------------------
-- Tabela gravadora.banda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.banda (
    id_banda SERIAL NOT NULL,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(350) NOT NULL,
    data_criacao DATE NOT NULL,
    musico_id_membro INT NOT NULL,
    estilo_musical_id_estilo_musical INT NOT NULL,
    musico_id_lidera INT NOT NULL,
    PRIMARY KEY (id_banda),
    CONSTRAINT fk_banda_musico1 FOREIGN KEY (musico_id_membro) REFERENCES gravadora.musico (id_musico) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_banda_estilo_musical1 FOREIGN KEY (estilo_musical_id_estilo_musical) REFERENCES gravadora.estilo_musical (id_estilo_musical) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_banda_musico2 FOREIGN KEY (musico_id_lidera) REFERENCES gravadora.musico (id_musico) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.musica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.musica (
    id_musica SERIAL NOT NULL,
    nome VARCHAR(45) NOT NULL,
    duracao VARCHAR(45) NOT NULL,
    banda_id_banda INT NOT NULL,
    musico_id_musico INT NOT NULL,
    PRIMARY KEY (id_musica),
    CONSTRAINT fk_music_banda1 FOREIGN KEY (banda_id_banda) REFERENCES gravadora.banda (id_banda) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_music_musico1 FOREIGN KEY (musico_id_musico) REFERENCES gravadora.musico (id_musico) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.toca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.instrumento_musico (
    instrumento_id_instrumento INT NOT NULL,
    musico_id_musico INT NOT NULL,
    PRIMARY KEY (instrumento_id_instrumento, musico_id_musico),
    CONSTRAINT fk_inst_music_instrumento FOREIGN KEY (instrumento_id_instrumento) REFERENCES gravadora.instrumento (id_instrumento) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_inst_music_musico FOREIGN KEY (musico_id_musico) REFERENCES gravadora.musico (id_musico) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.album
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.album (
    id_album SERIAL NOT NULL,
    titulo VARCHAR(45) NOT NULL,
    cod_album INT NOT NULL,
    data_lancamento DATE NOT NULL,
    formato VARCHAR(45) NOT NULL,
    musico_id_produtor INT NOT NULL,
    banda_id_banda INT NOT NULL,
    PRIMARY KEY (id_album),
    CONSTRAINT fk_album_musico1 FOREIGN KEY (musico_id_produtor) REFERENCES gravadora.musico (id_musico) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_album_banda1 FOREIGN KEY (banda_id_banda) REFERENCES gravadora.banda (id_banda) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.album_musica (musicaPertenceAlbum)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.album_musica (
    album_id_album INT NOT NULL,
    musica_id_musica INT NOT NULL,
    PRIMARY KEY (album_id_album, musica_id_musica),
    CONSTRAINT fk_album_musica_album FOREIGN KEY (album_id_album) REFERENCES gravadora.album (id_album) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_album_musica_musica FOREIGN KEY (musica_id_musica) REFERENCES gravadora.musica (id_musica) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.musicaHasEstilo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.musica_has_estilo (
    musica_id_musica INT NOT NULL,
    estilo_id_estilo INT NOT NULL,
    PRIMARY KEY (musica_id_musica, estilo_id_estilo),
    CONSTRAINT fk_estilo_musical_musica FOREIGN KEY (musica_id_musica) REFERENCES gravadora.musica (id_musica) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_estilo_musical_estilo FOREIGN KEY (estilo_id_estilo) REFERENCES gravadora.estilo_musical (id_estilo_musical) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.autorLetra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.autor_letra (
    musico_id_musico INT NOT NULL,
    musica_id_musica INT NOT NULL,
    PRIMARY KEY (musico_id_musico, musica_id_musica),
    CONSTRAINT fk_autor_letra_musico FOREIGN KEY (musico_id_musico) REFERENCES gravadora.musico (id_musico) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_autor_letra_musica FOREIGN KEY (musica_id_musica) REFERENCES gravadora.musica (id_musica) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.autorMusica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.autor_musica (
    musico_id_musico INT NOT NULL,
    musica_id_musica INT NOT NULL,
    PRIMARY KEY (musico_id_musico, musica_id_musica),
    CONSTRAINT fk_musica_autor_musico FOREIGN KEY (musico_id_musico) REFERENCES gravadora.musico (id_musico) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_musica_autor_musica FOREIGN KEY (musica_id_musica) REFERENCES gravadora.musica (id_musica) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Tabela gravadora.gravacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gravadora.gravacao (
    musica_id_musica INT NOT NULL,
    musico_id_musico INT NOT NULL,
    instrumento_id_instrumento INT NOT NULL,
    data_gravacao DATE NOT NULL,
    PRIMARY KEY (
        musica_id_musica,
        musico_id_musico,
        instrumento_id_instrumento
    ),
    CONSTRAINT fk_gravacao_musico FOREIGN KEY (musico_id_musico) REFERENCES gravadora.musico (id_musico) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_gravacao_musica FOREIGN KEY (musica_id_musica) REFERENCES gravadora.musica (id_musica) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_gravacao_instrumento FOREIGN KEY (instrumento_id_instrumento) REFERENCES gravadora.instrumento (id_instrumento) ON DELETE NO ACTION ON UPDATE NO ACTION
);