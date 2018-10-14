<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logs.aspx.cs" Inherits="WebApplication5.logs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>SGV - Administração do Sistema - Logs</title>

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

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">




    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->


    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

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
                            <h1 class="page-header">Administração do Sistema</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Log
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <table width="100%" class="table table-striped table-bordered" id="tbl_logs">
                                                <thead>
                                                    <tr>
                                                        <th>ID do Evento</th>
                                                        <th>Usuario</th>
                                                        <th>Ocorrido</th>
                                                        <th>Data</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="odd gradeX">
                                                        <td>01</td>
                                                        <td>jpedro</td>
                                                        <td>Fez Login</td>
                                                        <td>01/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>02</td>
                                                        <td>jpedro</td>
                                                        <td>Atribuiu jlima a uma atividade</td>
                                                        <td>01/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>03</td>
                                                        <td>jpedro</td>
                                                        <td>Fez Logoff</td>
                                                        <td>01/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>04</td>
                                                        <td>jlima</td>
                                                        <td>Fez Login</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>05</td>
                                                        <td>jlima</td>
                                                        <td>Fez Logoff</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>06</td>
                                                        <td>jpedro</td>
                                                        <td>Fez Login</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>07</td>
                                                        <td>hsantos</td>
                                                        <td>Fez Login</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>08</td>
                                                        <td>jpedro</td>
                                                        <td>Fez Logoff</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>09</td>
                                                        <td>tsouza</td>
                                                        <td>Tentativa de Login sem Sucesso</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>10</td>
                                                        <td>tsouza</td>
                                                        <td>Tentativa de Login sem Sucesso</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>11</td>
                                                        <td>tsouza</td>
                                                        <td>Tentativa de Login sem Sucesso</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>12</td>
                                                        <td>tsouza</td>
                                                        <td>Tentativa de Login sem Sucesso</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>13</td>
                                                        <td>tsouza</td>
                                                        <td>Login Bloqueado - Contate Admin. do Sistema</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>14</td>
                                                        <td>fmaia</td>
                                                        <td>Fez Login</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>15</td>
                                                        <td>hsantos</td>
                                                        <td>Fez Logoff</td>
                                                        <td>02/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>16</td>
                                                        <td>jpedro</td>
                                                        <td>Fez Login</td>
                                                        <td>03/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>17</td>
                                                        <td>jpedro</td>
                                                        <td>Resetou a senha do Usuario tsouza</td>
                                                        <td>03/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>18</td>
                                                        <td>jpedro</td>
                                                        <td>Cadastrou um evento: ID:E209 </td>
                                                        <td>03/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>19</td>
                                                        <td>jpedro</td>
                                                        <td>Cadastrou uma nova Atividade: ID:A267</td>
                                                        <td>013/03/2018</td>
                                                    </tr>
                                                    <tr class="odd gradeX">
                                                        <td>20</td>
                                                        <td>jpedro</td>
                                                        <td>Atribuiu a Atividade A267 ao Evento E209</td>
                                                        <td>01/03/2018</td>
                                                    </tr>
                                                </tbody>
                                            </table>
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

            <script>
                $(document).ready(function () {
                    $('#tbl_logs').DataTable({
                        responsive: true
                    });
                });
            </script>
    </form>
</body>
</html>
