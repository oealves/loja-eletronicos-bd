-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS loja_eletronicos;
USE loja_eletronicos;

-- 1. Tabela Clientes
CREATE TABLE clientes (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE,
    endereco VARCHAR(200)
);

-- 2. Tabela Categorias de Produtos
CREATE TABLE categorias_produtos (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(200)
); 

-- 3. Tabela Produtos
CREATE TABLE produtos (
    id_produto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao VARCHAR(200),
    preco DECIMAL(10,2) NOT NULL, 
    estoque INT NOT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    CONSTRAINT chk_produtos_preco CHECK (preco >= 0),
    CONSTRAINT chk_produtos_estoque CHECK (estoque >= 0),
    CONSTRAINT fk_produtos_categorias
        FOREIGN KEY (id_categoria) REFERENCES categorias_produtos(id_categoria) ON DELETE RESTRICT
);

-- 4. Tabela Pedidos
CREATE TABLE pedidos (
    id_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    total_pedido DECIMAL(10,2) UNSIGNED NOT NULL, 
    status ENUM('PENDENTE', 'PAGO', 'CANCELADO', 'ENVIADO') NOT NULL,
    id_cliente INT UNSIGNED NOT NULL,
    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE RESTRICT
);

-- 5. Tabela Itens dos Pedidos
CREATE TABLE itens_pedidos (
    id_item INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL, 
    preco_unitario DECIMAL(10,2) UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    id_produto INT UNSIGNED NOT NULL,
    CONSTRAINT chk_itens_pedidos_quantidade CHECK (quantidade > 0),
    CONSTRAINT fk_itens_pedidos_pedidos
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE RESTRICT,
    CONSTRAINT fk_itens_pedidos_produtos
        FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE RESTRICT
);
