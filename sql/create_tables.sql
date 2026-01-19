CREATE TABLE gestor (
    id_gestor SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    partido VARCHAR(50)
);

CREATE TABLE cargo (
    id_cargo SERIAL PRIMARY KEY,
    nome_cargo VARCHAR(150) NOT NULL,
    nivel VARCHAR(50)
);

CREATE TABLE mandato (
    id_mandato SERIAL PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE
);

CREATE TABLE promessa (
    id_promessa SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    area_tematica VARCHAR(100)
);

CREATE TABLE nomeacao (
    id_nomeacao SERIAL PRIMARY KEY,
    id_gestor INTEGER NOT NULL,
    id_cargo INTEGER NOT NULL,
    id_mandato INTEGER NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,

    CONSTRAINT fk_nomeacao_gestor
        FOREIGN KEY (id_gestor) REFERENCES gestor(id_gestor),

    CONSTRAINT fk_nomeacao_cargo
        FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo),

    CONSTRAINT fk_nomeacao_mandato
        FOREIGN KEY (id_mandato) REFERENCES mandato(id_mandato)
);

CREATE TABLE execucao_promessa (
    id_execucao SERIAL PRIMARY KEY,
    id_promessa INTEGER NOT NULL,
    id_nomeacao INTEGER NOT NULL,
    descricao_acao TEXT,
    data_execucao DATE,
    status VARCHAR(50),

    CONSTRAINT fk_execucao_promessa
        FOREIGN KEY (id_promessa) REFERENCES promessa(id_promessa),

    CONSTRAINT fk_execucao_nomeacao
        FOREIGN KEY (id_nomeacao) REFERENCES nomeacao(id_nomeacao)
);
