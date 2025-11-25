<%@page import="DAO.InserirDAO"%>
<%@page import="model.PesquisaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado Cadastro - Sistema de Pesquisa</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-color: #2196F3;
            --success-color: #4CAF50;
            --error-color: #f44336;
            --warning-color: #ff9800;
            --dark-bg: #1a1a1a;
            --light-bg: #f5f5f5;
            --text-dark: #333333;
            --text-light: #666666;
            --border-color: #e0e0e0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px 20px;
            text-align: center;
            color: white;
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .header p {
            font-size: 14px;
            opacity: 0.9;
        }

        .content {
            padding: 40px 30px;
            text-align: center;
        }

        /* Sucesso */
        .success-container {
            animation: slideIn 0.5s ease-out;
        }

        .success-icon {
            width: 80px;
            height: 80px;
            background: var(--success-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            font-size: 40px;
            color: white;
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .success-title {
            color: var(--success-color);
            font-size: 22px;
            margin-bottom: 12px;
            font-weight: 600;
        }

        .success-message {
            color: var(--text-light);
            font-size: 14px;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        /* Erro */
        .error-container {
            animation: shake 0.5s ease-out;
        }

        .error-icon {
            width: 80px;
            height: 80px;
            background: var(--error-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            font-size: 40px;
            color: white;
            box-shadow: 0 5px 15px rgba(244, 67, 54, 0.3);
        }

        .error-title {
            color: var(--error-color);
            font-size: 22px;
            margin-bottom: 12px;
            font-weight: 600;
        }

        .error-message {
            color: var(--text-light);
            font-size: 14px;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .error-detail {
            background: #ffebee;
            border-left: 4px solid var(--error-color);
            padding: 12px;
            border-radius: 4px;
            font-size: 12px;
            color: #c62828;
            margin-bottom: 20px;
            text-align: left;
            font-family: 'Courier New', monospace;
            word-break: break-word;
        }

        /* Aviso */
        .warning-icon {
            width: 80px;
            height: 80px;
            background: var(--warning-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            font-size: 40px;
            color: white;
            box-shadow: 0 5px 15px rgba(255, 152, 0, 0.3);
        }

        .warning-title {
            color: var(--warning-color);
            font-size: 22px;
            margin-bottom: 12px;
            font-weight: 600;
        }

        .warning-message {
            color: var(--text-light);
            font-size: 14px;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        /* Dados Inseridos */
        .data-summary {
            background: var(--light-bg);
            padding: 20px;
            border-radius: 8px;
            text-align: left;
            margin-bottom: 25px;
        }

        .data-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .data-item:last-child {
            border-bottom: none;
        }

        .data-label {
            font-weight: 600;
            color: var(--text-dark);
            font-size: 13px;
        }

        .data-value {
            color: var(--text-light);
            font-size: 13px;
            word-break: break-word;
            text-align: right;
            max-width: 50%;
        }

        /* Botões */
        .button-group {
            display: flex;
            gap: 12px;
            margin-top: 30px;
        }

        .btn {
            flex: 1;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            text-align: center;
        }

        .btn-primary {
            background: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background: #1976D2;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(33, 150, 243, 0.3);
        }

        .btn-secondary {
            background: var(--light-bg);
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
        }

        .btn-secondary:hover {
            background: var(--primary-color);
            color: white;
        }

        .btn-success {
            background: var(--success-color);
            color: white;
        }

        .btn-success:hover {
            background: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .btn-warning {
            background: var(--warning-color);
            color: white;
        }

        .btn-warning:hover {
            background: #e68900;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 152, 0, 0.3);
        }

        .single-btn {
            width: 100%;
        }

        /* Animações */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }

        /* Responsivo */
        @media (max-width: 600px) {
            .container {
                border-radius: 8px;
            }

            .header {
                padding: 30px 20px;
            }

            .header h1 {
                font-size: 24px;
            }

            .content {
                padding: 30px 20px;
            }

            .button-group {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }

            .data-summary {
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            request.setCharacterEncoding("UTF-8");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");

            try {
                int r1 = Integer.parseInt(request.getParameter("r1"));
                int r2 = Integer.parseInt(request.getParameter("r2"));
                int r3 = Integer.parseInt(request.getParameter("r3"));
                int r4 = Integer.parseInt(request.getParameter("r4"));

                if (nome == null || nome.trim().isEmpty() || email == null || email.trim().isEmpty()) {
        %>
                    <div class="header">
                        <h1>Atenção!</h1>
                        <p>Validação de Formulário</p>
                    </div>
                    <div class="content warning-container">
                        <div class="warning-icon">⚠️</div>
                        <div class="warning-title">Campos Obrigatórios</div>
                        <div class="warning-message">
                            Os campos "Nome" e "Email" são obrigatórios. Por favor, preencha-os corretamente.
                        </div>
                        <div class="button-group">
                            <a href="Cadastro.html" class="btn btn-warning single-btn">← Voltar ao Formulário</a>
                        </div>
                    </div>
        <%
                } else {
                    PesquisaBean pesq = new PesquisaBean();
                    pesq.setNome(nome);
                    pesq.setEmail(email);
                    pesq.setR1(r1);
                    pesq.setR2(r2);
                    pesq.setR3(r3);
                    pesq.setR4(r4);

                    InserirDAO dao = new InserirDAO();
                    boolean ok = dao.Inserir(pesq);
                    if (ok) {
        %>
                        <div class="header">
                            <h1>Sucesso!</h1>
                            <p>Dados Cadastrados com Êxito</p>
                        </div>
                        <div class="content success-container">
                            <div class="success-icon">✓</div>
                            <div class="success-title">Cadastro Realizado!</div>
                            <div class="success-message">
                                Seus dados foram inseridos com sucesso em nosso sistema.
                            </div>
                            
                            <div class="data-summary">
                                <div class="data-item">
                                    <span class="data-label">Nome:</span>
                                    <span class="data-value"><%= nome %></span>
                                </div>
                                <div class="data-item">
                                    <span class="data-label">Email:</span>
                                    <span class="data-value"><%= email %></span>
                                </div>
                                <div class="data-item">
                                    <span class="data-label">Pergunta 1:</span>
                                    <span class="data-value"><%= r1 %>/5</span>
                                </div>
                                <div class="data-item">
                                    <span class="data-label">Pergunta 2:</span>
                                    <span class="data-value"><%= r2 %>/5</span>
                                </div>
                                <div class="data-item">
                                    <span class="data-label">Pergunta 3:</span>
                                    <span class="data-value"><%= r3 %>/5</span>
                                </div>
                                <div class="data-item">
                                    <span class="data-label">Pergunta 4:</span>
                                    <span class="data-value"><%= r4 %>/5</span>
                                </div>
                            </div>

                            <div class="button-group">
                                <a href="index.html" class="btn btn-primary">🏠 Home</a>
                                <a href="Listar.jsp" class="btn btn-success">📋 Ver Registros</a>
                            </div>
                        </div>
        <%
                    } else {
        %>
                        <div class="header">
                            <h1>Erro!</h1>
                            <p>Falha no Cadastro</p>
                        </div>
                        <div class="content error-container">
                            <div class="error-icon">✕</div>
                            <div class="error-title">Erro ao Inserir Dados</div>
                            <div class="error-message">
                                Houve um problema ao tentar salvar seus dados no banco de dados.
                            </div>
                            <div class="error-detail">
                                Verifique o log do servidor para mais detalhes sobre o erro.
                            </div>
                            <div class="button-group">
                                <a href="Cadastro.html" class="btn btn-warning single-btn">🔄 Tentar Novamente</a>
                            </div>
                        </div>
        <%
                    }
                }
            } catch (Exception e) {
        %>
                <div class="header">
                    <h1>Erro!</h1>
                    <p>Erro de Validação</p>
                </div>
                <div class="content error-container">
                    <div class="error-icon">⚠️</div>
                    <div class="error-title">Dados Inválidos</div>
                    <div class="error-message">
                        Verifique se todas as respostas foram preenchidas com valores de 1 a 5.
                    </div>
                    <div class="error-detail">
                        Detalhes do erro: <%= e.getMessage() %>
                    </div>
                    <div class="button-group">
                        <a href="Cadastro.html" class="btn btn-warning single-btn">← Voltar ao Formulário</a>
                    </div>
                </div>
        <%
            }
        %>
    </div>
</body>
</html>