<%@page language="java" import="java.sql.*" %>

<%
    // cria as variaveis e armazena as informações digitadas pelo usuario
    String vnome  = request.getParameter("txtNome");
    int    vidade = Integer.parseInt( request.getParameter("txtIdade") );
    int    vCPF = Integer.parseInt( request.getParameter("txtCPF") );
    String vemail = request.getParameter("txtEmail");

    // variaveis para o banco de dados
    String banco    = "cadastro";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;

    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando de Inserir
    String sql = "INSERT INTO clientes (nome,idade,CPF,email) values(?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setInt(2, vidade);
    stm.setInt(3, vCPF);
    stm.setString(4, vemail);

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>");
    out.print("<a href='cadastro.html'>Voltar</a>");
%>