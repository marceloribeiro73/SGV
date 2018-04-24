<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="atividades.aspx.cs" Inherits="WebApplication5.atividades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>SGV - Atividades</title>
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
                <a href="voluntarios.aspx"><i class="fa fa-male fa-fw"></i> Voluntários</a>
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
                        <a href="tipo_eventos.aspx">Tipo de Evento</a>
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
                    <a href="relatorio_voluntario.aspx">Voluntarios</a>
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
              <h1 class="page-header">Atividades</h1>
            </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          Atividades
                      </div>
                      <!-- /.panel-heading -->
                      <!-- Buscar-->
                      <div class="panel-body">
                          <div class="form-group col-lg-12">
                              <asp:Button ID="btnIncluir" CssClass="btn btn-outline btn-primary" Text="Incluir Nova Atividade" runat="server" OnClick="btnIncluir_Click"/>
                          </div>
                          <div class="form-group col-lg-6">
                            <label>Nome</label>
                            <asp:TextBox ID="txtNome"  CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                          <div class="form-group col-lg-6">
                            <label>Tipo de Atividade</label>
                              <asp:DropDownList ID="ddtipoAtividade" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOME_TIPO_ATIVIDADE" DataValueField="COD_TIPO_ATIVIDADE"></asp:DropDownList>
                              <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SGV_DEVConnectionString %>' SelectCommand="SELECT [COD_TIPO_ATIVIDADE], [NOME_TIPO_ATIVIDADE] FROM [TIPO_ATIVIDADE]"></asp:SqlDataSource>
                          </div>
                          <div class="form-group col-lg-12">
                            <asp:Button ID="btnBuscar" CssClass="btn btn-outline btn-primary" Text="Buscar" runat="server" OnClick="btnBuscar_Click" />
                            <asp:Button ID="btnLimpar" CssClass="btn btn-outline btn-primary" Text="Limpar" runat="server" OnClick="btnLimpar_Click" />
                          </div>
                      </div>
                      <div class="panel-body">
                              <asp:GridView ID="grwAtividades" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True">
                                  <Columns>
                                      <asp:TemplateField>
                                          <ItemTemplate>
                                              <asp:CheckBox ID="CheckBox1" runat="server" />
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="NOME DA ATIVIDADE" SortExpression="NOME DA ATIVIDADE">
                                          <EditItemTemplate>
                                              <asp:TextBox runat="server" Text='<%# Bind("[NOME DA ATIVIDADE]") %>' ID="TextBox1"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label runat="server" Text='<%# Bind("[NOME DA ATIVIDADE]") %>' ID="Label1"></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="QUANTIDADE IDEAL DE VOLUNTARIOS" HeaderText="QUANTIDADE IDEAL DE VOLUNTARIOS" SortExpression="QUANTIDADE IDEAL DE VOLUNTARIOS"></asp:BoundField>
                                      <asp:BoundField DataField="DURA&#199;&#195;O MEDIA EM MINUTOS" HeaderText="DURA&#199;&#195;O MEDIA EM MINUTOS" SortExpression="DURA&#199;&#195;O MEDIA EM MINUTOS"></asp:BoundField>
                                      <asp:TemplateField HeaderText="STATUS" SortExpression="STATUS">
                                          <EditItemTemplate>
                                              <asp:TextBox runat="server" Text='<%# Bind("STATUS") %>' ID="TextBox2"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label runat="server" Text='<%# Bind("STATUS") %>' ID="Label2"></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="DATA DE CRIA&#199;&#195;O" HeaderText="DATA DE CRIA&#199;&#195;O" SortExpression="DATA DE CRIA&#199;&#195;O"></asp:BoundField>
                                      <asp:BoundField DataField="TIPO DE ATIVIDADE" HeaderText="TIPO DE ATIVIDADE" SortExpression="TIPO DE ATIVIDADE"></asp:BoundField>
                                  </Columns>
                              </asp:GridView>
                              <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SGV_DEVConnectionString %>' SelectCommand="SELECT A.NOME_ATIVIDADE AS 'NOME DA ATIVIDADE',A.QTD_VOLUNTARIOS AS 'QUANTIDADE IDEAL DE VOLUNTARIOS',A.DURACAO_MEDIA_MINUTOS AS 'dURAÇÃO MEDIA EM MINUTOS',A.STATUS AS 'STATUS',A.DATA_CRIACAO AS 'DATA DE CRIAÇÃO',T.NOME_TIPO_ATIVIDADE AS 'TIPO DE ATIVIDADE' FROM ATIVIDADE A, TIPO_ATIVIDADE T WHERE T.COD_TIPO_ATIVIDADE = A.TIPO_ATIVIDADE"></asp:SqlDataSource>
                          <asp:Button ID="btnAlterar" CssClass="btn btn-outline btn-primary" Text="Alterar" runat="server" OnClick="btnAlterar_Click" />
                          <asp:Button ID="btnAtivar" CssClass="btn btn-outline btn-primary" Text="Desativar/Ativar" runat="server" OnClick="btnAtivar_Click" />
                          <%--<button type="button" class="btn btn-outline btn-primary">Atribuir Voluntários</button>--%>
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
