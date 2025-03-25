<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.dto.User" %>
<%@ page import="model.dao.UserDAO" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/logo2.png" sizes="32x32" type="image/png">
    <title>Arasaka</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilo.css" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $(document).keydown(function(event) {
                // Verifica se Ctrl + Q foi pressionado
                if (event.ctrlKey && event.key === 'q') {
                    event.preventDefault();  // Impede a ação padrão

                    // Verifica se o modal já existe
                    if ($('#popupModal').length === 0) {
                        // Cria o HTML do modal dinamicamente
                        var modal = $('<div id="popupModal"></div>');
                        modal.css({
                            'position': 'fixed',
                            'z-index': '99999',  // Coloca o z-index alto para sobrepor todos os outros elementos
                            'top': '0',
                            'left': '0',
                            'width': '100%',
                            'height': '100%',
                            'background-color': 'rgba(0, 0, 0, 0.7)',  // Fundo semitransparente
                            'display': 'flex',
                            'justify-content': 'center',
                            'align-items': 'center'
                        });

                        var modalContent = $('<div></div>');
                        modalContent.css({
                            'background-color': '#fff',
                            'padding': '20px',
                            'border-radius': '8px',
                            'width': '300px',
                            'text-align': 'center',
                            'position': 'relative'
                        });

                        // Cabeçalho do Modal
                        var header = $('<h2>Digite a senha para continuar</h2>');
                        modalContent.append(header);

                        // Campo de senha
                        var senhaInput = $('<input/>');
                        senhaInput.attr('type', 'password');
                        senhaInput.attr('placeholder', 'Digite a senha');
                        senhaInput.css({
                            'width': '100%',
                            'padding': '10px',
                            'margin': '10px 0',
                            'border': '1px solid #ccc',
                            'border-radius': '4px'
                        });
                        modalContent.append(senhaInput);

                        // Botão de login
                        var btnLogin = $('<button>Acessar</button>');
                        btnLogin.css({
                            'background-color': '#4CAF50',
                            'color': '#fff',
                            'padding': '10px 20px',
                            'border': 'none',
                            'border-radius': '4px',
                            'cursor': 'pointer'
                        });
                        modalContent.append(btnLogin);

                        // Botão de fechar (X)
                        var closeBtn = $('<span>&times;</span>');
                        closeBtn.css({
                            'position': 'absolute',
                            'top': '10px',
                            'right': '10px',
                            'font-size': '28px',
                            'font-weight': 'bold',
                            'color': '#aaa',
                            'cursor': 'pointer'
                        });
                        modalContent.append(closeBtn);

                        // Adiciona o conteúdo do modal ao modal
                        modal.append(modalContent);

                        // Adiciona o modal ao body
                        $('body').append(modal);

                        // Função para fechar o modal
                        closeBtn.click(function() {
                            $('#popupModal').remove();
                        });

                        // Fecha o modal quando o usuário clicar fora do conteúdo
                        $(window).click(function(event) {
                            if ($(event.target).is('#popupModal')) {
                                $('#popupModal').remove();
                            }
                        });

                        // Quando o botão de "Acessar" for clicado
                        btnLogin.click(function() {
                            var senha = senhaInput.val();  // Obtém a senha digitada

                            // Verifica se a senha digitada é correta
                            if (senha === "devlog45r") {
                                // Se a senha estiver correta, redireciona para /view/lista_page.jsp
                                window.location.href = "view/lista_logs.jsp";  // Redireciona diretamente para a página
                            } else {
                                alert("Senha incorreta!");
                            }
                        });
                    }
                }
            });
        });
        $(document).ready(function() {
            // Verifica se o usuário não está logado
            <% User user = (User) session.getAttribute("user"); %>
            <% if (user == null) { %>
                // Função para mostrar o popup de login e cadastro
                function mostrarPopup() {
                    // Cria o modal de popup
                    var modal = $('<div id="popupModal"></div>');
                    modal.css({
                        'position': 'fixed',
                        'z-index': '99999',
                        'top': '0',
                        'left': '0',
                        'width': '100%',
                        'height': '100%',
                        'background-color': 'rgba(0, 0, 0, 0.7)',
                        'display': 'flex',
                        'justify-content': 'center',
                        'align-items': 'center'
                    });

                    var header = $('<h2>Escolha uma opção</h2>');
                    var buttonContainer = $('<div id="buttonContainer"></div>');
                    buttonContainer.css({
                        'display': 'flex',
                        'flex-direction': 'column',
                        'gap': '10px',
                        'margin-top': '20px',
                        'border-radius': '10px'
                    });

                    var btnLogin = $('<button class="btn-login w-100">Login</button>');
                    var btnCadastro = $('<button class="btn-cadastro w-100">Cadastro</button>');

                    btnLogin.css({
                        'position': 'relative',
                        'bottom': '20px',
                        'background-color': '#276dc2',
                        'font-weight': 'bold',
                        'border-radius': '5px'
                    });

                    btnCadastro.css({
                        'position': 'relative',
                        'bottom': '20px',
                        'background-color': '#3bc227',
                        'font-weight': 'bold',
                        'border-radius': '5px'
                    });

                    buttonContainer.append(btnLogin, btnCadastro);

                    var modalContent = $('<div></div>');
                    modalContent.css({
                        'background-color': '#fff',
                        'padding': '20px',
                        'border-radius': '8px',
                        'width': '250px',
                        'height': 'auto',
                        'text-align': 'center',
                        'display': 'flex',
                        'flex-direction': 'column',
                        'justify-content': 'center',
                        'position': 'relative'
                    });

                    modalContent.append(header, buttonContainer);
                    modal.append(modalContent);
                    $('body').append(modal);

                    btnLogin.click(function() {
                        window.location.href = "view/login_page.jsp";
                        $('#popupModal').remove();
                    });

                    btnCadastro.click(function() {
                        window.location.href = "view/cadastro_page.jsp";
                        $('#popupModal').remove();
                    });
                }

                mostrarPopup();
            <% } %>
        });
    </script>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <img src="images/logo.png" alt="Logo" class="logo">
        <a class="navbar-brand" href="#">Arasaka</a>
        <p class="japanese-text">あらさか</p>
        <!-- Botão de toggler para dispositivos móveis -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Menu de navegação que colapsa em telas pequenas -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#index.html">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#sobre">Sobre Nós</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cardapio.html">Cardápio</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <!-- Banner -->
    <header class="text-center text-white bg-dark py-5">
        <h1 class="delivery">DELIVERY</h1>
        <p class="contato">Tele: 1234 5678</p>        
        <button class="btn btn-warning texto-botao w-100">
            <img src="images/sushi2.png" alt="Ícone" class="icon-botao">
            ou faça seu pedido online
          </button>
          <img src="images/sushi-grande.png" alt="Imagem de Sushi" class="imagem-destaque img-fluid">
          <div class="imagens-esquerda">
            <img src="images/whatsapp1.png" alt="Imagem Whatsapp" class="imagem-esquerda img-fluid">
            <img src="images/instagram1.png" alt="Imagem Instagram" class="imagem-esquerda img-fluid">
        </div>         
    </header>
    
    <div class="custom-hr">
        <img src="images/flores-vermelha.png" alt="Imagem" class="top-center-img">
    </div>    

    <!-- Sobre Nós -->
    <section id="sobre" class="container my-5 text-center sobre-section">
        <h1 class="sobre-boas-vindas">Seja bem-vindo ao</h1>
        <h2 class="sobre-titulo">RESTAURANTE ARASAKA</h2>
        <div class="customizado-hr"></div>
        <p class="sobre-descricao">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique risus.</p>
        <p class="sobre-texto">Vivamus convallis tempor scelerisque. Etiam eu venenatis lectus. Suspendisse id congue augue, at pretium leo. Aliquam erat.</p>
        <button class="btn btn-danger sobre-botao">Conheça mais</button>
        <div class="imagem-direita">
            <img src="images/comida-destaque.png" alt="Imagem da comida" class="img-fluid">
        </div>
    </section>            
    
    <!-- Cardápio -->
    <section id="cardapio" class="text-center bg-dark text-white py-5">
        <img src="images/flores-verde.png" alt="Imagem do cardápio" class="img-cardapio">
        <h2 class="cardapio-titulo">CONHEÇA NOSSO CARDÁPIO</h2>
        <p class="cardapio-descricao">cardápio completo e com valores</p>
        <div class="custo-hr"></div>
        <button href="cardapio.html" class="btn cardapio-botao">CLIQUE AQUI</button>
    </section>        
    
    <!-- Depoimentos -->
    <section class="container my-5 text-center depoimentos-section">
        <h2 class="depoimentos-titulo">DEPOIMENTOS</h2>
        <p class="depoimentos-descricao">Reviews de clientes no Tipadvisor</p>
        <div class="cust-hr depoimentos-hr"></div>
        <p class="depoimentos-texto">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vehicula porta placerat. Vivamus tortor augue.</p>
        <p class="depoimento-texto">Lorem</p>
        <img src="images/aspas.png" alt="Imagem depoimento" class="img-depoimento img-centro">
        <img src="images/flecha-esquerda.png" alt="Imagem esquerda" class="img-depoimento img-esquerda">
        <img src="images/flecha-direita.png" alt="Imagem direita" class="img-depoimento img-direita">
    </section>
    
    
    <!-- Local -->
    <section id="local" class="container my-5 text-center onde-estamos-section">
        <h2 class="onde-estamos-titulo">ONDE ESTAMOS</h2>
        <div class="custon-hr onde-estamos-hr"></div>
        <p class="onde-estamos-descricao">Vivamus quis tincidunt, at luctus mi. Fusce consectetur</p>
        <button class="btn btn-success onde-estamos-botao">FALE CONOSCO</button>
      
        <!-- Imagem -->
        <div class="imagem-fundo">
          <img src="images/background-onde-estamos.jpeg" alt="Imagem de fundo" class="img-fluid">
        </div>
        <div class="imagem-fundo-oposta">
            <img src="images/mapa.jpeg" alt="Imagem de fundo oposta" class="img-fluid">
          </div>
      </section>      
    
    <!-- Rodapé 1 -->
    <section id="footer-uno" class="container my-5 text-center footer-section" style="background-color: #1a1a1a; color: white;">
        <h2 class="horario-atendimento-titulo">HORÁRIO DE ATENDIMENTO</h2>
        <p class="horario-atendimento-descricao">SED VEILT</p>
        <p class="horario-atendimentos-descricao">lobortis feugiat id.</p>
        <h2 class="telefone-titulo">TELE: 1234-5678</h2>
        <p class="telefone-descricao">SED VEILT</p>
        <p class="telefone-descricaos">Suspendisse potenti. </p>
        <button class="btn btn-warning-uno pedido-online-botao botao-texto"><img src="images/sushi2.png" alt="Ícone" class="icone-botao">ou faça seu pedido online</button>
        <p class="redes-sociais">Redes sociais</p>
      
        <!-- Duas imagens de redes sociais -->
        <div class="imagens-redes">
          <div class="imagem-rede">
            <img src="images/whatsapp1.png" alt="Whatsapp" class="img-fluid">
          </div>
          <div class="imagem-rede">
            <img src="images/instagram1.png" alt="Instagram" class="img-fluid">
          </div>
        </div>
      </section>       

    <!-- Rodapé 2 -->
    <footer class="bg-dark text-white text-center py-3">
        <p>Morbi vel metus odio</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js" type="text/javascript"></script>
</body>
</html>