<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="voluntarios.aspx.cs" Inherits="WebApplication5.voluntarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SGV - Voluntarios</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


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
        <div id="wrapper">

            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Home.aspx">SGV</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li class="divider"></li>
                            <li><a href="Index.aspx"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="voluntarios.aspx"><i class="fa fa-male fa-fw"></i>Voluntarios</a>
                            </li>
                            <li>
                                <a href="atividades.aspx"><i class="fa fa-bar-chart-o fa-fw"></i>Atividades</a>
                            </li>
                            <li>
                                <a href="eventos.aspx"><i class="fa fa-table fa-fw"></i>Eventos</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-wrench fa-fw"></i>Administração do Sistema<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="usuarios.aspx"><i class="fa fa-user"></i>Usuarios</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-fw"></i>Parametrização Sistema<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="tipo_eventos.aspx">Tipo de Evento</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="logs.aspx">Logs da Aplicação</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-dashboard fa-fw"></i>Relatorios<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">Voluntarios por tipo</a>
                                    </li>
                                    <li>
                                        <a href="#">Tarefas por tipo</a>
                                    </li>
                                    <li>
                                        <a href="#">Eventos por tipo</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li class="active">
                                <a href="ponto.aspx"><i class="fa fa-clock-o fa-fw"></i>Ponto / Declaração de Horas</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>
            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Voluntários</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Buscar Voluntários
                                </div>
                                <!-- /.panel-heading -->
                                <!-- Buscar-->

                                <div class="panel-body">
                                    <div class="form-group col-lg-12">
                                        <asp:Button ID="btnIncluir" CssClass="btn btn-primary btn-outline" Text="Incluir Novo Voluntário" runat="server" OnClick="btnIncluir_Click" />
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label>CPF</label>
                                        <asp:TextBox ID="txtCPF" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label>Primeiro Nome</label>
                                        <asp:TextBox ID="txt1Nome" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <label>Ultimo Nome</label>
                                        <asp:TextBox ID="txt2Nome" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <asp:Button ID="btnBuscar" CssClass="btn btn-primary btn-outline" Text="Buscar" runat="server" OnClick="btnBuscar_Click" />
                                        <asp:Button ID="btnLimpar" CssClass="btn btn-primary btn-outline" Text="Limpar" runat="server" OnClick="btnLimpar_Click" />
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <asp:GridView ID="grwVoluntarios" CssClass="table table-bordered table-responsive" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="CPF" >
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CPF" SortExpression="CPF">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CPF") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CPF") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="PRIMEIRO NOME" HeaderText="PRIMEIRO NOME" SortExpression="PRIMEIRO NOME" />
                                                <asp:BoundField DataField="ULTIMO NOME" HeaderText="ULTIMO NOME" SortExpression="ULTIMO NOME" />
                                                <asp:BoundField DataField="DATA DE NASCIMENTO" HeaderText="DATA DE NASCIMENTO" SortExpression="DATA DE NASCIMENTO" />
                                                <asp:BoundField DataField="DATA DE ADESÃO" HeaderText="DATA DE ADESÃO" SortExpression="DATA DE ADESÃO" />
                                                <asp:BoundField DataField="TIPO VOLUNTARIO" HeaderText="TIPO VOLUNTARIO" SortExpression="TIPO VOLUNTARIO" />
                                                <asp:TemplateField HeaderText="STATUS" SortExpression="STATUS">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("STATUS") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>

                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString2 %>" SelectCommand="SELECT V.CPF AS 'CPF', V.PRIMEIRO_NOME AS 'PRIMEIRO NOME',V.UlTIMO_NOME AS 'ULTIMO NOME', V.DATA_NASC AS 'DATA DE NASCIMENTO',
V.DATA_ADESAO AS 'DATA DE ADESÃO', T.NOME_TIPO_VOLUNTARIO AS 'TIPO VOLUNTARIO', V.STATUS AS 'STATUS' 
FROM VOLUNTARIO V, TIPO_VOLUNTARIO T WHERE V.TIPO_VOLUNTARIO = T.COD_TIPO_VOLUNTARIO"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <asp:Button ID="btnAlterar" CssClass="btn btn-primary btn-outline" Text="Alterar" runat="server" OnClick="btnAlterar_Click" />
                                        <asp:Button ID="btnInativarAtivar" CssClass="btn btn-primary btn-outline" Text="Ativar/Inativar" runat="server" OnClick="btnInativarAtivar_Click" />
                                    </div>
                                </div>

                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

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

