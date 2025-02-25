# Banco de Dados - enunciados dos exercícios

## Exercício 03 - 25/02/2025

Insira mais dois fabricantes em seu banco de dados `vendas`:

- Positivo
- Microsoft

Adicione mais dois produtos na tabela `produtos` conforme indicado:

- Xbox Series S
    - Valor: R$ 1.997,00
    - Quantidade: 5
    - Fabricante: Microsoft
    - Descrição: Velocidade e desempenho de última geração.
- Notebook Motion
    - Quantidade: 8
    - Valor: R$ 1.213,65
    - Fabricante: Positivo
    - Descrição: Intel Dual Core 4GB de RAM, 128GB SSD e Tela 14,1 polegadas.

---

## Exercício 02 - 24/02/2025

No **phpMyAdmin** utilizando comandos SQL para fazer a **Modelagem Física** do exercício anterior (Catálogo de Filmes).

Você deve:

- Criar um novo banco de dados (Catálogo de Filmes)
- Criar três tabelas, conforme a modelagem feita em seu exercício anterior
- Fazer o relacionamento entre as tabelas, definindo a ligação entre chaves estrageiras e primárias.

---

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