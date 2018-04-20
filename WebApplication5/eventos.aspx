<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eventos.aspx.cs" Inherits="WebApplication5.eventos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SGV - Eventos</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>


    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

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
                            <li><a href="#"><i class="fa fa-user fa-fw"></i>Perfil</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="Index.aspx"><i class="fa fa-sign-out fa-fw"></i>Sair</a>
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
                                <a href="voluntarios.aspx"><i class="fa fa-male fa-fw"></i>Voluntários</a>
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
                            <h1 class="page-header">Eventos</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Eventos
                                </div>
                                <!-- Buscar-->
                                <div class="panel-body">
                                    <div class="form-group col-lg-12">
                                        <asp:LinkButton ID="btnIncluirEvento" Text="Incluir Novo Evento" CssClass="btn btn-primary btn-outline" runat="server" OnClick="btnIncluirEvento_Click"></asp:LinkButton>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Nome</label>
                                        <input class="form-control" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Tipo de Evento</label>
                                        <asp:DropDownList ID="ddlTipoEvento" CssClass="form-control" runat="server" DataSourceID="tipoevento" DataTextField="NOME_TIPO_EVENTO" DataValueField="COD_TIPO_EVENTO">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="tipoevento" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString %>" SelectCommand="SELECT [NOME_TIPO_EVENTO], [COD_TIPO_EVENTO] FROM [TIPO_EVENTO]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <input type="checkbox" /><label>&nbsp Inativo</label>
                                    </div>
                                    <div class="form-group col-lg-12">
                                        <button type="button" class="btn btn-outline btn-primary">Buscar</button>
                                        <button type="button" class="btn btn-outline btn-primary">Limpar</button>
                                    </div>
                                </div>
                                <asp:GridView ID="grwEventos" runat="server" AutoGenerateColumns="False" DataKeyNames="COD_EVENTO" DataSourceID="evento" CssClass="table table-bordered table-responsive" AllowPaging="True" AllowSorting="True">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="COD_EVENTO" InsertVisible="False" SortExpression="COD_EVENTO">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("COD_EVENTO") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("COD_EVENTO") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="NOME_EVENTO" HeaderText="NOME_EVENTO" SortExpression="NOME_EVENTO" />
                                        <asp:BoundField DataField="DATA_INICIO" HeaderText="DATA_INICIO" SortExpression="DATA_INICIO" />
                                        <asp:BoundField DataField="DATA_FIM" HeaderText="DATA_FIM" SortExpression="DATA_FIM" />
                                        <asp:TemplateField HeaderText="STATUS" SortExpression="STATUS">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("STATUS") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DATA_CRIACAO" HeaderText="DATA_CRIACAO" SortExpression="DATA_CRIACAO" />
                                        <asp:BoundField DataField="DATA_INATIVACAO" HeaderText="DATA_INATIVACAO" SortExpression="DATA_INATIVACAO" />
                                        <asp:BoundField DataField="NOME_TIPO_EVENTO" HeaderText="NOME_TIPO_EVENTO" SortExpression="NOME_TIPO_EVENTO" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="evento" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString %>" SelectCommand="SELECT E.COD_EVENTO, E.NOME_EVENTO, E.DATA_INICIO, 
		E.DATA_FIM, E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO 
		FROM EVENTO E , TIPO_EVENTO T WHERE E.TIPO_EVENTO = T.COD_TIPO_EVENTO"></asp:SqlDataSource>

                                <asp:Button ID="btnAlterar" CssClass="btn btn-outline btn-primary" Text="Alterar" runat="server" />
                                <asp:Button ID="btnInativar" CssClass="btn btn-outline btn-primary" Text="Inativar/Ativar" runat="server" OnClick="btnInativar_Click" />
                                <asp:Button ID="btnAtribuir" CssClass="btn btn-outline btn-primary" Text="Atribuir Atividades" runat="server" />
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

        <!-- DataTables JavaScript -->
        <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
        <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

        <script>
            $(document).ready(function () {
                $('#grwEventos').DataTable({
                    responsive: true
                });
            });
        </script>
    </form>
</body>
</html>
