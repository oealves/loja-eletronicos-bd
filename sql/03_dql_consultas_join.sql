-- Consulta Geral de Vendas 
SELECT 
ce.nome AS 'nome do cliente', pr.nome_produto AS 'nome do produto',
pe.data_pedido  AS' data do pedido', ip.quantidade AS 'quantidade',
ip.preco_unitario AS' preco do produto', cp.nome_categoria AS 'nome da categoria'
FROM  CLIENTES ce
INNER JOIN PEDIDOS pe
ON pe.id_cliente = ce.id_cliente
INNER JOIN ITENS_PEDIDOS ip
 ON pe.id_pedido = ip.id_pedido
INNER JOIN produtos pr
    ON ip.id_produto = pr.id_produto
INNER JOIN categorias_produtos cp
    ON pr.id_categoria = cp.id_categoria;
