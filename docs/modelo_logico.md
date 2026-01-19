# Modelo Lógico do Banco de Dados  
**Projeto: Monitoramento do Executivo Federal**

---

## 1. Introdução

Este documento descreve a transformação do **Diagrama Entidade-Relacionamento (DER)** do projeto *Monitoramento do Executivo Federal* em um **modelo lógico relacional**, adequado à implementação em sistemas de gerenciamento de banco de dados relacionais (SGBDs).

O objetivo é explicar, de forma clara e fundamentada, as decisões de modelagem adotadas, incluindo a definição de tabelas, chaves primárias, chaves estrangeiras e relacionamentos.

---

## 2. Visão Geral do Modelo Lógico

O modelo lógico foi construído a partir de seis entidades principais:

- **GESTOR**
- **CARGO**
- **MANDATO**
- **NOMEACAO**
- **PROMESSA**
- **EXECUCAO_PROMESSA**

A entidade **NOMEACAO** exerce papel central no modelo, atuando como entidade associativa que conecta gestores, cargos e mandatos, além de permitir o vínculo com a execução de promessas.

---

## 3. Transformação das Entidades em Tabelas

### 3.1 GESTOR

Representa o agente público que ocupa cargos no Executivo Federal.

**Tabela:** `gestor`  
**Atributos:**
- `id_gestor` (PK)
- `nome`
- `cpf`
- `data_nascimento`
- `partido`

Cada gestor pode possuir **uma ou mais nomeações** ao longo do tempo.

---

### 3.2 CARGO

Representa os cargos existentes no Poder Executivo Federal.

**Tabela:** `cargo`  
**Atributos:**
- `id_cargo` (PK)
- `nome_cargo`
- `nivel`

Um cargo pode estar associado a **diversas nomeações**, mas cada nomeação refere-se a apenas um cargo.

---

### 3.3 MANDATO

Representa o período de exercício do Executivo Federal.

**Tabela:** `mandato`  
**Atributos:**
- `id_mandato` (PK)
- `data_inicio`
- `data_fim`

Um mandato pode conter **múltiplas nomeações** realizadas durante seu período de vigência.

---

### 3.4 NOMEACAO

Entidade associativa responsável por registrar a ocupação de um cargo por um gestor em determinado mandato.

**Tabela:** `nomeacao`  
**Atributos:**
- `id_nomeacao` (PK)
- `data_inicio`
- `data_fim`
- `id_gestor` (FK)
- `id_cargo` (FK)
- `id_mandato` (FK)

A tabela **NOMEACAO** resolve os relacionamentos 1:N entre:
- GESTOR → NOMEACAO
- CARGO → NOMEACAO
- MANDATO → NOMEACAO

---

### 3.5 PROMESSA

Representa promessas ou compromissos assumidos no contexto de um mandato.

**Tabela:** `promessa`  
**Atributos:**
- `id_promessa` (PK)
- `descricao`
- `area_tematica`

Uma promessa pode ser cumprida de forma **parcial ou progressiva**, sendo desdobrada em várias execuções.

---

### 3.6 EXECUCAO_PROMESSA

Representa ações concretas relacionadas à execução de uma promessa.

**Tabela:** `execucao_promessa`  
**Atributos:**
- `id_execucao` (PK)
- `descricao_acao`
- `data_execucao`
- `status`
- `id_promessa` (FK)
- `id_nomeacao` (FK)

Essa tabela permite o acompanhamento contínuo e não binário da execução das promessas.

---

## 4. Relacionamentos e Cardinalidades

| Entidade Origem | Entidade Destino | Cardinalidade |
|-----------------|------------------|---------------|
| GESTOR | NOMEACAO | 1 : N |
| CARGO | NOMEACAO | 1 : N |
| MANDATO | NOMEACAO | 1 : N |
| PROMESSA | EXECUCAO_PROMESSA | 1 : N |
| NOMEACAO | EXECUCAO_PROMESSA | 1 : N |

---

## 5. Justificativas de Modelagem

- A separação entre **PROMESSA** e **EXECUCAO_PROMESSA** evita uma visão binária do cumprimento.
- A entidade **NOMEACAO** permite registrar trocas de gestores, sobreposição de cargos e mudanças de mandato.
- O modelo está normalizado até, pelo menos, a **Terceira Forma Normal (3FN)**.
- O desenho favorece consultas analíticas e evolução futura do banco de dados.

---

## 6. Considerações Finais

O modelo lógico proposto atende aos objetivos acadêmicos do projeto, mantendo coerência conceitual, clareza estrutural e possibilidade de expansão futura, como inclusão de órgãos, indicadores de desempenho ou regionalização das ações.

---

📌 **Próximo passo sugerido:**  
Criação dos **scripts SQL** para implementação do modelo lógico no SGBD.
