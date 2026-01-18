# Visão Conceitual do Projeto

Este documento registra a visão conceitual inicial do banco de dados
do projeto Monitoramento do Executivo Federal.

Seu objetivo é servir como base para a construção do Diagrama
Entidade-Relacionamento (DER) e do modelo lógico relacional.

---

## Visão Resumida (Mental)

PODER → CARGO → GESTOR_PUBLICO
          ↓
        ORGAO
          ↓
       NOMEACAO → MANDATO

MANDATO → PROMESSA → EXECUCAO_PROMESSA ← ACAO_GOVERNAMENTAL
                     ↑
               AREA_TEMATICA

---

## Observações

- Esta visão não representa o modelo final
- Alterações podem ocorrer durante o processo de modelagem
- O modelo busca garantir normalização e análise temporal
