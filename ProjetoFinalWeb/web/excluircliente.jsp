<%@page import="util.ConectaBD, java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String idStr = request.getParameter("id");
String confirm = request.getParameter("confirm");

if (idStr == null) {
    out.println("ID não informado. <a href='Listar.jsp'>Voltar</a>");
    return;
}

int id = Integer.parseInt(idStr);

if ("yes".equalsIgnoreCase(confirm)) {
    Connection con = null;
    PreparedStatement ps = null;
    try {
        con = ConectaBD.conectar();
        ps = con.prepareStatement("DELETE FROM pesquisa WHERE id = ?");
        ps.setInt(1, id);
        int n = ps.executeUpdate();
        response.sendRedirect("Listar.jsp");
        return;
    } catch (Exception e) {
        out.println("Erro ao excluir: " + e.getMessage());
    } finally {
        try { if (ps != null) ps.close(); } catch(Exception ex){}
        try { if (con != null) con.close(); } catch(Exception ex){}
    }
}
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Confirmar Exclusão</title>

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
        width: 420px;
        border-radius: 14px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.09);
        text-align: center;
        animation: fadeIn .3s ease;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
        font-size: 22px;
    }

    p {
        font-size: 16px;
        color: #555;
        margin-bottom: 25px;
    }

    .btns {
        display: flex;
        justify-content: space-between;
        gap: 12px;
    }

    .btn {
        flex: 1;
        padding: 12px;
        border-radius: 8px;
        text-decoration: none;
        color: white;
        font-weight: 600;
        font-size: 15px;
        transition: 0.2s;
        display: inline-block;
    }

    .confirm {
        background: #e84343;
    }

    .confirm:hover {
        background: #c72e2e;
    }

    .cancel {
        background: #777;
    }

    .cancel:hover {
        background: #555;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

</style>

</head>
<body>

<div class="card">
    <h2>Excluir Registro</h2>
    <p>Você tem certeza que deseja excluir o registro <strong>ID <%= id %></strong>?<br>
       Esta ação não poderá ser desfeita.</p>

    <div class="btns">
        <a class="btn confirm" href="excluircliente.jsp?id=<%= id %>&confirm=yes">Excluir</a>
        <a class="btn cancel" href="Listar.jsp">Cancelar</a>
    </div>
</div>

</body>
</html>
