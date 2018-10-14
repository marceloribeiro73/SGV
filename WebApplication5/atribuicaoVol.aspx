<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="atribuicaoVol.aspx.cs" Inherits="WebApplication5.atribuicaoVol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SGV - Atribuição de Voluntários a Eventos</title>

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
                        <h1 class="page-header">Eventos</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Atribuição de Voluntários a Atividades
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                   <div class="col-lg-12">
                                       <div class="form-group-lg col-lg-12">
                                           <asp:Label ID="lblCodEve" Visible="false" runat="server"></asp:Label>
                                           <label>Nome do Evento</label>
                                           <asp:TextBox ID="txtNomeEvento" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                                       </div>
                                       <div class="form-group col-lg-4">
                                           <label>Data Inicio</label>
                                           <asp:TextBox ID="txtDTinico" CssClass="form-control" TextMode="Date" Enabled="false" runat="server"></asp:TextBox>
                                       </div>
                                       <div class="form-group col-lg-4">
                                           <label>Data Fim</label>
                                           <asp:TextBox ID="txtDtFim" CssClass="form-control" Enabled="false" TextMode="Date"
                                               runat="server"></asp:TextBox>
                                       </div>
                                       <div class="form-group col-lg-4">
                                            <label>Atividade</label>
                                            <asp:DropDownList ID="ddwTipoVoluntario" runat="server" DataSourceID="fonteatrvol" DataTextField="NOME_TIPO_VOLUNTARIO" DataValueField="COD_TIPO_VOLUNTARIO" CssClass="form-control"></asp:DropDownList>
                                            <asp:SqlDataSource ID="fonteatrvol" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString2 %>" SelectCommand="SELECT * FROM [ATIVIDADE]"></asp:SqlDataSource>
                                       </div>
                                       <div class="row">
                                           <div class="col-lg-12">
                                               <div class="panel panel-default">
                                                   <div class="panel-heading">
                                                       Voluntários Disponiveis
                                                   </div>
                                                   <div class="panel-body">
                                                       <div class="table-responsive">
                                                           <asp:GridView ID="grwVolDispo" CssClass="table table-bordered table-responsive" runat="server" DataSourceID="voldisponiveis" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="CPF">
                                                               <Columns>
                                                                   <asp:TemplateField>
                                                                       <ItemTemplate>
                                                                           <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                       </ItemTemplate>
                                                                   </asp:TemplateField>
                                                                   <asp:TemplateField HeaderText="CPF" SortExpression="CPF" Visible="False">
                                                                       <EditItemTemplate>
                                                                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("CPF") %>'></asp:Label>
                                                                       </EditItemTemplate>
                                                                       <ItemTemplate>
                                                                           <asp:Label ID="Label1" runat="server" Text='<%# Bind("CPF") %>'></asp:Label>
                                                                       </ItemTemplate>
                                                                   </asp:TemplateField>
                                                                   <asp:BoundField DataField="VOLUNTÁRIO" HeaderText="VOLUNTÁRIO" SortExpression="VOLUNTÁRIO" ReadOnly="True" />
                                                                   <asp:BoundField DataField="NOME_TIPO_VOLUNTARIO" HeaderText="NOME_TIPO_VOLUNTARIO" SortExpression="NOME_TIPO_VOLUNTARIO" />
                                                               </Columns>

                                                           </asp:GridView>
                                                           
                                                           <asp:SqlDataSource ID="voldisponiveis" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString2 %>" SelectCommand="SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO 
FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV 
WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND V.CPF NOT IN (SELECT V.CPF FROM VOLUNTARIO V, EVENTO E , VOLUNTARIO_x_EVENTO VE WHERE V.CPF = VE.VOLUNTARIO AND VE.EVENTO = E.COD_EVENTO)"></asp:SqlDataSource>
                                                           
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="form-group col-lg-12">
                                               <asp:Button ID="btnAtribuir"  CssClass="btn btn-outline btn-success" Text="Atribuir" runat="server" OnClick="btnAtribuir_Click"  />
                                               <asp:button ID="btnDesatribuir" CssClass="btn btn-outline btn-danger" Text="Desatribuir" runat="server" OnClick="btnDesatribuir_Click" />
                                           </div>
                                           <div class="col-lg-12">
                                               <div class="panel panel-default">
                                                   <div class="panel-heading">
                                                       Voluntários Atribuidos
                                                   </div>
                                                   <div class="panel-body">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="grwVolAtr" CssClass="table table-bordered table-responsive" runat="server" DataSourceID="volAtribuidos" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="CPF" AllowSorting="True">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="CPF" SortExpression="CPF" Visible="False">
                                                                    <EditItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CPF") %>'></asp:Label>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CPF") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="VOLUNTÁRIO" HeaderText="VOLUNTÁRIO" SortExpression="VOLUNTÁRIO" ReadOnly="True" />
                                                                <asp:BoundField DataField="NOME_TIPO_VOLUNTARIO" HeaderText="NOME_TIPO_VOLUNTARIO" SortExpression="NOME_TIPO_VOLUNTARIO" />
                                                            </Columns>

                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="volAtribuidos" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString2 %>" SelectCommand="SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO 
FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV , EVENTO E, VOLUNTARIO_x_EVENTO VE
WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND V.CPF=VE.VOLUNTARIO AND E.COD_EVENTO = VE.EVENTO"></asp:SqlDataSource>
                                                    </div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="form-group col-lg-12">
                                        <asp:Button ID="btnCancelar" CssClass="btn btn-outline btn-primary" Text="Sair" runat="server" OnClick="btnCancelar_Click"/>
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
