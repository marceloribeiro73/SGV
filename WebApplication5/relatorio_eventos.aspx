﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="relatorio_eventos.aspx.cs" Inherits="WebApplication5.relatorio_eventos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <meta name="description" content=""/> 
  <meta name="author" content=""/>

  <title>SGV - Relatorios - Eventos</title>

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

  <!--Graficos-->
  <!--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
  google.charts.load('current', { 'packages': ['corechart'] });
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Tipo', 'Voluntarios'],
  ['Gestão', 3],
  ['Interno', 22],
  ['Externo', 17],
  ['Fim de Semana',32]
  ]);

  var options = {
  title: 'Quantidade de voluntários por tipo'
};

var chart = new google.visualization.PieChart(document.getElementById('grf_vol_tipo'));
chart.draw(data, options);
}
</script>-->

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css"/>
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
              <h1 class="page-header">Relatorios</h1>
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
                <div class="panel-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <!-- /Voluntarios por tipo-->
                      <div class="col-lg-6">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            Eventos por tipo
                          </div>
                          <div class="panel-body">
                            <div id="voluntarios_tipo"></div>
                          </div>
                        </div>
                      </div>
                      <!-- /Voluntarios por tipo-->
                      <!-- Media de horas por tivo de voluntario -->
                      <div class="col-lg-6">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            Media de atividades por tipo de evento
                          </div>
                          <div class="panel-body">
                            <div id="horas_tipo"></div>
                          </div>
                        </div>
                        <!-- /Media de horas por tivo de voluntario -->
                      </div>
                      <!--Voluntarios por ano-->
                      <div class="col-lg-12">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            Numero de eventos por ano
                          </div>
                          <div class="panel-body">
                            <div id="voluntarios_ano"></div>
                          </div>
                        </div>
                      </div>
                      <!-- /Voluntarios por ano-->
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

      <!--Graficos usando Morris-->
      <script>
      new Morris.Donut({
        element: 'voluntarios_tipo',

        data: [
          { label: "Trabalho Social", value: 34 },
          { label: "Reuniões", value: 12 },
          { label: "Comemorações", value: 3 },
          { label: "Palestras", value: 6 }
        ]

      })

      new Morris.Bar({
        element: 'horas_tipo',

        data: [
            { y: "Trabalho Social", x: 98 },
            { y: "Reuniões", x: 12 },
            { y: "Comemorações", x: 4 },
            { y: "Palestras", x: 9 }
        ],
        xkey: 'y',
        ykeys: 'x',
        labels: 'Atividades',
        stacked: true
      })
            
      new Morris.Line({
          element: 'voluntarios_ano',

          data: [
              { y: '2000', x: 5 },
              { y: '2001', x: 20 },
              { y: '2002', x: 27 },
              { y: '2003', x: 25 },
              { y: '2004', x: 26 },
              { y: '2005', x: 34 },
              { y: '2006', x: 33 },
              { y: '2007', x: 42 },
              { y: '2008', x: 49 },
              { y: '2009', x: 56 },
              { y: '2010', x: 70 },
              { y: '2011', x: 40 },
              { y: '2012', x: 123 },
              { y: '2013', x: 230 },
              { y: '2014', x: 145 },
              { y: '2015', x: 90 },
              { y: '2016', x: 124 },
              { y: '2017', x: 233 },
              { y: '2018', x: 67 }
          ],
          xkey: 'y',
          ykeys: 'x',
          labels: ['Qtd'],
      })
      </script>
    </form>
  </body>
  </html>