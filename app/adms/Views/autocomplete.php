<?php



$conexao = new PDO('mysql:host=localhost;dbname=sisgnew', 'root', ''); 

$listaMilitares = $conexao->prepare("SELECT 

	tb_militar.NIP,
	tb_militar.Cod_Patente,
	tb_militar.Cod_Unidade,
	tb_militar.Cod_Pessoa,
	tb_disponibilidade.designacao_disponibilidade,
	tb_patente.Patente,
	tb_pessoa.Nome,
	tb_pessoa.Cod_Sexo,
	tb_pessoa.Data_Nascimento,
	tb_pessoa.Apelido,
	tb_sexo.Designacao_Sexo,
	tb_u_e_o.Designacao_Unidade,
	tb_u_e_o.Cod_Ramo,
	tb_ramo.Designacao_Ramo
	
	FROM 

	tb_militar

	INNER JOIN tb_pessoa ON tb_militar.Cod_Patente=tb_pessoa.Cod_Pessoa
	INNER JOIN tb_sexo ON tb_pessoa.Cod_Sexo=tb_sexo.Cod_Sexo
	INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
	
	INNER JOIN tb_u_e_o ON tb_militar.Cod_Patente=tb_u_e_o.Cod_Unidade
	INNER JOIN tb_ramo ON tb_u_e_o.Cod_Ramo=tb_ramo.Cod_Ramo
	INNER JOIN tb_disponibilidade ON tb_militar.disponibilidade=tb_disponibilidade.id_disponibilidade

	");
	
	$listaMilitares->execute();


	$listaM=array();

	while ($dados=$listaMilitares->fetch(PDO::FETCH_ASSOC)) {


		extract($dados);

		array_push($listaM, array("nip" => $NIP,
		"cod_Patente" => $Cod_Patente,
		"cod_Unidade" => $Cod_Unidade,
		"cod_Pessoa" => $Cod_Pessoa,
		
		"patente" => utf8_encode($Patente),
		"nome" => utf8_encode($Nome),
		"cod_Sexo" => $Cod_Sexo,
		"data_Nascimento" => $Data_Nascimento,
		"apelido" => utf8_encode($Apelido),
		"designacao_Sexo" => utf8_encode($Designacao_Sexo),
		"designacao_Unidade" => utf8_encode($Designacao_Unidade),
		"cod_Ramo" => $Cod_Ramo,
		"designacao_Ramo" => utf8_encode($Designacao_Ramo),
		"designacao_disponibilidade" => utf8_encode($designacao_disponibilidade)));
		

	}


echo json_encode($listaM);

?>