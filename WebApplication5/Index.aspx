<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication5.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SGV - Login</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
     <div class="container" runat="server">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">SGV - Sistema Gerenciador de Voluntarios</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <!--input class="form-control" placeholder="E-mail" name="email" type="email" autofocus-->
                                    <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" placeholder="Usuario"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <!--input class="form-control" placeholder="Password" name="password" type="password" value=""-->
                                    <asp:TextBox ID="txtSenha" CssClass="form-control" placeholder="Senha" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUserInvalido" CssClass="form-group" runat="server" Visible="false" Text="Usuario/Senha Invalido"></asp:Label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <!--a href="index.html" class="btn btn-lg btn-success btn-block">Login</!--a-->
                                <asp:Button ID="btnLogar" CssClass="btn btn-lg btn-success btn-block" OnClick="btnLogar_click" Text="Acessar" runat="server" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    </form>
</body>
</html>
