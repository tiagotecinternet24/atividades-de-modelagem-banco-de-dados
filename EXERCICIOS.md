# Banco de Dados - enunciados dos exercícios

## Exercício 01 - 21/02/2025

Pensando em um **sistema de catálogo de filmes**, faça a modelagem de dados conforme orientações a seguir:

1) Gênero
    - Identificador 
    - Nome do gênero

2) Filme
    - Identificador
    - Título do filme
    - Data de lançamento

**Obs.:** o filme deve ter um gênero **relacionado** a tabela Gêneros, e um gênero pode ter vários filmes.

3) Detalhe do Filme

    - Identificador
    - Duração em minutos
    - Sinopse
    - Bilheteria *[opcional]*
    - Orçamento *[opcional]*

**Obs.:** os detalhes devem estar **relacionados** a um filme da tabela Filmes, e os detalhes pertecem a somente um filme.

### Qual modelagem fazer?

Você pode escolher e fazer:

- **Apenas** Modelagem Lógica (MySQL Workbench)
- Modelagem Conceitual (BrModelo) **e** Modelagem Lógica (MySQL Workbench)

Ao final do exercício, **exporte a modelagem como formato de imagem** e coloque em seu repositório.