CREATE TABLE IF NOT EXISTS seguradora(
    id SERIAL,
    nome text NOT NULL,
    token text NOT NULL
);

CREATE TABLE IF NOT EXISTS ocorrencia(
    id SERIAL,
    descricao TEXT NOT NULL,
    dano TEXT NULL,
    created_at DATE NULL
);

CREATE TABLE IF NOT EXISTS usuario(
    id SERIAL,
    ocorrencia_id NUMERIC NOT NULL,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    telefone TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS veiculo(
    id SERIAL,
    ocorrencia_id NUMERIC NOT NULL,
    fabricante TEXT NULL,
    modelo TEXT NULL,
    cor TEXT NULL,
    placa TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS foto(
    id SERIAL,
    ocorrencia_id NUMERIC NOT NULL,
    link TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS geolocation(
    id SERIAL,
    ocorrencia_id NUMERIC NOT NULL,
    ip_address TEXT NOT NULL,
    pais TEXT NULL,
    cidade TEXT NULL
);

CREATE TABLE IF NOT EXISTS avaliacao(
    id SERIAL,
    ocorrencia_id NUMERIC NOT NULL,
    cliente_atual BOOLEAN NULL,
    bem_atendido BOOLEAN NULL,
    sugestao TEXT NULL,
    nota_geral NUMERIC NULL
);

INSERT INTO seguradora (nome, token) VALUES
 ('Seguradora 1', 'VD6DGS8FJ34F'),
 ('Seguradora 2', 'GV34GD9G5D31');

INSERT INTO ocorrencia (descricao, dano) VALUES
 ('Acidente na lateral', 'Leve');

INSERT INTO usuario (ocorrencia_id, nome, email, telefone) VALUES
 ('1', 'Nome', 'email@email.com.br', '9999-0000');

INSERT INTO veiculo (ocorrencia_id, fabricante, modelo, cor, placa) VALUES
 ('1', 'Fiat', '147', 'Azul Marinho', 'PLA-0000');

INSERT INTO foto (ocorrencia_id, link) VALUES
 ('1', 'foto001.jpg');

INSERT INTO geolocation (ocorrencia_id, ip_address, pais, cidade) VALUES
 ('1', '127.0.0.1', 'Brasil', 'São Paulo');

INSERT INTO avaliacao (ocorrencia_id, cliente_atual, bem_atendido, sugestao, nota_geral) VALUES
 ('1', 'false', 'true', 'Nenhuma', '10');

