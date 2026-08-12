-- Inserção de Tabelas 
-- Inserção 1. Tabela Clientes
INSERT INTO Clientes (nome, email,telefone,data_cadastro,endereco) VALUES
('Pedro Lima', 'pedro.lima@email.com', '(11) 99999-8888', '2000-05-20', 'Rua A 311, Mesquita - RJ'),
('Joao Gomes', 'joao.gomes@email.com', '(11) 99999-7777', '2002-07-17', 'Rua B 510, Belford Roxo - RJ'),
('Patrícia Santos ', 'patricia.santos@email.com', '(11) 99999-6666', '2004-01-29', 'Rua C 1455, Rio de Janeiro - RJ'),
('Filipe Correia ', 'filipe.correia@email.com', '(11) 99999-5555', '2001-12-12', 'Rua D 210, Rio de Janeiro - RJ'),
('Maria Alves ', 'maria.alves@email.com', '(11) 99999-4444', '2003-03-31', 'Rua E 550, Duque de Caxias - RJ'),
('Thiago Mendes ', 'thiago.mendes@email.com', '(11) 99999-3333', '2000-05-27', 'Rua F 3500, Niterói - RJ'),
('Paulo Diniz ', 'paulo.diniz@email.com', '(11) 99999-2222', '2001-07-17', 'Rua G 1500, Belford Roxo - RJ'),
('Carmem Araujo ', 'carmem.araujo@email.com', '(11) 99999-1111', '2002-09-01', 'Rua H 1400, Niterói - RJ'),
('Otavio Menezes ', 'otavio.menezes@email.com', '(11) 99999-0000', '2003-11-28', 'Rua I 1515, Duque de Caxias - RJ'),
('Jeniffer Cunha ', 'jeniffer.cunha@email.com', '(11) 99988-8899', '2004-10-05', 'Rua J 3000, Mesquita - RJ');




-- Inserção 2. Tabela Categorias de Produtos
INSERT INTO  categorias_produtos (nome_categoria, descricao) VALUES
('Informática', 'Notebooks, mouses, teclados, monitores e impressoras.'),
('Smartphones e Celulares', 'Celulares, smartwatches, capas e carregadores.'),
('Áudio e Vídeo', 'Fones de ouvido, caixas de som, microfones e TVs.');

-- Inserção 3. Tabela Produtos
INSERT INTO produtos(nome_produto, descricao, preco, estoque, id_categoria) VALUES
-- Categoria 1: Informática
('Notebook Lenovo IdeaPad', 'Notebook Ryzen 5 8GB RAM 256GB SSD Tela 15.6 Full HD', 2899.90, 15, 1),
('Mouse Gamer Redragon', 'Mouse óptico RGB 10000 DPI com 6 botões programáveis', 129.90, 45, 1),
('Teclado Mecânico Logitech', 'Teclado mecânico switch blue com iluminação LED', 349.00, 20, 1),
('Monitor LG 24 Polegadas', 'Monitor IPS Full HD 75Hz com ajuste de inclinação', 699.00, 10, 1),
-- Categoria 2: Smartphones e Celulares
('Smartphone Samsung Galaxy A54', 'Smartphone 128GB 8GB RAM Câmera Tripla Tela 6.4', 1799.00, 25, 2),
('Carregador Rápido USB-C 20W', 'Carregador de parede com tecnologia de carregamento rápido', 89.90, 60, 2),
('Smartwatch Amazfit Bip 3', 'Relógio inteligente com GPS, monitor cardíaco e 60 modos de treino', 299.90, 18, 2),
-- Categoria 3: Áudio e Vídeo
('Fone de Ouvido Bluetooth JBL', 'Fone de ouvido sem fio tune 510bt com até 40h de bateria', 239.90, 30, 3),
('Caixa de Som Bluetooth Anker', 'Caixa de som portátil à prova d água 12W de potência', 199.90, 12, 3),
('Smart TV LED 43 TCL 4K', 'TV 4K HDR com controle por comando de voz e Wi-Fi', 1699.00, 8, 3);

-- Inserção 4. Tabela Pedidos
INSERT INTO pedidos (data_pedido, total_pedido, status, id_cliente) VALUES
-- Cliente 1 comprou 1 Notebook Lenovo (R$ 2899.90)
('2026-07-01', 2899.90, 'PAGO', 1),
-- Cliente 2 comprou 1 Mouse Gamer (R$ 129.90)
('2026-07-02', 129.90, 'ENVIADO', 2),
-- Cliente 3 comprou Smartphone Galaxy A54 (R$ 1.799,00) + Smartwatch Amazfit (R$ 299.90)
('2026-07-05', 2098.90, 'PAGO', 3),
-- Cliente 4 cancelou compra do Carregador USB-C 20W (R$ 89.90)
('2026-07-10', 89.90, 'CANCELADO', 4),
-- Cliente 5 comprou 1 Smartphone Galaxy A54 (R$ 1.799,00)
('2026-07-12', 1799.00, 'PENDENTE', 5),
-- Cliente 6 comprou 1 Teclado Mecânico Logitech (R$ 349.00)
('2026-07-15', 349.00, 'ENVIADO', 6),
-- Cliente 7 comprou 1 Fone de Ouvido JBL (R$ 239.90)
('2026-07-18', 239.90, 'PAGO', 7),
-- Cliente 8 comprou 1 Smart TV 43 TCL (R$ 1699.00)
('2026-07-20', 1699.00, 'PENDENTE', 8),
-- Cliente 9 comprou Fone JBL (R$ 239.90) + Caixa de Som Anker (199.90)
('2026-07-22', 439.80, 'PAGO', 9),
-- Cliente 10 comprou 1 Monitor LG 24" (R$ 699.00)
('2026-07-24', 699.00, 'PENDENTE', 10);

-- Inserção 5. Tabela Itens dos Pedidos
INSERT INTO itens_pedidos(quantidade, preco_unitario, id_pedido, id_produto) VALUES
(1, 2899.90,1,1),  -- Pedido 1 (PAGO) 1x Notebook Lenovo (R$ 2899.90)
(1, 129.90,2,2),   -- Pedido 2 (ENVIADO) 1x Mouse Gamer (R$ 129.90)
(1,1799.00, 3,5),  -- Pedido 3 (PAGO) 1x Smartphone Galaxy A54 (R$ 1.799,00)
(1,299.90,3,7),    -- Pedido 3 (PAGO) 1x Smartwatch Amazfit (R$ 299.90)
(1,89.90,4,6),     -- Pedido 4 (CANCELADO): 1x Carregador USB-C 20W (R$ 89.90)
(1,1799.00,5,5),   -- Pedido 5 (PENDENTE): 1x Smartphone Galaxy A54 (R$ 1.799,00)
(1,349.00,6,3),    -- Pedido 6 (ENVIADO): 1x Teclado Mecânico Logitech (R$ 349.00)
(1,239.90,7,8),    -- Pedido 7 (PAGO): 1x Fone de Ouvido JBL (R$ 239.90)
(1,1699.00,8,10),  -- Pedido 8 (PENDENTE): 1x Smart TV 43 TCL (R$ 1699.00)
(1,239.90,9,8),    -- Pedido 9 (PAGO): 1x Fone JBL (R$ 239.90)
(1,199.90,9,9),    -- Pedido 9 (PAGO): 1x Caixa de Som Anker (R$ 199.90)
(1,699.00,10,4);   -- Pedido 10 (PENDENTE): 1x Monitor LG 24 (R$ 699.00)
