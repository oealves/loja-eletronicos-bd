USE loja_eletronicos;

-- Criação da VIEW analítica de vendas
CREATE VIEW vw_relatorio_vendas AS 
SELECT
    pr.nome_produto AS 'nome produto',
    cp.nome_categoria AS 'nome da categoria',
    pe.status AS 'status do pedido',
    pe.data_pedido AS 'data do pedido',
    SUM(ip.quantidade) AS 'total de itens',
    SUM(ip.quantidade * pr.preco) AS 'valor total'
FROM pedidos pe
INNER JOIN itens_pedidos ip ON pe.id_pedido = ip.id_pedido
INNER JOIN produtos pr ON ip.id_produto = pr.id_produto
INNER JOIN categorias_produtos cp ON pr.id_categoria = cp.id_categoria
GROUP BY pe.status, pe.data_pedido, pr.nome_produto, cp.nome_categoria;

-- Exemplo de consulta utilizando a VIEW criada
SELECT * FROM vw_relatorio_vendas
WHERE `status do pedido` = 'ENVIADO';
