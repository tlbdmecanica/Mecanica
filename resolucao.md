<h3>Resolução das questões</h3>

<p> Questão 1 </p>

```sql
select produto.descricao, cliente.idcliente, produto.preco
from ordem_servico
inner join ordem_servico_has_produto
on ordem_servico_has_produto.ordem_servico_idordem_servico = ordem_servico.idordem_servico
inner join produto
on ordem_servico_has_produto.produto_idproduto = produto.idproduto
inner join carro
on ordem_servico.carro_idcarro = carro.idcarro
inner join cliente
on carro.cliente_idcliente = cliente.idcliente
where cliente.idcliente between 6 and 15;
```

<p> Questão 2 </p>

```sql
select funcionario.*, cliente.nome as nome_cliente, carro.idcarro, carro.placa
from funcionario
inner join ordem_servico
on ordem_servico.funcionario_idfuncionario = funcionario.idfuncionario
inner join carro
on carro.idcarro = ordem_servico.carro_idcarro
inner join cliente
on cliente.idcliente = carro.cliente_idcliente
where carro.placa = 'MTI-4432' 
or carro.placa = 'MTW-6579'
or carro.placa = 'KAR-2345';
```

<p> Questão 3 </p>

```sql
select count(carro.idcarro)
from funcionario
inner join ordem_servico
on ordem_servico.funcionario_idfuncionario = funcionario.idfuncionario
inner join carro
on ordem_servico.carro_idcarro = carro.idcarro
inner join cliente
on carro.cliente_idcliente = cliente.idcliente
where funcionario.idfuncionario = 9 
and data between '2008/02/20' and curdate();

select carro.idcarro, carro.placa, carro.marca, cliente.idcliente, cliente.nome
from funcionario
inner join ordem_servico
on ordem_servico.funcionario_idfuncionario = funcionario.idfuncionario
inner join carro
on ordem_servico.carro_idcarro = carro.idcarro
inner join cliente
on carro.cliente_idcliente = cliente.idcliente
where funcionario.idfuncionario = 9 
and data between '2008/02/20' and curdate();
```

<p> Questão 4 </p>

```sql
select count(ordem_servico_has_produto.produto_idproduto) as qtd_pecas_usadas
from ordem_servico_has_produto
inner join ordem_servico
on ordem_servico_has_produto.ordem_servico_idordem_servico = ordem_servico.idordem_servico
where data between '2013/01/01' and '2017/09/01';
```

<p> Questão 5 </p>

```sql
select (substring(ordem_servico.preco,2)*1.03) - substring(ordem_servico.preco,2) as prejuizo
from ordem_servico
```

<p> Questão 6 </p>

```sql
select cliente.nome, carro.idcarro, carro.placa,
(substring(ordem_servico.preco,2) * 0.85) as valor_com_desconto,
(substring(ordem_servico.preco,2) * 0.15) as desconto_recebido
from ordem_servico
inner join carro
on carro.idcarro = ordem_servico.carro_idcarro
inner join cliente
on cliente.idcliente = carro.cliente_idcliente
where ordem_servico.idordem_servico = 50;
```

<p> Questão 7 </p>

```sql
select funcionario.idfuncionario, funcionario.nome, funcionario.especializacao
from funcionario
inner join ordem_servico
on ordem_servico.funcionario_idfuncionario = funcionario.idfuncionario
where ordem_servico.data >= '2017-01-01'
group by funcionario.idfuncionario
order by sum(substring(ordem_servico.preco,2)) desc limit 1;
```

<p> Questão 8 </p>

```sql
update ordem_servico
set data = adddate(ordem_servico.data,1)
where ordem_servico.funcionario_idfuncionario = 7
and data = '2015/11/25';
```

