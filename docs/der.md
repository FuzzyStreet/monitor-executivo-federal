# Diagrama Entidade-Relacionamento (DER)

Este documento descreve o Diagrama Entidade-Relacionamento (DER) do projeto
**Monitoramento do Executivo Federal**, servindo como base conceitual para a
construção do modelo lógico e da implementação em SQL.

O modelo foi desenvolvido com foco em normalização, clareza semântica e
possibilidade de análise temporal.

---

## Entidades Identificadas

O modelo é composto pelas seguintes entidades:

- PODER
- MANDATO
- CARGO
- ORGAO
- GESTOR_PUBLICO
- NOMEACAO
- AREA_TEMATICA
- PROMESSA
- ACAO_GOVERNAMENTAL
- EXECUCAO_PROMESSA

---

## Descrição das Entidades

### PODER
Representa os poderes da República.

- id_poder (PK)
- nome

Relacionamento:
- Um PODER possui vários CARGOS (1:N)

---

### MANDATO
Representa um período de governo do Poder Executivo Federal.

- id_mandato (PK)
- data_inicio
- data_fim

Relacionamento:
- Um MANDATO possui várias NOMEACOES (1:N)
- Um MANDATO possui várias PROMESSAS (1:N)

---

### CARGO
Representa cargos do Executivo Federal.

- id_cargo (PK)
- nome
- poder_id (FK)

Relacionamento:
- Um CARGO pertence a um PODER (N:1)
- Um CARGO pode estar associado a várias NOMEACOES (1:N)

---

### ORGAO
Representa órgãos da administração pública federal.

- id_orgao (PK)
- nome

Relacionamento:
- Um ORGAO possui vários GESTORES_PUBLICOS (1:N)
- Um ORGAO executa várias ACOES_GOVERNAMENTAIS (1:N)

---

### GESTOR_PUBLICO
Representa gestores ou autoridades públicas.

- id_gestor (PK)
- nome
- orgao_id (FK)

Relacionamento:
- Um GESTOR_PUBLICO pertence a um ORGAO (N:1)
- Um GESTOR_PUBLICO pode possuir várias NOMEACOES (1:N)

---

### NOMEACAO
Entidade associativa responsável por registrar a ocupação de cargos ao longo
do tempo, resolvendo a dimensão temporal do modelo.

- id_nomeacao (PK)
- gestor_id (FK)
- cargo_id (FK)
- mandato_id (FK)
- data_inicio
- data_fim

Relacionamento:
- Uma NOMEACAO está associada a um único GESTOR_PUBLICO
- Uma NOMEACAO refere-se a um único CARGO
- Uma NOMEACAO ocorre em um único MANDATO

Observação:
- Esta entidade aparece **uma única vez** no modelo, centralizando os vínculos
temporais entre gestor, cargo e mandato.

---

### AREA_TEMATICA
Representa áreas de atuação governamental (ex: Saúde, Educação).

- id_area (PK)
- nome

Relacionamento:
- Uma AREA_TEMATICA possui várias PROMESSAS (1:N)

---

### PROMESSA
Representa promessas ou compromissos assumidos durante um mandato.

- id_promessa (PK)
- descricao
- mandato_id (FK)
- area_id (FK)

Relacionamento:
- Uma PROMESSA pertence a um MANDATO (N:1)
- Uma PROMESSA pertence a uma AREA_TEMATICA (N:1)
- Uma PROMESSA pode ter várias EXECUCOES_PROMESSA (1:N)

---

### ACAO_GOVERNAMENTAL
Representa ações, programas ou iniciativas executadas por órgãos públicos.

- id_acao (PK)
- descricao
- orgao_id (FK)

Relacionamento:
- Uma ACAO_GOVERNAMENTAL pertence a um ORGAO (N:1)
- Uma ACAO_GOVERNAMENTAL pode contribuir para várias PROMESSAS (N:N)

---

### EXECUCAO_PROMESSA
Entidade associativa que relaciona PROMESSAS e ACOES_GOVERNAMENTAIS, permitindo
avaliar a execução das promessas de forma gradual.

- id_execucao (PK)
- promessa_id (FK)
- acao_id (FK)
- percentual_execucao
- observacao

Relacionamento:
- Cada registro associa uma ACAO_GOVERNAMENTAL a uma PROMESSA

---

## Considerações Finais

O DER proposto prioriza:
- Normalização dos dados
- Clareza nos relacionamentos
- Análise temporal das nomeações
- Avaliação não binária da execução de promessas

Este modelo serve como base para a construção do modelo lógico e da
implementação física do banco de dados.
