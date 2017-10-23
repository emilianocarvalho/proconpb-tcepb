<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<link rel="icon" type="image/png" href="<c:url value='/images/logo.png'/>" />
        <title>Gestão Administrativa - Procon PB</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/semantic.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/reset.css'/>" />	
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/site.css'/>" />

        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/container.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/grid.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/header.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/image.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/menu.css'/>" />

        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/form.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/input.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/button.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/list.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/message.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/icon.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/table.css'/>"/>    
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/divider.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/segment.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/semantic/dist/components/dropdown.css'/>" />

        <script src="<c:url value='/assets/lib/jquery.min.js'/>"></script>
        <script src="<c:url value='/assets/lib/jquery.inputmask.bundle.min.js'/>""></script>
        <script src="<c:url value='/semantic/dist/semantic.min.js'/>"></script>
        <script src="<c:url value='/semantic/dist/components/visibility.js'/>"></script>
        <script src="<c:url value='/semantic/dist/components/visibility.js'/>"></script>
        <script src="<c:url value='/semantic/dist/components/sidebar.js'/>"></script>
        <script src="<c:url value='/semantic/dist/components/transition.js'/>"></script>
        <script src="<c:url value='/semantic/dist/components/form.js'/>"></script>
		<script>
			$('.message .close').on('click', function() {
				$(this).closest('.message').transition('fade');
			});
		</script>

        <style type="text/css">
            body {
                background-color: #e3e0cc;
            }
            .ui.menu .item img.logo {
                margin-right: 1.5em;
            }
            .main.container {
                margin-top: 7em;
            }
            .wireframe {
                margin-top: 2em;
            }
            .ui.footer.segment {
                margin: 5em 0em 0em;
                padding: 5em 0em;
            }
        </style>
    </head>
    <body>

        <div class="ui fixed menu">
            <div class="ui container">
                <a href="${linkTo[IndexController].index()}" class="header item">
                    <img class="logo" src="<c:url value='/images/logo.png'/>"/>
                    Procon PB
                </a>
                <a class="item" href="${linkTo[IndexController].index()}">Home</a> 
                <a class="item" href="${linkTo[UsuarioController].lista()}">Usuarios</a>  
                <a class="item" href="${linkTo[ServidorController].lista()}">Servidores</a>  
                <c:if test="${usuarioLogado.logado}"> 
                    <a class="item" href="${linkTo[LoginController].logout()}">Logout</a>
                </c:if>
                <c:if test="${!usuarioLogado.logado}"> 
                    <a class="item" href="${linkTo[LoginController].login()}">Login</a>
                </c:if>
            </div>
        </div>
