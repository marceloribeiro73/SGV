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
                <a href="voluntarios.aspx"><i class="fa fa-male fa-fw"></i> Voluntarios</a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Atividades</a>
              </li>
              <li>
                <a href="tables.html"><i class="fa fa-table fa-fw"></i>Eventos</a>
              </li>
              <li>
                <a href="#"><i class="fa fa-wrench fa-fw"></i>Administração do Sistema<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                  <li>
                    <a href="panels-wells.html"><i class="fa fa-user"></i>Usuarios</a>
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
              <h1 class="page-header">Voluntários</h1>
            </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          Voluntários
                      </div>
                      <!-- /.panel-heading -->
                      <!-- Buscar-->
                      <div class="panel-body">
                        <form role="form">
                          <div class="form-group">
                            <label>Matricula</label>
                            <input class="form-control">
                          </div>
                          <div class="form-group">
                            <label>Nome</label>
                            <input class="form-control">
                          </div>
                          <div class="form-group">
                            <label>Tipo de Voluntário</label>
                            <select class="form-control" name="sele_tipo_usuario">
                              <option>Todos</option>
                              <option>Gestão</option>
                              <option>Externo</option>
                              <option>Interno</option>
                              <option>Fim de Semana</option>
                            </select>
                          </div>
                            <script type="text/javascript">
                              function mascaraData( campo, e )
                              {
                                var kC = (document.all) ? event.keyCode : e.keyCode;
                                var data = campo.value;

                                if( kC!=8 && kC!=46 )
                                {
                                  if( data.length==2 )
                                  {
                                    campo.value = data += '/';
                                  }
                                  else if( data.length==5 )
                                  {
                                    campo.value = data += '/';
                                  }
                                  else
                                  campo.value = data;
                                }
                              }
                            </script>
                          <div class="form-group">
                            <label>Data de Adesão</label>
                            </br><label>De</label><input type="text" class="form-control" name="outra_data" id="outra_data" maxlength="10" onkeypress="mascaraData( this, event )" />
                            <label>Até</label><input type="text" class="form-control" name="outra_data" id="outra_data" maxlength="10" onkeypress="mascaraData( this, event )" />
                          </div>
                          <div class="form-group">
                            <button type="button" class="btn btn-outline btn-primary">Buscar</button>
                            <button type="button" class="btn btn-outline btn-primary">Limpar</button>
                          </div>
                        </form>
                      </div>
                      <div class="panel-body">
                          <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                              <thead>
                                  <tr>
                                      <th><input type="checkbox"></th>
                                      <th>Matricula</th>
                                      <th>Nome</th>
                                      <th>Tipo</th>
                                      <th>Data de Adesão</th>
                                      <th>Estado</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr class="odd gradeX">
                                      <th><input type="checkbox"></th>
                                      <td>1002</td>
                                      <td>Carla Silva</td>
                                      <td>Externo</td>
                                      <td class="center">/10/2010</td>
                                      <td class="center">Ativo</td>
                                  </tr>
                                  <tr class="even gradeC">
                                    <th><input type="checkbox"></th>
                                    <td>1003</td>
                                    <td>Juliana Bravo</td>
                                    <td>Interno</td>
                                    <td class="center">04/11/2010</td>
                                    <td class="center">Ativo</td>
                                  </tr>
                                  <tr class="odd gradeA">
                                      <<th><input type="checkbox"></th>
                                      <td>1004</td>
                                      <td>Matheus Faria</td>
                                      <td>Fim de Semana</td>
                                      <td class="center">04/03/2011</td>
                                      <td class="center">Ativo</td>
                                  </tr>
                                  <tr class="even gradeA">
                                    <th><input type="checkbox"></th>
                                    <td>1005</td>
                                    <td>Fabio Cunha</td>
                                    <td>Externo</td>
                                    <td class="center">28/06/2011</td>
                                    <td class="center">Inativo</td>
                                  </tr>
                                  <tr class="odd gradeA">
                                    <th><input type="checkbox"></th>
                                    <td>1006</td>
                                    <td>Maria da Mata</td>
                                    <td>Gestão</td>
                                    <td class="center">12/12/2011</td>
                                    <td class="center">Ativo</td>
                                  </tr>
                                  <tr class="even gradeA">
                                    <th><input type="checkbox"></th>
                                    <td>1007</td>
                                    <td>Joana Maia</td>
                                    <td>Externo</td>
                                    <td class="center">12/12/2011</td>
                                    <td class="center">Inativo</td>
                                  </tr>
                              </tbody>
                          </table>
                          <!-- /.table-responsive -->
                          <button type="button" class="btn btn-outline btn-primary">Incluir</button>
                          <button type="button" class="btn btn-outline btn-primary">Alterar</button>
                          <button type="button" class="btn btn-outline btn-primary">Desativar</button>
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
