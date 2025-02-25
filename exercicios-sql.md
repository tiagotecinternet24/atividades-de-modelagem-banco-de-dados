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

```sql
CREATE TABLE filmes(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    lancamento DATE NOT NULL,
    genero_id INT NOT NULL -- será uma FK (chave estrangeira)
);
```