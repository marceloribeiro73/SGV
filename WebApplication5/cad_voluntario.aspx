﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cad_voluntario.cs" Inherits="WebApplication5.Cad_voluntario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>SGV - Cadastro Voluntários</title>

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
    <script type="text/javascript">
        function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('txtLogradouro').value=("");
            document.getElementById('txtBairro').value=("");
            document.getElementById('txtCidade').value=("");
            document.getElementById('txtEstadoProvincia').value=("");
            document.getElementById('txtPais').value=("");
    }

        function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('txtLogradouro').value=(conteudo.logradouro);
            document.getElementById('txtBairro').value=(conteudo.bairro);
            document.getElementById('txtCidade').value=(conteudo.localidade);
            document.getElementById('txtEstadoProvincia').value=(conteudo.uf);
            document.getElementById('txtPais').value=("Brasil");
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("Codigo postal não encontrado, insira os dados manualmente. ");
        }
    }

    function pesquisacep(valor){
        var cep = valor.replace(/\D/g, '');

        if (cep != ""){
            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;
            if(validacep.test(cep)){
                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('txtLogradouro').value="...";
                document.getElementById('txtBairro').value="...";
                document.getElementById('txtCidade').value="...";
                document.getElementById('txtEstadoProvincia').value="...";
                document.getElementById('txtPais').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);
            }
            else{
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        }
        //cep sem valor, limpa formulário.
        limpa_formulário_cep();
    }
    </script>

    <script type="text/javascript">
        function valida_horas_max(valor){
            var data = now.getDay + now.getMonth + now.getFullYear;
            //Valida se é nulo
            now = new Date;
            if(valor != null){
                //Valida se está entre 1 e 8
                if(valor < 1 || valor > 8){
                    document.getElementById("txtMaxHorasTrab").value="1";
                    alert("Quantidade de horas não permitidas.");
                }
            }
        }
    </script>


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
                            <h1 class="page-header">Voluntários</h1>
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
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    Informações Pessoais
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="form-group col-lg-3">
                                                                <label>CPF *</label>
                                                                <asp:TextBox ID="txtCpf" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-3">
                                                                <label>Primeiro Nome *</label>
                                                                <asp:TextBox ID="txtPrimeiroNome" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-3">
                                                                <label>Ultimo Nome *</label>
                                                                <asp:TextBox ID="txtUltimoNome" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-3">
                                                                <label>Data de Nascimento *</label>
                                                                <asp:TextBox ID="txtDataNasc" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-2">
                                                                <label>Documento de Identificação *</label>
                                                                <asp:TextBox ID="txtDocId" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-2">
                                                                <label>Orgão Emissor *</label>
                                                                <asp:TextBox ID="txtOrgEmissor" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-3">
                                                                <label>Data de Emissão *</label>
                                                                <asp:TextBox ID="txtDataEmmisaoDoc" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-2">
                                                                <label>Tipo de Documento de Indentificação *</label>
                                                                <asp:DropDownList ID="ddwTipoDocID" CssClass="form-control" runat="server">
                                                                    <asp:ListItem Value="R">RG</asp:ListItem>
                                                                    <asp:ListItem Value="P">PASSAPORTE</asp:ListItem>
                                                                    <asp:ListItem Value="E">RNE</asp:ListItem>

                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="form-group col-lg-3">
                                                                <label>Nacionalidade *</label>
                                                                <asp:TextBox ID="txtNacionalidade" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    Endereço
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="form-group col-lg-2">
                                                                <label>CEP *</label>
                                                                <asp:TextBox ID="txtCep" CssClass="form-control" runat="server" onblur="pesquisacep(this.value)" ></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-4">
                                                                <label>Logradouro *</label>
                                                                <asp:TextBox ID="txtLogradouro" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-1">
                                                                <label>Numero *</label>
                                                                <asp:TextBox ID="txtNumero" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-2">
                                                                <label>Complemento</label>
                                                                <asp:TextBox ID="txtComplemento" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-3">
                                                                <label>Bairro *</label>
                                                                <asp:TextBox ID="txtBairro" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-3">
                                                                <label>Cidade *</label>
                                                                <asp:TextBox ID="txtCidade" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-4">
                                                                <label>Estado *</label>
                                                                <asp:TextBox ID="txtEstadoProvincia" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group col-lg-3">
                                                                <label>Pais *</label>
                                                                <asp:TextBox ID="txtPais" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label>Telefone Contato *</label>
                                                <asp:TextBox ID="txtTel1" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label>Telefone Contato</label>
                                                <asp:TextBox ID="txtTel2" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label>Email *</label>
                                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label>Data Adesão *</label>
                                                <asp:TextBox ID="txtDataAdesao" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label>Tipo de Voluntário *</label>
                                                <asp:DropDownList ID="ddwTipoVoluntario" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOME_TIPO_VOLUNTARIO" DataValueField="COD_TIPO_VOLUNTARIO">

                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SGV_DEVConnectionString2 %>" SelectCommand="SELECT [COD_TIPO_VOLUNTARIO], [NOME_TIPO_VOLUNTARIO] FROM [TIPO_VOLUNTARIO]"></asp:SqlDataSource>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label>Dias possiveis de Trabalho</label><br />
                                                <asp:Checkbox ID="chkDiaDomingo" CssClass="form-control" Text="D" TextAlign="Left" runat="server" />
                                                <asp:Checkbox ID="chkDiaSegunda" CssClass="form-control" Text="S" TextAlign="Left" runat="server" />
                                                <asp:Checkbox ID="chkDiaTerca" CssClass="form-control" Text="T" TextAlign="Left" runat="server" />
                                                <asp:Checkbox ID="chkDiaQuarta" CssClass="form-control" Text="Q" TextAlign="Left" runat="server" />
                                                <asp:Checkbox ID="chkDiaQuinta" CssClass="form-control" Text="Q" TextAlign="Left" runat="server" />
                                                <asp:Checkbox ID="chkDiaSexta" CssClass="form-control" Text="S" TextAlign="Left" runat="server" />
                                                <asp:Checkbox ID="chkDiaSabado" CssClass="form-control" Text="S" TextAlign="Left" runat="server" />
                                            </div>
                                            <div class="form-group col-lg-2">
                                                <label>Maximo de Horas trabalhadas por semana *</label>
                                                <asp:TextBox ID="txtMaxHorasTrab" CssClass="form-control" TextMode="Number" Text="1" runat="server" onblur="valida_horas_max(this.value)"></asp:TextBox>
                                                <asp:Label ID="lblErroHorasMax" CssClass="form-group" Text='Por gentileza, insira valores ente 1 e 8.' runat="server"></asp:Label>
                                            </div>
                                            
                                            <div class="form-group col-lg-6">
                                                <label>Termo da adesão</label>
                                                <asp:FileUpload ID="upFoto" CssClass="form-control" runat="server" />
                                                <asp:Button ID="btnDownload" Text="Download Termo" CssClass="btn btn-outline" runat="server" OnClick="btnDownload_Click" />
                                            </div>
                                            <div class="form-group col-lg-12">
                                                <asp:Button ID="btnSalvar" Text="Salvar" CssClass="btn btn-success" runat="server" OnClick="btnSalvar_Click" />
                                                <asp:Button ID="btnCancelar" Text="Cancelar" CssClass="btn btn-danger" runat="server" OnClick="btnCancelar_Click" />
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
