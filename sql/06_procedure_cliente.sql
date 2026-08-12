
-- Ajuste do delimitador para criação do procedimento
DELIMITER //

CREATE PROCEDURE buscar_pedidos_cliente(IN p_id_cliente INT)
BEGIN
    SELECT 
        pe.id_pedido,
        pe.data_pedido,
        pe.total_pedido,
        pe.status
    FROM pedidos pe
    WHERE pe.id_cliente = p_id_cliente;
END //

DELIMITER ;

-- Exemplo de execução da procedure para o cliente de ID 1
CALL buscar_pedidos_cliente(1);
