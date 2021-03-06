﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="WebApplication5.usuarios" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SGV - Usuarios</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />

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
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="Index.aspx"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="voluntarios.aspx"><i class="fa fa-male fa-fw"></i> Voluntarios</a>
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
                            <h1 class="page-header">Usuarios</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Usuarios
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group col-lg-6">
                                                <label>Usuario</label>
                                                <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" />
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label>Inativo</label>
                                                <asp:CheckBox ID="chkInativo" runat="server" />
                                            </div>
                                            <div class="form-group col-lg-12">
                                                <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary btn-outline" runat="server" OnClick="btnBuscar_Click"/>
                                                <asp:Button ID="btnLimpar" Text="Limpar" CssClass="btn btn-primary btn-outline" runat="server"/>
                                            </div>
                                            <div class="form-group col-lg-12 table-bordered">
                                                <asp:GridView ID="tblusuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="CODIGO" DataSourceID="dataUsuarios" CssClass="table table-condensed tatable-responsive" Width="100%">
                                                    <Columns>
                                                        <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" ReadOnly="True" InsertVisible="False" SortExpression="CODIGO" Visible="False"></asp:BoundField>
                                                        <asp:BoundField DataField="VOLUNTARIO" HeaderText="VOLUNTARIO" SortExpression="VOLUNTARIO"></asp:BoundField>
                                                        <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" SortExpression="USUARIO"></asp:BoundField>
                                                        <asp:BoundField DataField="SEGREDO" HeaderText="SEGREDO" SortExpression="SEGREDO" Visible="False"></asp:BoundField>
                                                        <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO"></asp:BoundField>
                                                        <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS"></asp:BoundField>
                                                        <asp:BoundField DataField="DATA DE CRIA&#199;&#195;O" HeaderText="DATA DE CRIA&#199;&#195;O" SortExpression="DATA DE CRIA&#199;&#195;O"></asp:BoundField>
                                                        <asp:BoundField DataField="DATA DE INATIVA&#199;&#195;O" HeaderText="DATA DE INATIVA&#199;&#195;O" SortExpression="DATA DE INATIVA&#199;&#195;O"></asp:BoundField>
                                                        <asp:BoundField DataField="FALHAS LOGIN" HeaderText="FALHAS LOGIN" SortExpression="FALHAS LOGIN"></asp:BoundField>
                                                        <asp:BoundField DataField="DATA DE BLOQUEIO" HeaderText="DATA DE BLOQUEIO" SortExpression="DATA DE BLOQUEIO"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                                <!-- /.table-responsive -->
                                                <asp:SqlDataSource runat="server" ID="dataUsuarios" ConnectionString='<%$ ConnectionStrings:SGV_DEVConnectionString2 %>' SelectCommand="SELECT U.COD_USUARIO AS 'CODIGO', V.PRIMEIRO_NOME +' '+ V.ULTIMO_NOME AS 'VOLUNTARIO', U.LOGIN_NAME AS 'USUARIO', U.PASSWD AS 'SEGREDO', TU.NOME_TIPO_USUARIO AS 'TIPO', U.STATUS AS 'STATUS', U.DATA_CRIACAO AS 'DATA DE CRIAÇÃO', U.DATA_INATIVACAO AS 'DATA DE INATIVAÇÃO', U.QTD_FALHAS_LOGIN AS 'FALHAS LOGIN', U.DATA_BLOQUEIO AS 'DATA DE BLOQUEIO' FROM USUARIO U, TIPO_USUARIO TU, VOLUNTARIO V WHERE U.STATUS <> 'I' AND U.TIPO_USUARIO = TU.COD_TIPO_USUARIO AND V.CPF = U.VOLUNTARIO"></asp:SqlDataSource>
                                            </div>
                                            <div class="form-group col-lg-12">
                                                <asp:Button Text="Incluir" CssClass="btn btn-primary btn-outline" runat="server"/>
                                                <asp:Button Text="Alterar" CssClass="btn btn-primary btn-outline" runat="server"/>
                                                <asp:Button Text="Inativar" CssClass="btn btn-primary btn-outline" runat="server"/>
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

        <!-- DataTables JavaScript -->
        <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

            <!-- Page-Level Demo Scripts - Tables - Use for reference -->
            <script>
                $(document).ready(function () {
                    $("#tblusuarios").prepend($("<thead></thead>").append($("#tblusuarios").find("tr:first"))).dataTable({
                        responsive: true
                    });
                   
                });

            </script>
  
        
    </form>
</body>
</html>
