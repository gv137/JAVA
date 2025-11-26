<%@page import="util.ConectaBD, model.PesquisaBean, java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String method = request.getMethod();

if ("GET".equalsIgnoreCase(method)) {
    String idStr = request.getParameter("id");
    if (idStr == null) {
        out.println("ID não informado. <a href='Listar.jsp'>Voltar</a>");
        return;
    }
    int id = Integer.parseInt(idStr);
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = ConectaBD.conectar();
        ps = con.prepareStatement("SELECT id,nome,email,p1,p2,p3,p4 FROM pesquisa WHERE id=?");
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
            String nome = rs.getString("nome");
            String email = rs.getString("email");
            int p1 = rs.getInt("p1");
            int p2 = rs.getInt("p2");
            int p3 = rs.getInt("p3");
            int p4 = rs.getInt("p4");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Registro</title>

<style>

    body {
        font-family: "Segoe UI", sans-serif;
        background: #f4f7fa;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .card {
        background: white;
        padding: 30px;
        border-radius: 14px;
        width: 420px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        animation: fadeIn .3s ease;
    }

    h1 {
        font-size: 22px;
        margin-bottom: 20px;
        text-align: center;
        color: #333;
    }

    label {
        font-weight: 600;
        color: #444;
        margin-bottom: 6px;
        display: block;
    }

    input, select {
        width: 100%;
        padding: 10px;
        margin-bottom: 18px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 15px;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #0066ff;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        color: white;
        cursor: pointer;
        transition: 0.2s;
        font-weight: 600;
    }

    button:hover {
        background: #004ecc;
    }

    .back {
        display: block;
        text-align: center;
        margin-top: 15px;
        text-decoration: none;
        color: #0066ff;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(10px);}
        to {opacity: 1; transform: translateY(0);}
    }

</style>
</head>

<body>

<div class="card">
    <h1>Editar Registro • ID <%= id %></h1>

    <form method="post" action="editarcliente.jsp">

        <input type="hidden" name="id" value="<%= id %>">

        <label>Nome</label>
        <input type="text" name="nome" value="<%= nome %>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%= email %>" required>

        <label>Atendimento</label>
        <select name="r1">
            <% for (int i=1; i<=5; i++) { %>
                <option value="<%= i %>" <%= (p1==i?"selected":"") %>><%= i %></option>
            <% } %>
        </select>

        <label>Pontualidade</label>
        <select name="r2">
            <% for (int i=1; i<=5; i++) { %>
                <option value="<%= i %>" <%= (p2==i?"selected":"") %>><%= i %></option>
            <% } %>
        </select>

        <label>Espera</label>
        <select name="r3">
            <% for (int i=1; i<=5; i++) { %>
                <option value="<%= i %>" <%= (p3==i?"selected":"") %>><%= i %></option>
            <% } %>
        </select>

        <label>Recomendaria?</label>
        <select name="r4">
            <% for (int i=1; i<=5; i++) { %>
                <option value="<%= i %>" <%= (p4==i?"selected":"") %>><%= i %></option>
            <% } %>
        </select>

        <button type="submit">Salvar Alterações</button>
    </form>

    <a class="back" href="Listar.jsp">← Voltar</a>
</div>

</body>
</html>

<%
        } else {
            out.println("Registro não encontrado. <a href='Listar.jsp'>Voltar</a>");
        }
    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
    } finally {
        try { if (rs!=null) rs.close(); } catch(Exception ex){}
        try { if (ps!=null) ps.close(); } catch(Exception ex){}
        try { if (con!=null) con.close(); } catch(Exception ex){}
    }

} else {
    // POST – atualização
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        int r1 = Integer.parseInt(request.getParameter("r1"));
        int r2 = Integer.parseInt(request.getParameter("r2"));
        int r3 = Integer.parseInt(request.getParameter("r3"));
        int r4 = Integer.parseInt(request.getParameter("r4"));

        Connection con = ConectaBD.conectar();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE pesquisa SET nome=?, email=?, p1=?, p2=?, p3=?, p4=? WHERE id=?"
        );

        ps.setString(1, nome);
        ps.setString(2, email);
        ps.setInt(3, r1);
        ps.setInt(4, r2);
        ps.setInt(5, r3);
        ps.setInt(6, r4);
        ps.setInt(7, id);

        int n = ps.executeUpdate();
        ps.close();
        con.close();

        if (n > 0) response.sendRedirect("Listar.jsp");
        else out.println("Erro ao atualizar. <a href='Listar.jsp'>Voltar</a>");

    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
    }
}
%>
