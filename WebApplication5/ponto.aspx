﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ponto.aspx.cs" Inherits="WebApplication5.ponto" %>

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

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

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
                                                <label>Declarações Anteriores</label>
                                                <asp:GridView ID="GridView1" Width="100%" CssClass="table table-striped table-bordered table-hover" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
                                                    <Columns>
                                                        <asp:BoundField DataField="NOME_EVENTO" HeaderText="EVENTO" SortExpression="NOME_EVENTO"></asp:BoundField>
                                                        <asp:BoundField DataField="NOME_ATIVIDADE" HeaderText="ATIVIDADE" SortExpression="NOME_ATIVIDADE"></asp:BoundField>
                                                        <asp:BoundField DataField="DATA_DECLARADA" HeaderText="DATA DECLARADA" SortExpression="DATA_DECLARADA"></asp:BoundField>
                                                        <asp:BoundField DataField="QUANTIDADE_HORAS_DELCARADA" HeaderText="QUANTIDADE HORAS DELCARADA" SortExpression="QUANTIDADE_HORAS_DELCARADA"></asp:BoundField>
                                                        <asp:BoundField DataField="DATA_DECLARACAO" HeaderText="DATA DECLARACAO" SortExpression="DATA_DECLARACAO"></asp:BoundField>
                                                        <asp:BoundField DataField="STATUS_DECLARACAO" HeaderText="STATUS DECLARACAO" SortExpression="STATUS_DECLARACAO"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SGV_DEVConnectionString2 %>' SelectCommand="SELECT E.NOME_EVENTO, A.NOME_ATIVIDADE, VAE.DATA_DECLARADA, VAE.QUANTIDADE_HORAS_DELCARADA, VAE.DATA_DECLARACAO, VAE.STATUS_DECLARACAO 
FROM VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, VOLUNTARIO V, ATIVIDADE_x_EVENTO AE, ATIVIDADE A, EVENTO E
WHERE E.COD_EVENTO = AE.EVENTO AND A.COD_ATIVIDADE = AE.ATIVIDADE AND AE.SEQUENCIAL = VAE.ATIVIDADE_x_EVENTO AND VAE.VOLUNTARIO = V.CPF "></asp:SqlDataSource>
                                            </div>
                                            <div class="col-lg-12 form-group">
                                                <label>Eventos</label>
                                                <asp:GridView ID="grwEventos" Width="100%" CssClass="table table-striped table-bordered table-hover" runat="server"   AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="SEQUENCIAL" >
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="SEQUENCIAL" InsertVisible="False" SortExpression="SEQUENCIAL" Visible="False">

                                                            <EditItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Eval("SEQUENCIAL") %>' ID="Label1"></asp:Label>

                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("SEQUENCIAL") %>' ID="Label1"></asp:Label>


                                                            </ItemTemplate>

                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="NOME_EVENTO" HeaderText="EVENTO" SortExpression="NOME_EVENTO"></asp:BoundField>
                                                        <asp:BoundField DataField="NOME_ATIVIDADE" HeaderText="ATIVIDADE" SortExpression="NOME_ATIVIDADE"></asp:BoundField>
                                                        <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS"></asp:BoundField>
                                                        <asp:BoundField DataField="QUANTIDADE_HORAS_DELCARADA" HeaderText="QUANTIDADE DE HORAS DELCARADA" SortExpression="QUANTIDADE_HORAS_DELCARADA"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="SELECIONAR" SortExpression="SELECIONAR">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CheckBox1" runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SGV_DEVConnectionString2 %>' SelectCommand="SELECT AE.SEQUENCIAL, E.NOME_EVENTO, A.NOME_ATIVIDADE, VAE.STATUS, VAE.QUANTIDADE_HORAS_DELCARADA
FROM EVENTO E, ATIVIDADE A, ATIVIDADE_x_EVENTO AE, VOLUNTARIO V, VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE
WHERE E.COD_EVENTO = AE.EVENTO AND A.COD_ATIVIDADE = AE.ATIVIDADE AND AE.SEQUENCIAL = VAE.ATIVIDADE_x_EVENTO AND V.CPF = VAE.VOLUNTARIO"></asp:SqlDataSource>
                                            </div>
                                            <!--div class="form-group">
                                                <label>Horas restantes na semana: </label>
                                                <asp:Label ID="lbl_horas_rest_semana" CssClass="form-group" runat="server" Text="2:02"></asp:Label>
                                            </div-->
                                            <div class="form-group">
                                                <asp:Button ID="btn_aceitar_evento" CssClass="btn btn-outline btn-success" runat="server" Text="Aceitar Evento" OnClick="btn_aceitar_evento_Click" />
                                                <asp:Button ID="btn_recusar_evento" CssClass="btn btn-outline btn-danger" runat="server" Text="Recusar Evento" />
                                                <asp:Button ID="btn_declarar_horas" CssClass="btn btn-outline btn-primary" runat="server" Text="Declarar Horas" OnClick="btn_declarar_horas_Click" />
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
                    $("#GridView1").prepend($("<thead></thead>").append($("#GridView1").find("tr:first"))).dataTable({
                        responsive: true
                    });
                    $("#grwEventos").prepend($("<thead></thead>").append($("#grwEventos").find("tr:first"))).dataTable({
                        responsive: true,
                        
                    });
                });

            </script>
    </form>
</body>
</html>
