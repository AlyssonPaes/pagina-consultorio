<%@page language="java" import="java.sql.*" %>

<%
    // Criando as variaveis e armazenando as informações digitadas na hora do cadastro
    String vnome = request.getParameter("txtNome");
    int vCPF = interger.parseInt (request.getParameter("txtCPF"));
    int vidade = interger.parseInt (request.getParameter("txtIdade"));
    String vemail = request.getParameter("txtEmail");

    // variaveis para o banco de dados
    String banco = "cadastro" ;
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario = "root" ;
    String senha = "" ;
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregando o driver na memoria
    Class.forName(driver);

    //Variavel que conecta com o banco
    Connection conexao ;
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Insere dados no banco
    String sql = "INSERT INTO clientes (NOME,IDADE,EMAIL) values(?,?,?)" ; 
    PreparedStatement stm = conexao.preparedstatement(sql) ;
    stm.setString(1, vnome) ;
    stm.setInt(2, vidade) ;
    stm.setString(3, vemail) ;

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!") ; 
    out.print("<a href='cadastro.html'>Voltar para cadastro</a>");
%>