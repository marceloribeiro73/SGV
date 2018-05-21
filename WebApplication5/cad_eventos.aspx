<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cad_eventos.aspx.cs" Inherits="WebApplication5.cad_eventos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>SGV - Cadastro de Eventos</title>

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
                            <a href="voluntarios.aspx"><i class="fa fa-male fa-fw"></i>Voluntarios</a>
                        </li>
                        <li>
                            <a href="atividades.aspx"><i class="fa fa-bar-chart-o fa-fw"></i>Atividades</a>
                        </li>
                        <li>
                            <a href="evetos.aspx"><i class="fa fa-table fa-fw"></i>Eventos</a>
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
                                Cadastro
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                   <div class="col-lg-12">  
                                       <div class="form-group col-lg-12">
                                           <label for="txtNomeEvento" class="control-label">Nome do Evento *</label>
                                           <asp:TextBox ID="txtNomeEvento" CssClass="form-control " runat="server" ></asp:TextBox>
                                       </div>
                                       <div class="form-group col-lg-4">
                                           <label for="txtDataInicio" class="control-label">Data Inicio * </label>
                                           <asp:TextBox ID="txtDataInicio" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                       </div>
                                       <div class="form-group col-lg-4">
                                           <label for="txtDataFim" class="control-label">Data Fim *</label>
                                           <asp:TextBox ID="txtDataFim" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                       </div>
                                       <div class="form-group col-lg-4">
                                           <label>Tipo do Evento *</label>
                                           <asp:DropDownList ID="ddlTipoEvento" CssClass="form-control" runat="server" DataSourceID="dsDrpEventos" DataTextField="NOME_TIPO_EVENTO" DataValueField="COD_TIPO_EVENTO"></asp:DropDownList>
                                           <asp:SqlDataSource ID="dsDrpEventos" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString %>" SelectCommand="SELECT [COD_TIPO_EVENTO], [NOME_TIPO_EVENTO] FROM [TIPO_EVENTO]"></asp:SqlDataSource>
                                       </div>
                                       <div class="form-group col-lg-6">
                                          <label>Endereço</label>
                                          <asp:TextBox ID="txtEndereco" CssClass="form-control" runat="server"></asp:TextBox>
                                       </div>
                                       <div class="form-group col-lg-12">
                                           <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="atividades" CssClass="table table-bordered">
                                               <Columns>
                                                   <asp:TemplateField>
                                                       <ItemTemplate>
                                                           <asp:CheckBox ID="CheckBox1" runat="server" />
                                                       </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:BoundField DataField="NOME ATIVIDADE" HeaderText="NOME ATIVIDADE" SortExpression="NOME ATIVIDADE" />
                                                   <asp:BoundField DataField="QUANTIDADE DE VOLUNTARIOS" HeaderText="QUANTIDADE DE VOLUNTARIOS" SortExpression="QUANTIDADE DE VOLUNTARIOS" />
                                                   <asp:BoundField DataField="HORAS EM MEDIA" HeaderText="HORAS EM MEDIA" ReadOnly="True" SortExpression="HORAS EM MEDIA" />
                                               </Columns>
                                           </asp:GridView>
                                           <asp:SqlDataSource ID="atividades" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString %>" SelectCommand="SELECT NOME_ATIVIDADE AS 'NOME ATIVIDADE', QTD_VOLUNNTARIOS AS 'QUANTIDADE DE VOLUNTARIOS', QTD_MINUTOS / 60 AS 'HORAS EM MEDIA' FROM ATIVIDADE WHERE STATUS &lt;&gt; 'I'"></asp:SqlDataSource>
                                       </div>
                                       <div class="form-group col-lg-12">
                                            <asp:Button ID="btnSalvar" CssClass="btn btn-success btn-outline"  Text="Salvar"  runat="server" OnClick="btnSalvar_Click" />
                                            <asp:Button ID="btnCancelar" CssClass="btn btn-danger btn-outline"  Text="Cancelar"  runat="server" OnClick="btnCancelar_Click" />
                                       </div>
                                       <div class="col-lg-12">
                                           <label>Campos com * são obrigatorios</label><br />
                                           <asp:Label ID="lblAlerta" CssClass="form-group" Text="" runat="server" Visible="false"></asp:Label>
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
