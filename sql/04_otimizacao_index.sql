-- Criação de índice para busca eficiente de pedidos 
CREATE INDEX idx_pedido_data ON PEDIDOS(data_pedido);
-- CONSULTA ÍNDICE 
SELECT *
FROM PEDIDOS
WHERE data_pedido = '2026-07-10';
