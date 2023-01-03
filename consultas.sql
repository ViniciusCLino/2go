-- a) A lista de funcionários ordenado pelo nome do departamento e pelo nome:

SELECT * 
FROM funcionario AS f
INNER JOIN departamento AS d ON f.departamento_id = d.id
ORDER BY d.nome, f.nome;


-- b) O número de funcionários em cada departamento:

SELECT d.nome, COUNT(1) AS quantidade_funcionarios
FROM funcionario AS f
INNER JOIN departamento AS d ON f.departamento_id = d.id
GROUP BY d.nome;


-- c) A lista de departamentos, com o nome do projeto mais recente (maior prazo final) de cada um:

SELECT 
	d.nome,
	(
		SELECT nome FROM projeto WHERE departamento_id = d.id ORDER BY prazo_final DESC LIMIT 1
	) AS projeto	 
FROM departamento AS d
