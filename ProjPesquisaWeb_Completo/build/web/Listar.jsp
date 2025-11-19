<%-- 
    Document   : Listar
    Created on : 13 de nov. de 2025, 10:24:02
    Author     : alunocmc
--%>

<%@page import="util.ConectaBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Cadastrada</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body class="w3-light-grey w3-padding-large">
        <div class="w3-container w3-white w3-padding-32 w3-card w3-round-large" style="max-width:900px; margin:auto;"
           <h1 class="w3-center w3-text-teal">Listar Pesquisa</h1>
           <table class="w3-table w3-striped w3-bordered w3-hoverable w3-white">
               <thead>
                   <tr class="w3-teal">
                       <th>nome</th><!-- comment -->
                       <th>email</th><!-- comment -->
                       <th>r1</th><!-- comment -->
                       <th>r2</th>
                       <th>r3</th>
                       <th>r4</th>
                   </tr>
               </thead>  
               <tbody>
                   <%
                     try{  
                       PreparedStatement sql;
                       ResultSet lista;
                       Connection conexao;
                       conexao=ConectaBD.conectar();
                       sql=conexao.prepareStatement("select * from pesquisa");
                       lista=sql.executeQuery();
                       
                       while (lista.next()){
                       
                          String nome=lista.getString("nome");
                          String email=lista.getString("email");
                          int resp1=lista.getInt("p1");
                          int resp2=lista.getInt("p2");
                          int resp3=lista.getInt("p3");
                          int resp4=lista.getInt("p4");
                       
                       %>
                       <tr>
                           <td><%= nome %></td>
                           <td><%= email %></td>
                           <td><%= resp1 %></td>
                           <td><%= resp2 %></td>
                           <td><%= resp3 %></td>
                           <td><%= resp4 %></td>
                           <td> <a href="editarcliente.jsp?nome=<%= nome %>" class="w3-button w3-blue w3-small w3-round">Editar</a></td>
                           <td> <a href="excluircliente.jsp?nome=<%= nome %>" class="w3-button w3-red w3-small w3-round">Excluir</a></td>
                       </tr>
                       <% 
                           }// fecha o while
                           } catch (Exception e){
                               out.println("<tr><td colspan='6'>Erro: "+ e.getMessage()+ "</td></tr>");
                           }

                       %>
    
               </tbody>
    </body>
</html>
