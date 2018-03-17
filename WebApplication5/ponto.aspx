<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ponto.aspx.cs" Inherits="WebApplication5.ponto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SGV - Ponto</title>

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
                                                <a href="Home.aspx">Tipo de Atividade</a>
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
                            <h1 class="page-header">Ponto</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Ponto
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="col-lg-12 form-group">
                                                <label>Utimas declarações</label>
                                                <table class="table table-striped table-bordered table-hover table-responsive" id="tbl_marcacoes">
                                                    <thead>
                                                        <tr>
                                                            <th><asp:Label ID="lbl_title_data_marcacao" CssClass="form-group" Text="Data Marcação" runat="server" ></asp:Label></th>
                                                            <th><asp:Label ID="lbl_title_qtd_horas" CssClass="form-group" Text="Quantidade de Horas" runat="server"></asp:Label></th>
                                                            <th><asp:Label ID="lbl_title_qtd_atividade" CssClass="form-group" Text="Atividade" runat="server"></asp:Label></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th>19/03/2018</th>
                                                            <th>2:30</th>
                                                            <th>Asembleia Geral - Março</th>
                                                        </tr>
                                                        <tr>
                                                            <th>18/03/2018</th>
                                                            <th>4:00</th>
                                                            <th>Entrega de Kits - Athur Alvin</th>
                                                        </tr>
                                                        <tr>
                                                            <th>17/03/2018</th>
                                                            <th>3:20</th>
                                                            <th>Entrega de Refeições - Largo São Francisco/SP</th>
                                                        </tr>
                                                        <tr>
                                                            <th>3/03/2018</th>
                                                            <th>5:20</th>
                                                            <th>Entrega de Refeições - Praça Julio Prestes/SP</th>
                                                        </tr>
                                                        <tr>
                                                            <th>04/03/2018</th>
                                                            <th>2:50</th>
                                                            <th>Entrega de Cestas Basicas - A.E. Carvalho/SP</th>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-lg-12 form-group">
                                                <label>Atividades</label>
                                                <table class="table table-striped table-bordered table-hover table-responsive" id="tbl_atividade">
                                                    <thead>
                                                        <tr>
                                                            <th><asp:CheckBox ID="CheckBox1" runat="server"/></th>
                                                            <th><asp:Label ID="Label1" CssClass="form-group" Text="Atividade" runat="server" ></asp:Label></th>
                                                            <th><asp:Label ID="Label2" CssClass="form-group" Text="Data" runat="server"></asp:Label></th>
                                                            <th><asp:Label ID="Label3" CssClass="form-group" Text="Horas Registradas" runat="server"></asp:Label></th>
                                                            <th><asp:Label ID="Label4" CssClass="form-group" Text="Status" runat="server"></asp:Label></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th><asp:CheckBox ID="CheckBox2" runat="server"/></th>
                                                            <th>Entrega de Refeições - Praça da Reoublica/SP</th>
                                                            <th>24/03/2018</th>
                                                            <th>0:00</th>
                                                            <th>Pendente de Aceitação</th>
                                                        </tr>
                                                        <tr>
                                                            <th><asp:CheckBox ID="CheckBox3" runat="server"/></th>
                                                            <th>Entrega de Refeições - Região da Luz/SP</th>
                                                            <th>24/03/2018</th>
                                                            <th>0:00</th>
                                                            <th>Recusada</th>
                                                        </tr>
                                                        <tr>
                                                            <th><asp:CheckBox ID="CheckBox4" runat="server"/></th>
                                                            <th>Asembleia Geral - Março</th>
                                                            <th>19/03/2018</th>
                                                            <th>2:30</th>
                                                            <th>Aceita</th>
                                                        </tr>
                                                        <tr>
                                                            <th><asp:CheckBox ID="CheckBox5" runat="server"/></th>
                                                            <th>Entrega de Kits - Athur Alvin</th>
                                                            <th>18/03/2018</th>
                                                            <th>4:00</th>
                                                            <th>Aceita</th>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="form-group">
                                                <label>Horas restantes na semana: </label>
                                                <asp:Label ID="lbl_horas_rest_semana" CssClass="form-group" runat="server" Text="2:02"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btn_declarar_horas" CssClass="btn btn-outline btn-primary" runat="server" Text="Declarar Horas" />
                                                <asp:Button ID="btn_aceitar_atividade" CssClass="btn btn-outline btn-success" runat="server" Text="Aceitar Atividade" />
                                                <asp:Button ID="btn_recusar_atividade" CssClass="btn btn-outline btn-danger" runat="server" Text="Recusar Atividade"/>
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
