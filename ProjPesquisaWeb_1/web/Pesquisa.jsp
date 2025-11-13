<%-- 
    Document   : Pesquisa
    Created on : 6 de nov. de 2025, 09:54:23
    Author     : alunocmc
--%>

<%@page import="DAO.PesquisaDAO"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="model.PesquisaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Dados do Formulario</h1>
        <%
            // buscando os dados do formulário
           String nome=request.getParameter("nome");
           String email=request.getParameter("email");
           int r1=Integer.parseInt(request.getParameter("r1"));
           int r2=Integer.parseInt(request.getParameter("r2"));
           int r3=Integer.parseInt(request.getParameter("r3"));
           int r4=Integer.parseInt(request.getParameter("r4"));
           // criando a instância da classe modelo
           PesquisaBean pesq = new PesquisaBean();
           // encapsulando
           pesq.setNome(nome);
           pesq.setEmail(email);
           pesq.setR1(r1);
           pesq.setR2(r2);
           pesq.setR3(r3);
           pesq.setR4(r4);
           PesquisaDAO pesquisa = new PesquisaDAO();
           if (pesquisa.InserirDAO(pesq)==true){
               JOptionPane.showMessageDialog(null,"Dados Inseridos com sucesso !!!");
            }
            else{
               JOptionPane.showMessageDialog(null,"Erro no Cadastro !!!");
            }
            
           %>
           
    </body>
</html>
