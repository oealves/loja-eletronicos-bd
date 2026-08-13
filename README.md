# 🪛 Modelagem e Implementação de Banco de Dados: Loja de Eletrônicos

Este repositório contém a documentação técnica, o modelo conceitual, a modelagem lógica e os scripts SQL completos de um banco de dados relacional para uma **Loja de Eletrônicos / E-commerce**, desenvolvido utilizando **brModelo** e **MySQL / MariaDB**.

---

## 📌 1. Visão Geral do Projeto

O objetivo deste projeto é estruturar do zero a base de dados relacional de um e-commerce. A modelagem visa garantir a integridade dos dados, eliminar redundâncias por meio das regras de normalização e aplicar **regras de negócio diretamente na camada do banco de dados**.

---

## 🛠️ 2. Tecnologias & Ferramentas Utilizadas

* **Modelagem Conceitual e Lógica:** brModelo
* **Linguagem:** SQL (DDL, DML, DQL)
* **SGBD:** MySQL / MariaDB
* **Controle de Versão:** Git & GitHub

---

## ⚙️ 3. Regras de Negócio & Integridade de Dados

1. **Garantia de Valores Positivos (`UNSIGNED`):**
   * Chaves primárias, estrangeiras e colunas de valor financeiro (`total_pedido` e `preco_unitario`) utilizam o tipo `UNSIGNED` para impedir valores negativos no nível do banco.

2. **Validação de Preço e Quantidade (`CHECK`):**
   * Preço e estoque dos produtos não podem ser negativos (`preco >= 0`, `estoque >= 0`).
   * A quantidade solicitada em um item do pedido deve ser estritamente maior que zero (`quantidade > 0`).

3. **Status Controlado (`ENUM`):**
   * O status de cada pedido é limitado a: `'PENDENTE'`, `'PAGO'`, `'CANCELADO'` ou `'ENVIADO'`.

4. **Obrigatoriedade e Unicidade (`NOT NULL` e `UNIQUE`):**
   * Nomes, e-mails e preços são obrigatórios.
   * O e-mail do cliente é único (`UNIQUE`), prevenindo registros duplicados.

5. **Integridade Referencial (`ON DELETE RESTRICT`):**
   * Impede a remoção acidental de registros pai (como clientes com pedidos ou categorias com produtos vinculados).

---

## 📐 4. Modelo Conceitual (Entidades e Atributos)

Conforme representado no diagrama conceitual do projeto, foram definidas as seguintes entidades e seus respectivos atributos:

* **Clientes:** `id_cliente`, `nome`, `email`, `telefone`, `data_cadastro`, `endereco`
* **Categorias de Produtos:** `id_categoria`, `nome_categoria`, `descricao`
* **Produtos:** `id_produto`, `nome_produto`, `descricao`, `preco`, `estoque`
* **Pedidos:** `id_pedido`, `data_pedido`, `total`, `status`
* **Itens do Pedido:** `id_item`, `quantidade`, `preco_unitario`

---

## 📐 5. Modelo Lógico Relacional

### 5.1. Esquema Relacional

* **CLIENTES** (**id_cliente**, nome, email, telefone, data_cadastro, endereco)
  * **PK:** `id_cliente`

* **CATEGORIAS_PRODUTOS** (**id_categoria**, nome_categoria, descricao)
  * **PK:** `id_categoria`

* **PRODUTOS** (**id_produto**, nome_produto, descricao, preco, estoque, *id_categoria*)
  * **PK:** `id_produto`
  * **FK:** `id_categoria` REFERENCES `CATEGORIAS_PRODUTOS(id_categoria)`

* **PEDIDOS** (**id_pedido**, data_pedido, total_pedido, status, *id_cliente*)
  * **PK:** `id_pedido`
  * **FK:** `id_cliente` REFERENCES `CLIENTES(id_cliente)`

* **ITENS_PEDIDOS** (**id_item**, quantidade, preco_unitario, *id_pedido*, *id_produto*)
  * **PK:** `id_item`
  * **FK:** `id_pedido` REFERENCES `PEDIDOS(id_pedido)`
  * **FK:** `id_produto` REFERENCES `PRODUTOS(id_produto)`

### 5.2. Mapeamento das Cardinalidades
* **CATEGORIAS_PRODUTOS — PRODUTOS:** `(1:N)` — Um para Muitos (Uma categoria pode ter vários produtos)
* **CLIENTES — PEDIDOS:** `(1:N)` — Um para Muitos (Um cliente pode fazer vários pedidos)
* **PEDIDOS — PRODUTOS:** `(N:M)` — Muitos para Muitos (Resolvido pela entidade associativa `ITENS_PEDIDOS`)
  
### 5.3. Diagrama Entidade-Relacionamento (DER)


---

## 💻 6. Scripts SQL & Execução

Os scripts executáveis do banco de dados foram modularizados na pasta [`/sql`](./sql) para facilitar a manutenção e execução individual:

* 📄 [`sql/01_ddl_estrutura.sql`](./sql/01_ddl_estrutura.sql) — Criação do banco de dados e definição das tabelas.
* 📄 [`sql/02_dml_popular_dados.sql`](./sql/02_dml_popular_dados.sql) — Inserção de dados fictícios para testes.
* 📄 [`sql/03_dql_consultas_join.sql`](./sql/03_dql_consultas_join.sql) — Consulta geral de vendas com `INNER JOIN`.
* 📄 [`sql/04_otimizacao_index.sql`](./sql/04_otimizacao_index.sql) — Criação do índice de otimização `idx_pedido_data`.
* 📄 [`sql/05_view_relatorio.sql`](./sql/05_view_relatorio.sql) — Visão analítica com agrupamentos e totais (`SUM` e `GROUP BY`).
* 📄 [`sql/06_procedure_cliente.sql`](./sql/06_procedure_cliente.sql) — Stored Procedure parametrizada para buscar pedidos por cliente.

---

## 📂 7. Estrutura do Repositório

```text
loja-eletronicos-bd/
├── sql/
│   ├── 01_ddl_estrutura.sql
│   ├── 02_dml_popular_dados.sql
│   ├── 03_dql_consultas_join.sql
│   ├── 04_otimizacao_index.sql
│   ├── 05_view_relatorio.sql
│   └── 06_procedure_cliente.sql
└── README.md
