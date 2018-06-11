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
                                                <label>Declarações Anteriores</label>
                                                <asp:GridView ID="grwUtlDecla" CssClass="table table-bordered table-striped table-responsive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DECLAANTER">
                                                    <Columns>
                                                        <asp:BoundField DataField="VOLUNTÁRIO" HeaderText="VOLUNTÁRIO" ReadOnly="True" SortExpression="VOLUNTÁRIO" />
                                                        <asp:BoundField DataField="EVENTO" HeaderText="EVENTO" SortExpression="EVENTO" />
                                                        <asp:BoundField DataField="HORAS DECLARADAS" HeaderText="HORAS DECLARADAS" SortExpression="HORAS DECLARADAS" />
                                                        <asp:BoundField DataField="DATA" HeaderText="DATA" SortExpression="DATA" />
                                                    </Columns>
                                                    
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="DECLAANTER" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString2 %>" SelectCommand="SELECT V.PRIMEIRO_NOME+' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO', E.NOME_EVENTO AS 'EVENTO', DH.HORAS_DECLARADAS AS 'HORAS DECLARADAS', DH.DATA_DECLARACAO AS 'DATA'
FROM VOLUNTARIO V, EVENTO E, DECLARACAO_HORAS DH WHERE V.CPF = DH.VOLUNTARIO AND DH.EVENTO = E.COD_EVENTO"></asp:SqlDataSource>
                                            </div>
                                            <div class="col-lg-12 form-group">
                                                <label>Eventos</label>
                                                <asp:GridView ID="grwEventos" CssClass="table table-bordered table-striped table-responsive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="EVENTOS" DataKeyNames="COD_EVENTO">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="COD_EVENTO" InsertVisible="False" SortExpression="COD_EVENTO" Visible="False">
                                                            <EditItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("COD_EVENTO") %>'></asp:Label>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("COD_EVENTO") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="EVENTO" SortExpression="EVENTO">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EVENTO") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("EVENTO") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="DATA DE INICIO" HeaderText="DATA DE INICIO" SortExpression="DATA DE INICIO" />
                                                        <asp:BoundField DataField="DATA DE TERMINO" HeaderText="DATA DE TERMINO" SortExpression="DATA DE TERMINO" />
                                                        <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                                                    </Columns>
                                                    
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="EVENTOS" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString2 %>" SelectCommand="SELECT E.COD_EVENTO, E.NOME_EVENTO AS 'EVENTO', E.DATA_INICIO 'DATA DE INICIO', E.DATA_FIM AS 'DATA DE TERMINO' , SA.NOME_STATUS AS 'STATUS' FROM EVENTO E, VOLUNTARIO_x_EVENTO VE, VOLUNTARIO V, STATUS_APP SA WHERE V.CPF=VE.VOLUNTARIO AND E.COD_EVENTO=VE.EVENTO AND SA.SIGLA_STATUS = VE.STATUS"></asp:SqlDataSource>
                                            </div>
                                            <!--div class="form-group">
                                                <label>Horas restantes na semana: </label>
                                                <asp:Label ID="lbl_horas_rest_semana" CssClass="form-group" runat="server" Text="2:02"></asp:Label>
                                            </div-->
                                            <div class="form-group">
                                                <asp:Button ID="btn_aceitar_evento" CssClass="btn btn-outline btn-success" runat="server" Text="Aceitar Evento" OnClick="btn_aceitar_evento_Click"  />
                                                <asp:Button ID="btn_recusar_evento" CssClass="btn btn-outline btn-danger" runat="server" Text="Recusar Evento"/>
                                                <asp:Button ID="btn_declarar_horas" CssClass="btn btn-outline btn-primary" runat="server" Text="Declarar Horas" />
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
