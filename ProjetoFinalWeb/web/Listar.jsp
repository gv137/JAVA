<%@page import="util.ConectaBD"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listar Pesquisas</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body class="w3-light-grey w3-padding-large">
        <div class="w3-container w3-white w3-padding-32 w3-card w3-round-large" style="max-width:900px; margin:auto;">
           <h1 class="w3-center w3-text-teal">Listar Pesquisa</h1>
           <table class="w3-table w3-striped w3-bordered w3-hoverable w3-white">
               <thead>
                   <tr class="w3-teal">
                       <th>ID</th>
                       <th>Nome</th>
                       <th>Email</th>
                       <th>p1</th>
                       <th>p2</th>
                       <th>p3</th>
                       <th>p4</th>
                       <th>Ações</th>
                   </tr>
               </thead>  
               <tbody>
<%
    Connection conexao = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        conexao = ConectaBD.conectar();
        ps = conexao.prepareStatement("SELECT id, nome, email, p1, p2, p3, p4, data_envio FROM pesquisa ORDER BY data_envio DESC");
        rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String nome = rs.getString("nome");
            String email = rs.getString("email");
            int resp1 = rs.getInt("p1");
            int resp2 = rs.getInt("p2");
            int resp3 = rs.getInt("p3");
            int resp4 = rs.getInt("p4");
%>
                   <tr>
                       <td><%= id %></td>
                       <td><%= nome %></td>
                       <td><%= email %></td>
                       <td><%= resp1 %></td>
                       <td><%= resp2 %></td>
                       <td><%= resp3 %></td>
                       <td><%= resp4 %></td>
                       <td>
                          <a href="editarcliente.jsp?id=<%= id %>" class="w3-button w3-blue w3-small w3-round">Editar</a>
                          <a href="excluircliente.jsp?id=<%= id %>" class="w3-button w3-red w3-small w3-round">Excluir</a>
                       </td>
                   </tr>
<%
        }
    } catch (Exception e) {
%>
                <tr><td colspan="8">Erro: <%= e.getMessage() %></td></tr>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ex) {}
        try { if (ps != null) ps.close(); } catch (Exception ex) {}
        try { if (conexao != null) conexao.close(); } catch (Exception ex) {}
    }
%>
               </tbody>
           </table>
        </div>
    </body>
</html>
