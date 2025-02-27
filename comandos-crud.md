# Comandos para operações CRUD no Banco de Dados

## Resumo

- C -> **C**reate   -> **INSERT**: inserir dados/registros na tabela
- R -> **R**ead     -> **SELECT**: consultar/ler dados/registros na tabela
- U -> **U**pdate   -> **UPDATE**: atualizar dados/registros na tabela
- D -> **D**elete   -> **DELETE**: excluir dados/registros na tabela

---

## INSERT (Fabricantes)

```sql
INSERT INTO fabricantes (nome) VALUES('Asus');
INSERT INTO fabricantes (nome) VALUES('Dell');
INSERT INTO fabricantes (nome) VALUES('Apple');

INSERT INTO fabricantes (nome) VALUES('LG'), ('Samsung'), ('Brastemp');
```

## SELECT (Fabricantes)

```sql
SELECT * FROM fabricantes;
```

---

## INSERT (Produtos)

```sql
INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Ultrabook', 
    'Equipamento de última geração cheio de recursos, e etc e tal...',
    3999.45,
    7,
    2   -- id do fabricante Dell
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Tablet Android',
    'Tablet com a versão 16 do sistema operacional Android, possui tela de 10 polegadas e armazenamento de 128 GB. Estou sem ideias do que escrever aqui.',
    900,
    12,
    5   -- Samsung
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Geladeira',
    'Refrigerador frost-free com acesso à Internet',
    5000,
    12,
    6 -- Brastemp
), 
(
    'iPhone 18 Pro Max Ferradão',
    'Smartphone Apple cheio das frescuras e caro pra caramba... coisa de rico...',
    9666.66,
    3,
    3 -- Apple
), 
(
    'iPad Mini',
    'Tablet Apple com tela retina display e bla bla bla e mó bunitinha',
    4999.12,
    5,
    3 -- Apple
);
```

---

## Comandos do exercício 03

```sql
INSERT INTO fabricantes(nome) VALUES('Microsoft'), ('Positivo');

INSERT INTO produtos(nome, preco, quantidade, fabricante_id, descricao) 
VALUES('Xbox Series S', 1997, 5, 7, 'Velocidade e desempenho de última geração.');

INSERT INTO produtos(nome, quantidade, preco, fabricante_id, descricao) 
VALUES(
    'Notebook Motion', 
    8, 
    1213.65, 
    8, 
    'Intel Dual Core 4GB de RAM, 128GB SSD e Tela 14,1 polegadas.'
);
```

---

## SELECT (Produtos)

```sql
-- Lendo TODAS as colunas de TODOS os registros
SELECT * FROM produtos;

-- Lendo somente nome e preco de todos os registros
SELECT nome, preco FROM produtos;
SELECT preco, nome FROM produtos;

-- Mostrar nome, preco e quantidade SOMENTE dos produtos que custam abaixo de 5000
SELECT nome, preco, quantidade FROM produtos
WHERE preco < 5000;

-- Mini-exercício: mostre o nome e descrição somente dos produtos da Apple
SELECT nome, descricao FROM produtos
WHERE fabricante_id = 3;
```

### Operadores Lógicos: E, OU e NÃO

#### E (AND)

```sql
-- Exibir nome e preco dos produtos que custam entre 2000 e 6000
SELECT nome, preco FROM produtos
WHERE preco >= 2000 AND preco <= 6000;
```

#### OU (OR)

```sql
-- Mini-exercício: exibir nome, descricao dos produtos da Apple e da Samsung
SELECT nome, descricao FROM produtos
WHERE fabricante_id = 3 OR fabricante_id = 5;

-- Versão usando a função SQL IN()
SELECT nome, descricao FROM produtos
WHERE fabricante_id IN(3, 5);
```

#### NÃO (NOT)

```sql
-- Nome, descrição e preço de todos os produtos EXCETO da Positivo
SELECT nome, descricao, preco FROM produtos
WHERE NOT fabricante_id = 8;

-- Versão usando operador relacional de "diferença/diferente"
SELECT nome, descricao, preco FROM produtos
WHERE fabricante_id != 8;
```

---

## UPDATE (Fabricantes e Produtos)

**☠️ PRERIGO! 🚨**

**SEMPRE USE** a cláusula `WHERE` em seu comando `UPDATE` especificando uma ou mais condições para a atualização.

```sql
-- Trocar o nome do fabricante Asus para Asus do Brasil
UPDATE fabricantes SET nome = 'Asus do Brasil'
WHERE id = 1;

-- Mini-exercício: alterar a quantidade para 10 dos produtos que custam abaixo de 2000, exceto da Microsoft.
UPDATE produtos SET quantidade = 10
-- WHERE preco < 2000 AND NOT fabricante_id = 7;
WHERE preco < 2000 AND fabricante_id != 7;
```

---

## DELETE (Fabricantes e Produtos)

**☠️ PRERIGO! 🚨**

**SEMPRE USE** a cláusula `WHERE` em seu comando `DELETE` especificando uma ou mais condições para a atualização.

```sql
DELETE FROM fabricantes WHERE id = 4;
DELETE FROM fabricantes WHERE id = 1;
DELETE FROM produtos WHERE id = 4;
DELETE FROM fabricantes WHERE id = 3;
```

---

## SELECT: outras formas de uso

### Classificação/Ordenação

```sql
-- DESC: ordena em ordem decrescente
-- ASC: ordena em ordem crescente (padrão)
SELECT nome, preco FROM produtos ORDER BY nome;
SELECT nome, preco FROM produtos ORDER BY preco;
SELECT nome, preco FROM produtos ORDER BY preco DESC;

SELECT nome, preco, quantidade FROM produtos
WHERE fabricante_id = 5 ORDER BY quantidade;
```

### Operações e funções de agregação

```sql
-- Função de SOMA (SUM)
SELECT SUM(preco) FROM produtos;

-- alias/apelido pra colunas
SELECT SUM(preco) AS Total FROM produtos;
SELECT SUM(preco) AS "Total dos Preços dos Produtos" FROM produtos; 
SELECT nome AS Produto, preco as Preço FROM produtos;
SELECT nome Produto, preco Preço FROM produtos; -- omitindo o AS

-- Funções de formatação/configuração: FORMAT e REPLACE
SELECT FORMAT(SUM(preco), 2) AS Total FROM produtos;
SELECT REPLACE(FORMAT(SUM(preco), 2), ",", ".") AS Total FROM produtos;

-- Função de média: AVG (Average) 
-- Função de arredondamento: ROUND
SELECT AVG(preco) AS "Média dos Preços" FROM produtos;
SELECT ROUND(AVG(preco), 2) AS "Média dos Preços" FROM produtos;

-- Função de contagem: COUNT
SELECT COUNT(id) AS "Qtd de Produtos" FROM produtos;
SELECT COUNT(DISTINCT fabricante_id) AS "Qtd de Fabricantes com Produtos" FROM produtos;

-- Operações matemáticas
SELECT nome, preco, quantidade, (preco * quantidade) as Total
FROM produtos;
```