<?php

$parametro = isset($_POST['parametro'])?$_POST['parametro']:'';
$accao = isset($_POST['accao'])?$_POST['accao']:'';

$conexao = new PDO('mysql:host=localhost;dbname=sisgnew', 'root', '',array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")); 


if ($accao == 'Buscar Provincias') {

	$saida = null;
	$buscarProvincias = $conexao->prepare("SELECT cod_provincia,designacao_provincia FROM tb_provincia WHERE cod_pais=:cod_pais ORDER BY designacao_provincia");
	$buscarProvincias->bindValue(':cod_pais', $parametro);
	$buscarProvincias->execute();
$saida="<option value=''>Selecione uma opcao</option>";
	while ($dados = $buscarProvincias->fetch(PDO::FETCH_ASSOC)) {

		extract($dados);
		
		$saida.="<option value='".$cod_provincia."'>".$designacao_provincia." </option>";
	}

	echo json_encode($saida);
}
else if ($accao == 'Buscar Municipios') {

	$saida = null;
	$buscarMunicipio = $conexao->prepare("SELECT cod_municipio,designacao_municipio FROM tb_municipio WHERE cod_provincia=:cod_provincia ORDER BY designacao_municipio");
	$buscarMunicipio->bindValue(':cod_provincia', $parametro);
	$buscarMunicipio->execute();
$saida="<option value=''>Selecione uma opcao</option>";
	while ($dados = $buscarMunicipio->fetch(PDO::FETCH_ASSOC)) {

		extract($dados);
		
		$saida.="<option value='".$cod_municipio."'>".$designacao_municipio." </option>";
	}

	echo json_encode($saida);
}


else if ($accao == 'Buscar Patentes') {

	$saida = null;
	$buscarPatente = $conexao->prepare("SELECT * FROM tb_patente");
	$buscarPatente->execute();
	
	$saida="<option value=''>Selecione uma opcao</option>";

	while ($dados = $buscarPatente->fetch(PDO::FETCH_ASSOC)) {

		extract($dados);
		if($parametro == 4){
			$saida.="<option value='".$Cod_Patente."'>".$Patente_EMGA." </option>";
		}else{
			$saida.="<option value='".$Cod_Patente."'>".$Patente." </option>";
		}
	}

	echo json_encode($saida);
}


else if ($accao == 'Buscar Regiao') {

	$saida = null;
	$buscarRegiao = $conexao->prepare("SELECT cod_regiao,designacao_regiao FROM tb_regiao WHERE cod_ramo=:cod_ramo ORDER BY designacao_regiao");
	$buscarRegiao->bindValue(':cod_ramo', $parametro);
	$buscarRegiao->execute();
	
	$saida="<option value=''>Selecione uma opcao</option>";

	while ($dados = $buscarRegiao->fetch(PDO::FETCH_ASSOC)) {

		extract($dados);
		
		$saida.="<option value='".$cod_regiao."'>".$designacao_regiao." </option>";
	}

	echo json_encode($saida);
}


else if ($accao == 'Buscar Unidade') {

	$saida = null;
	$buscarUnidade = $conexao->prepare("SELECT Cod_Unidade,Designacao_Unidade FROM tb_u_e_o WHERE Cod_Ramo=:Cod_Ramo ORDER BY Designacao_Unidade");
	$buscarUnidade->bindValue(':Cod_Ramo', $parametro);
	$buscarUnidade->execute();
$saida="<option value=''>Selecione uma opcao</option>";
	while ($dados = $buscarUnidade->fetch(PDO::FETCH_ASSOC)) {

		extract($dados);
		
		$saida.="<option value='".$Cod_Unidade."'>".$Designacao_Unidade." </option>";
	}

	echo json_encode($saida);
}else if($accao == 'Buscar dados Militar'){
	$listaMilitares = $conexao->prepare("SELECT 

	tb_militar.NIP,
	tb_militar.Cod_Patente,
	tb_militar.Cod_Unidade,
	tb_militar.Cod_Pessoa,
	tb_militar.Cod_Militar,
	tb_militar.Cod_Asec,	
	tb_pessoa.Nome,
	tb_pessoa.Cod_Sexo,
	tb_pessoa.Data_Nascimento,
	tb_pessoa.Apelido,	
	tb_u_e_o.Cod_Ramo	
	
	FROM 

	tb_militar

	INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa
	INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
	

	WHERE tb_militar.NIP = :nip

	");
	$listaMilitares->bindValue(":nip",$parametro);
	$listaMilitares->execute();


	$listaM=array();

	

	while ($dados=$listaMilitares->fetch(PDO::FETCH_ASSOC)) {


		extract($dados);

		
		if ($Cod_Asec==0 || $Cod_Asec=='') {
			$asec='';
		}else{

			$asec=$Cod_Asec;
		}

		if ($Cod_Patente==0 || $Cod_Patente=='') {
			$Patente='';
		}else{

			$Patente=$Cod_Patente;
		}

		if ($Cod_Sexo==0 || $Cod_Sexo=='') {
			$Sexo='';
		}else{

			$Sexo=$Cod_Sexo;
		}


		if ($Cod_Unidade==0 || $Cod_Unidade=='') {
			$Unidade='';
		}else{

			$Unidade=$Cod_Unidade;
		}

		$militar =array(

			"nip" => $NIP,
			"cod_Militar"=>$Cod_Militar,
			"cod_Patente" => $Patente,
			"cod_Unidade" => $Unidade,
			"cod_Pessoa" => $Cod_Pessoa,
			
			"nome" => $Nome,
			"cod_Sexo" => $Sexo,
			"data_Nascimento" => $Data_Nascimento,
			"apelido" => $Apelido,
			"designacao_disponibilidade" => $designacao_disponibilidade,
			"cod_Ramo" => $Cod_Ramo
		);

		array_push($listaM,$militar);
		

	}


echo json_encode($listaM);
}
else{
	$listaMilitares = $conexao->prepare("SELECT 

	tb_militar.NIP,
	tb_pessoa.Nome,
	tb_pessoa.Apelido

	FROM 

	tb_militar

	INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa
	
	

	");
	
	$listaMilitares->execute();


	$listaM=array();

	

	while ($dados=$listaMilitares->fetch(PDO::FETCH_ASSOC)) {


		extract($dados);

		$militar =array("name" => $NIP." - ".$Nome." ".$Apelido);

		array_push($listaM,$militar);
		

	}


echo json_encode($listaM);
}
