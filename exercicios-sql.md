# Exercícios de SQL

## Criar banco

```sql
CREATE DATABASE catalogo_de_filmes CHARACTER SET utf8mb4;
```

## Criar tabelas: Gêneros, Filmes e Detalhes

```sql
CREATE TABLE generos(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);
```