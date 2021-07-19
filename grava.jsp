<%@page language="java" import="java.sql.*" %>

<%

	// cria as variaveis e obtem os dados digitados pelo usuario
	String vnome  = request.getParameter("nome");
	String vemail = request.getParameter("email");
	String vmensagem = request.getParameter("mensagem");

	// variaveis para acessar o banco de dados
	String banco   = "m1webs";
	String usuario = "root";
	String senha   = "";
	String url     = "jdbc:mysql://localhost:3306/" + banco;
	String driver  = "com.mysql.jdbc.Driver";

	// carrega o driver na memoria
	Class.forName( driver );

	// criar variavel para conectar com banco de dados
	Connection conexao ; 

	// abrir a conexao com o banco 
	conexao = DriverManager.getConnection( url , usuario , senha ) ;

	String sql = "insert into contato (nome,email,mensagem) values('" + vnome +"', '"+ vemail +"', '" + vmensagem + "')" ;

	// cria o statement 
	// ele é o responsável por executar o comando do SQL
	Statement stm = conexao.createStatement() ;

	// executa o comando do SQL
	stm.executeUpdate( sql ) ;

	stm.close() ;
	conexao.close() ;

	out.print("<br><br>") ;

%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,700;1,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <link href="./css/style.css" rel="stylesheet">
    <title>Contato | JV Materiais p/ construção</title>
</head>
<body>
    <header>
            <div class="logo">
              <img src="img/logo-jv.png" width="142">
            </div>  
            <nav>
            <input type="checkbox" id="check">
      <label for="check" class="checkbtn">
        <i class="fas fa-bars"></i>
      </label>
            
                <ul>
                  <li>
                    <a href="index.html">Home</a>
                  </li>
                  <li>
                    <a href="sobre.html">Sobre nós</a>
                  </li>
                  <li>
                    <a href="produtos.html">Produtos</a>
                  </li>
                  <li>
                    <a href="localizacao.html">Localização</a>
                  </li>
                  <li>
                    <a href="contato.html">Contato</a>
                  </li>
                </ul>
    
          </nav>
    </header>
    
    <div class="conteudo">
       <div class="banner"></div>

      <div class="container2">
        <p><b>Mande uma mensagem para gente!</b></p>
        <form name="form1" method="post" action="grava.jsp">
          <p style="font-size: 16px">Responderemos o mais rápido possível ;)</p><br>
          <p style="font-size: 16px"><b>Nome: </b></p><input type="text" name="nome" required><br><br>
          <p style="font-size: 16px"><b>Email: </b></p><input type="email" name="email" required><br><br>
          <p style="font-size: 16px"><b>Sua mensagem:</b> </p><textarea style="width:80%; height: 200px;" name="mensagem" required></textarea><br><br><br>
          <div class="botao"><input type="submit" name="Enviar" value="Enviar"></div>
          
        </form>

      </div>
     
    <footer>
      <p><b>JV Materiais para construção © | 2020 </b></p>
      <p>Projeto integrador WEBS | feito por: João Vitor, Lucas Meireles e Manuela Martins</p>
    </footer>


    
</body>
  
</html>