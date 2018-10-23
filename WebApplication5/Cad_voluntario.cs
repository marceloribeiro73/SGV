using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class Cad_voluntario : System.Web.UI.Page
    {
        int operacao = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["voluntario"] != null)
            {
                string aux = (string)Session["voluntario"];
                Mensagem(aux);
                string strCmd = string.Format("SELECT V.CPF, V.PRIMEIRO_NOME, V.ULTIMO_NOME,V.DATA_NASC, V.DOC_IDENTIFICACAO,V.TIPO_DOC_IDENTIFICACAO,V.ORGAO_EMISSOR ,V.DATA_EMISSAO,V.NACIONALIDADE,V.TELEFONE_CONTATO,V.TELEFONE_CONTATO2, V.EMAIL, V.DATA_ADESAO,V.MAX_HORAS_SEMANAIS ,V.TIPO_VOLUNTARIO,V.PATH_FOTO ,E.COD_POSTAL,E.LOGRADOURO,E.NUMERO,E.COMPLEMENTO,E.BAIRRO, E.CIDADE, E.ESTADO_PROVINCIA, E.PAIS FROM VOLUNTARIO V, ENDERECO E WHERE V.CPF = '{0}' AND V.CPF = E.CPF", aux);
                SqlDataReader dr = SqlDB.Instancia.FazerSelect(strCmd);
                Voluntario oVoluntario = null;
                if (dr.Read())
                {
                    oVoluntario = new Voluntario();
                    oVoluntario.sCpf = Convert.ToString(dr["CPF"]);
                    oVoluntario.sPrimeiroNome = Convert.ToString(dr["PRIMEIRO_NOME"]);
                    oVoluntario.sUltimoNome = Convert.ToString(dr["ULTIMO_NOME"]);
                   oVoluntario.sDataNasc = Convert.ToString(dr["DATA_NASC"]);
                    oVoluntario.sDocIdentificacao = Convert.ToString(dr["DOC_IDENTIFICACAO"]);
                    oVoluntario.sTipoDocIdentificacao = Convert.ToString(dr["TIPO_DOC_IDENTIFICACAO"]);
                    oVoluntario.sDataEmissao = Convert.ToString(dr["DATA_EMISSAO"]);
                    oVoluntario.sNacionalidade = Convert.ToString(dr["NACIONALIDADE"]);
                    oVoluntario.sTelefoneContato = Convert.ToString(dr["TELEFONE_CONTATO"]);
                    oVoluntario.sTelefoneContato2 = Convert.ToString(dr["TELEFONE_CONTATO2"]);
                    oVoluntario.sEmail = Convert.ToString(dr["EMAIL"]);
                    oVoluntario.sDataAdesao = Convert.ToString(dr["DATA_ADESAO"]);
                    oVoluntario.iTipoVoluntario = Convert.ToInt32(dr["TIPO_VOLUNTARIO"]);
                    oVoluntario.sCodPostal = Convert.ToString(dr["COD_POSTAL"]);
                    oVoluntario.sLogradouro = Convert.ToString(dr["LOGRADOURO"]);
                    oVoluntario.sLogradouro = Convert.ToString(dr["NUMERO"]);
                    oVoluntario.sComplemento = Convert.ToString(dr["COMPLEMENTO"]);
                    oVoluntario.sBairro = Convert.ToString(dr["BAIRRO"]);
                    oVoluntario.sCidade = Convert.ToString(dr["CIDADE"]);
                    oVoluntario.sEstadoProvincia = Convert.ToString(dr["ESTADO_PROVINCIA"]);
                    oVoluntario.sPais = Convert.ToString(dr["PAIS"]);
                    oVoluntario.sPathFoto = Convert.ToString(dr["PATH_FOTO"]);
                    dr.Close();
                    string strCmd2 = string.Format("SELECT FS.DIA_SEMANA FROM DIAS_SEMANA_VOLUNTARIO FS, VOLUNTARIO V WHERE FS.VOLUNTARIO = V.CPF AND V.CPF ='{0}'",oVoluntario.sCpf);
                    oVoluntario.oDiasSemana = new List<int>();
                    SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd2);
                    while(dr1.Read())
                    {
                        int aux1 = Convert.ToInt32(dr1["DIA_SEMANA"]);
                        oVoluntario.oDiasSemana.Add(aux1);
                    }
                    dr1.Close();
                }
                if(oVoluntario != null)
                {
                    txtCpf.Text = Convert.ToString(oVoluntario.sCpf);
                    txtCpf.Enabled = false;
                    txtPrimeiroNome.Text = oVoluntario.sPrimeiroNome;
                    txtPrimeiroNome.Enabled = false;
                    txtUltimoNome.Text = oVoluntario.sUltimoNome;
                    txtUltimoNome.Enabled = false;
                    txtDataNasc.Text = oVoluntario.sDataNasc;
                    txtDataNasc.Enabled = false;
                    txtDocId.Text = oVoluntario.sDocIdentificacao;
                    txtDocId.Enabled = false;
                    txtOrgEmissor.Text = oVoluntario.sOrgaoEmissor;
                    txtOrgEmissor.Enabled = false;
                    txtDataEmmisaoDoc.Enabled = false;
                    ddwTipoDocID.Text = oVoluntario.sTipoDocIdentificacao;
                    ddwTipoDocID.Enabled = false;
                    txtNacionalidade.Text = oVoluntario.sNacionalidade;
                    txtCep.Text = oVoluntario.sCodPostal;
                    txtLogradouro.Text = oVoluntario.sLogradouro;
                    txtNumero.Text = oVoluntario.sNumero;
                    txtComplemento.Text = oVoluntario.sComplemento;
                    txtBairro.Text = oVoluntario.sBairro;
                    txtCidade.Text = oVoluntario.sCidade;
                    txtEstadoProvincia.Text = oVoluntario.sEstadoProvincia;
                    txtPais.Text = oVoluntario.sPais;
                    txtTel1.Text = Convert.ToString(oVoluntario.sTelefoneContato);
                    txtTel2.Text = Convert.ToString(oVoluntario.sTelefoneContato2);
                    txtEmail.Text = oVoluntario.sEmail;
                    txtDataAdesao.Text = oVoluntario.sDataAdesao;
                    txtDataAdesao.Enabled = false;
                    ddwTipoVoluntario.Text =Convert.ToString(oVoluntario.iTipoVoluntario);
                    upFoto.Enabled = false;
                    img1.ImageUrl = oVoluntario.sPathFoto;
                    txtMaxHorasTrab.Text = Convert.ToString(oVoluntario.iMaxHoras);
                    DateTime dtNasc = new DateTime();
                    DateTime dtEmissao = new DateTime();
                    DateTime dtAdmissao = new DateTime();
                    try
                    {
                        DateTime.TryParse(oVoluntario.sDataNasc, out dtNasc);
                        DateTime.TryParse(oVoluntario.sDataEmissao, out dtEmissao);
                        DateTime.TryParse(oVoluntario.sDataAdesao, out dtAdmissao);
                        txtDataNasc.Text = dtNasc.ToString("yyyy-MM-dd");
                        txtDataEmmisaoDoc.Text = dtEmissao.ToString("yyyy-MM-dd");
                        txtDataAdesao.Text = dtEmissao.ToString("yyyy-MM-dd");
                    }catch(Exception ex)
                    {
                        Mensagem(ex.Message);
                    }
                    foreach(int i in oVoluntario.oDiasSemana)
                    {
                        if(i == 1)
                        {
                            chkDiaDomingo.Checked = true;
                        }
                        else if(i ==2)
                        {
                            chkDiaSegunda.Checked = true;
                        }
                        else if(i== 3)
                        {
                            chkDiaTerca.Checked = true;
                        }
                        else if(i==4)
                        {
                            chkDiaQuarta.Checked = true;
                        } 
                        else if(i==5)
                        {
                            chkDiaQuinta.Checked = true;
                        }
                        else if(i==6)
                        {
                            chkDiaSexta.Checked = true;
                        }
                        else if(i==7)
                        {
                            chkDiaSabado.Checked = true;
                        }
                    }
                    operacao = 2;
                }
            }
        }

        public void Limpar()
        {
            txtCpf.Text = string.Empty;
            txtPrimeiroNome.Text = string.Empty;
            txtUltimoNome.Text = string.Empty;
            txtDataNasc.Text = string.Empty;
            txtDocId.Text = string.Empty;
            txtDataEmmisaoDoc.Text = string.Empty;
            txtNacionalidade.Text = string.Empty;
            txtCep.Text = string.Empty;
            txtLogradouro.Text = string.Empty;
            txtNumero.Text = string.Empty;
            txtComplemento.Text = string.Empty;
            txtBairro.Text = string.Empty;
            txtCidade.Text = string.Empty;
            txtEstadoProvincia.Text = string.Empty;
            txtPais.Text = string.Empty;
        }
        private string UpLoadFoto()
        {
            bool fotoOk = false;
            String path = Server.MapPath("~/Fotos/");
            if (upFoto.HasFile)
            {
                String extencao = System.IO.Path.GetExtension(upFoto.FileName).ToLower();
                String[] extencoesAceitas = { ".gif", ".png", ".jpeg", ".jpg" };
                for(int i =0; i < extencoesAceitas.Length; i++)
                {
                    if(extencao == extencoesAceitas[i])
                    {
                        fotoOk = true;
                    }
                }
            }
            if (fotoOk)
            {
                try
                {
                    upFoto.PostedFile.SaveAs(path + txtCpf.Text+System.IO.Path.GetExtension(upFoto.FileName).ToLower());
                    Mensagem("Foto Aceita");
                    return path + txtCpf.Text+System.IO.Path.GetExtension(upFoto.FileName).ToLower();

                }
                catch(Exception e)
                {
                    Mensagem("Foto Não Aceita");
                    return "null";
                }
            }
            else
            {
                Mensagem("Extenção do arquivo não suportada.");
                return "null";
            }
        }

        protected bool validaSeExiste()
        {
            string sCpf = txtCpf.Text;
            string strCmd = string.Format("SELECT CPF FROM VOLUNTARIO WHERE CPF = '{0}'", sCpf);
            SqlDataReader dr = SqlDB.Instancia.FazerSelect(strCmd);
            if(dr.Read())
            {
                if(dr.HasRows)
                {
                    dr.Close();
                    return true;
                }
                else
                {
                    dr.Close();
                    return false;
                }
            }
            else
            {
                dr.Close();
                return false;
            }
        }
        
        protected bool validaConsisData()
        {
            DateTime dNasc = new DateTime();
            DateTime dEmissaDoc = new DateTime(); //Há a necessidade de validar a data de Emissao?
            DateTime dAdsao = new DateTime();
            if(DateTime.TryParse(txtDataNasc.Text, out dNasc))
            {
                if(DateTime.TryParse(txtDataAdesao.Text, out dAdsao))
                {
                   if(DateTime.TryParse(txtDataEmmisaoDoc.Text, out dEmissaDoc))
                   {
                       if((dNasc.Year - DateTime.Now.Year) > 18)
                       {
                           
                        return true;
                           
                       }
                       else
                       {
                           return true;
                       }
                   }
                   else
                   {
                       return true;
                   }
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return true;
            }
        }

        protected bool validaObrigatorios()
        {
            if(txtCep.Text.Equals(null) || txtPrimeiroNome.Text.Equals(null) || txtUltimoNome.Text.Equals(null) || txtDataNasc.Text.Equals(null) || txtDocId.Text.Equals(null) || txtOrgEmissor.Text.Equals(null) ||txtDataEmmisaoDoc.Text.Equals(null) || txtNacionalidade.Text.Equals(null) || txtCep.Text.Equals(null) || txtLogradouro.Text.Equals(null) ||txtNumero.Text.Equals(null) || txtBairro.Text.Equals(null) || txtCidade.Text.Equals(null) || txtEstadoProvincia.Text.Equals(null) || txtPais.Text.Equals(null) || txtTel1.Text.Equals(null) || txtEmail.Text.Equals(null) || txtDataAdesao.Text.Equals(null) || txtMaxHorasTrab.Text.Equals(null) )
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected Voluntario carregaObjVoluntario(string pFoto)
        {
            Voluntario oVoluntario2 = null;
            if(!txtCpf.Text.Equals(null))
            {
                oVoluntario2 = new Voluntario();
                oVoluntario2.sCpf = txtCpf.Text;
                oVoluntario2.sPrimeiroNome = txtPrimeiroNome.Text;
                oVoluntario2.sUltimoNome = txtUltimoNome.Text;
                oVoluntario2.sDataNasc = txtDataNasc.Text;
                oVoluntario2.sDocIdentificacao = txtDocId.Text;
                oVoluntario2.iTipoVoluntario = int.Parse(ddwTipoVoluntario.Text) ;
                oVoluntario2.sDataEmissao = txtDataEmmisaoDoc.Text;
                oVoluntario2.sOrgaoEmissor = txtOrgEmissor.Text;
                oVoluntario2.sNacionalidade = txtNacionalidade.Text;
                oVoluntario2.sTelefoneContato = txtTel1.Text;
                oVoluntario2.sTelefoneContato2 = txtTel2.Text;
                oVoluntario2.sEmail = txtEmail.Text;
                oVoluntario2.sDataAdesao = txtDataAdesao.Text;
                oVoluntario2.sPathFoto = pFoto;
                oVoluntario2.iMaxHoras = 60 * Convert.ToInt32(txtMaxHorasTrab.Text);
                oVoluntario2.iTipoVoluntario = Convert.ToInt32(ddwTipoVoluntario.Text);
                oVoluntario2.sCodPostal = txtCep.Text;
                oVoluntario2.sLogradouro = txtLogradouro.Text;
                oVoluntario2.sNumero = txtNumero.Text;
                oVoluntario2.sComplemento = txtComplemento.Text;
                oVoluntario2.sBairro = txtBairro.Text;
                oVoluntario2.sCidade = txtCidade.Text;
                oVoluntario2.sEstadoProvincia = txtEstadoProvincia.Text;
                oVoluntario2.sPais =txtPais.Text;
                oVoluntario2.oDiasSemana = new List<int>();
                if(chkDiaDomingo.Checked)
                {
                    oVoluntario2.oDiasSemana.Add(1);
                }
                if(chkDiaSegunda.Checked)
                {
                    oVoluntario2.oDiasSemana.Add(2);
                }
                if(chkDiaTerca.Checked)
                {
                    oVoluntario2.oDiasSemana.Add(3);
                }
                if(chkDiaQuarta.Checked)
                {
                    oVoluntario2.oDiasSemana.Add(4);
                }
                if(chkDiaQuinta.Checked)
                {
                    oVoluntario2.oDiasSemana.Add(5);
                }
                if(chkDiaSexta.Checked)
                {
                    oVoluntario2.oDiasSemana.Add(6);
                }
                if(chkDiaSabado.Checked)
                {
                    oVoluntario2.oDiasSemana.Add(7);
                }
                
                return oVoluntario2;
            }
            else
            {
                return oVoluntario2;   
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (operacao == 1)
            {
                string foto = UpLoadFoto();
                if(!foto.Equals("null"))
                {
                    if(validaObrigatorios())
                    {
                        if(validaSeExiste() == false)
                        {
                            if(validaConsisData())
                            {
                                Voluntario oVl = new Voluntario();
                                oVl = carregaObjVoluntario(foto);
                                if(oVl != null)
                                {
                                    VoluntarioDAO oVld = new VoluntarioDAO();
                                    string varRet =oVld.inserirVoluntario(oVl);
                                    if(varRet.Equals("Cadastro eferuado com Sucesso."))
                                    {
                                        UsuarioDAO oUsd = new UsuarioDAO();
                                        int i = oUsd.CadUsuario(oVl.sEmail, oVl.sCpf, oVl.iTipoVoluntario);
                                        Response.Write(string.Format("<script>alert('Cadastro Efetuado, voce será redirecionado para a tela de voluntários.');window.location = 'voluntarios.aspx';</script>"));
                                    }
                                    else
                                    {
                                        Mensagem("Cadastro não realizado, por gentileza, verifique os campos preechidos e tente novamente.");
                                    }
                                }
                                else
                                {
                                    Mensagem("Cadastro não realizado, por gentileza, verifique os campos preechidos e tente novamente.");
                                }
                            }
                            else
                            {
                                Mensagem("Cadastro não realizado devido a inconsistencias entre as data de Adesão e Nacimento, por gentileza verificar.");
                            }
                        }
                        else
                        {
                            Mensagem("Cadastro não realizado devido a já existir um voluntário com o mesmo cpf cadastrado no sistema.");
                        }
                    }
                    else
                    {
                        Mensagem("Cadastro não realizado, todos os campos obrigatorios não foram preenchidos.");
                    }              
                }
                else
                {
                    Mensagem("Cadastro não realizado, devido a ausencia da foto.");
                }
               
            } 
            else if (operacao == 2)
            {
                if(validaObrigatorios())
                {
                    Voluntario oVl = new Voluntario();
                    oVl = carregaObjVoluntario(null);
                    if(oVl != null)
                    {
                        VoluntarioDAO oVld = new VoluntarioDAO();
                        string vRet = oVld.alterarVoluntario(oVl);
                        if(vRet.Equals("Alteração realizada com sucesso."))
                        {
                            Response.Write(string.Format("<script>alert('Cadasro Relizado com sucesso. Redirecionando para a tela de voluntarios ');window.location = 'voluntarios.aspx';</script>"));
                        }
                        else
                        {
                            Mensagem("Alteração não pode ser realizada, verifique os campos e tente novamente.");
                        }
                    }
                    else
                    {
                        Mensagem("Alteração não pode ser realizada, verifique os campos e tente novamente.");
                    }

                }
                else
                {
                    Mensagem("Alteração não pode ser realizada, verifique os campos e tente novamente.");
                }
            }
        }

        private void Mensagem(string msg)
        {
            Response.Write(string.Format("<script>alert('{0}');</script>", msg));
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("voluntarios.aspx");
        }
    }
}