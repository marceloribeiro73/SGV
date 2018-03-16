<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tipo_atividade.aspx.cs" Inherits="WebApplication5.tipo_atividade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SGV - Tipo de Atividades</title>

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

            <!-- Navigation -->
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
                            <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                            </li>
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
                                                <a href="tipo_atividade.aspx">Tipo de Atividade</a>
                                            </li>
                                            <li>
                                                <a href="Home.aspx">Tipo de Evento</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="notifications.html">Logs da Aplicação</a>
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
                                <a href="#"><i class="fa fa-clock-o fa-fw"></i>Ponto / Declaração de Horas</a>
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
                            <h1 class="page-header">Tipos de Atividades</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Tipo de Atividades
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group col-lg-12">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th><input type="checkbox" /></th>
                                                            <th>Tipo de Atividade</th>
                                                            <th>Data Cadastro</th>
                                                            <th>Estado</th>
                                                            <th>Data Inativado</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="odd gradeX">
                                                            <th><input type="checkbox"></th>
                                                            <td>Interna</td>
                                                            <td>01/02/2018</td>
                                                            <td class="center">Ativo</td>
                                                            <td class="center">00/00/00</td>
                                                        </tr>
                                                        <tr class="odd gradeX">
                                                            <th><input type="checkbox"></th>
                                                            <td>Externa</td>
                                                            <td>01/02/2018</td>
                                                            <td class="center">Ativo</td>
                                                            <td class="center">00/00/00</td>
                                                        </tr>
                                                        <tr class="odd gradeX">
                                                            <th><input type="checkbox"></th>
                                                            <td>Teste</td>
                                                            <td>01/02/2018</td>
                                                            <td class="center">Inativo</td>
                                                            <td class="center">25/02/2018</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="form-group col-lg-12">
                                                <asp:Button ID="btn_tp_Atividade_incluir" CssClass="btn btn-outline btn-primary" Text="Incluir" runat="server" OnClick="btn_tp_Atividade_incluir_Click" />
                                                <asp:Button CssClass="btn btn-outline btn-primary" Text="Alterar" runat="server" />
                                                <asp:Button CssClass="btn btn-outline btn-primary" Text="Inativar" runat="server" />
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <asp:Label ID="lbn_tp_Atvidade" runat="server" Font-Bold="true" Text="Tipo Atividade" Visible="true"></asp:Label>
                                                <asp:TextBox ID="txt_tp_Atividade" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <asp:Label ID="lbn_descricao_atividade" runat="server" Font-Bold="true" Text="Descrição" Visible="true"></asp:Label>
                                                <asp:TextBox ID="txt_descricao_atividade" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-12">
                                                <asp:Button ID="btn_salvar_cad_tp_Atividade" CssClass="btn btn-outline btn-success" Text="Salvar" Enabled="false" runat="server" />
                                                <asp:Button ID="btn_cancelar_cad_tp_Atividade" CssClass="btn btn-outline btn-danger"  Text="Cancelar" Enabled="false" runat="server" OnClick="btn_cancelar_cad_tp_Atividade_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
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
