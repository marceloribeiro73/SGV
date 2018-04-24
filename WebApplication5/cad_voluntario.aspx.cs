using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication.Classes;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class cad_voluntario : System.Web.UI.Page
    {
        int operacao = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["voluntario"] != null)
            {
                string aux = (string)Session["voluntario"];
                string strCmd = string.Format("SELECT V.CPF, V.PRIMEIRO_NOME, V.UTIMO_NOME,V.DATA_NASC, V.DOC_IDENTIFICACAO,V.TIPO_DOC_IDENTFICACAO, V.DATA_EMISSAO,V.NACIONALIDADE,V.TELEFONE_CONTATO,V.TELEFONE_CONTATO2, V.EMAIL, V.DATA_ADESAO, V.TIPO_VOLUNTARIO, E.COD_POSTAL,E.LOGRADOURO,E.NUMERO,E.COMPLEMENTO,E.BAIRO, E.CIDADE, E.ESTADO_PROVINCIA, E.PAIS FROM VOLUNTARIO V, ENDERECO e WHERE V.CPF = '{0}' AND V.CPF = E.CPF", aux);
                SqlDataReader dr = SqlDB.Instancia.FazerSelect(strCmd);
                Voluntario oVoluntario = null;
                if (dr.Read())
                {
                    oVoluntario = new Voluntario();
                    oVoluntario.iCpf = Convert.ToString(dr["CPF"]);
                    oVoluntario.sPrimeiroNome = Convert.ToString(dr["PRIMEIRO_NOME"]);
                    oVoluntario.sUltimoNome = Convert.ToString(dr["UTIMO_NOME"]);
                    oVoluntario.sDataNasc = Convert.ToString(dr["DATA_NASC"]);
                    oVoluntario.sDocIdentificacao = Convert.ToString(dr["DOC_IDENTIFICACAO"]);
                    oVoluntario.sTipoDocIdentificacao = Convert.ToString(dr["TIPO_DOC_IDENTFICACAO"]);
                    oVoluntario.sDataEmissao = Convert.ToString(dr["DATA_EMISSAO"]);
                    oVoluntario.sNacionalidade = Convert.ToString(dr["NACIONALIDADE"]);
                    oVoluntario.iTelefoneContato = Convert.ToString(dr["TELEFONE_CONTATO"]);
                    oVoluntario.iTelefoneContato2 = Convert.ToString(dr["TELEFONE_CONTATO2"]);
                    oVoluntario.sEmail = Convert.ToString(dr["EMAIL"]);
                    oVoluntario.sDataAdesao = Convert.ToString(dr["DATA_ADESAO"]);
                    oVoluntario.sTipoVoluntario = Convert.ToString(dr["TIPO_VOLUNTARIO"]);
                    oVoluntario.sCodPostal = Convert.ToString(dr["COD_POSTAL"]);
                    oVoluntario.sLogradouro = Convert.ToString(dr["LOGRADOURO"]);
                    oVoluntario.sLogradouro = Convert.ToString(dr["NUMERO"]);
                    oVoluntario.sComplemento = Convert.ToString(dr["COMPLEMENTO"]);
                    oVoluntario.sBairro = Convert.ToString(dr["BAIRO"]);
                    oVoluntario.sCidade = Convert.ToString(dr["CIDADE"]);
                    oVoluntario.sEstadoProvincia = Convert.ToString(dr["ESTADO_PROVINCIA"]);
                    oVoluntario.sPais = Convert.ToString(dr["PAIS"]);
                }
                if(oVoluntario != null)
                {
                    txtCpf.Text = Convert.ToString(oVoluntario.iCpf);
                    txtCpf.Enabled = false;
                    txtPrimeiroNome.Text = oVoluntario.sPrimeiroNome;
                    txtPrimeiroNome.Enabled = false;
                    txtUltimoNome.Text = oVoluntario.sUltimoNome;
                    txtUltimoNome.Enabled = false;
                    txtDataNasc.Text = oVoluntario.sDataNasc;
                    txtDataNasc.Enabled = false;
                    txtDocId.Text = oVoluntario.sDocIdentificacao;
                    txtDocId.Enabled = false;
                    txtDataEmmisaoDoc.Text = oVoluntario.sDataEmissao;
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
                    txtTel1.Text = Convert.ToString(oVoluntario.iTelefoneContato);
                    txtTel2.Text = Convert.ToString(oVoluntario.iTelefoneContato2);
                    txtEmail.Text = oVoluntario.sEmail;
                    txtDataAdesao.Text = oVoluntario.sDataAdesao;
                    txtDataAdesao.Enabled = false;
                    ddwTipoVoluntario.Text = oVoluntario.sTipoVoluntario;
                    upFoto.Enabled = false;
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
        private string upLoadFoto()
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
        
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (operacao == 1)
            {
                string foto = upLoadFoto();
                VoluntarioDAO oVld = new VoluntarioDAO();
                bool auxRet = oVld.inserirVoluntario(txtCpf.Text, txtPrimeiroNome.Text, txtUltimoNome.Text, txtDataNasc.Text, txtDocId.Text, ddwTipoDocID.Text, txtDataEmmisaoDoc.Text, txtNacionalidade.Text, txtTel1.Text, txtTel2.Text, txtEmail.Text, txtDataAdesao.Text, ddwTipoVoluntario.Text, txtCep.Text, txtLogradouro.Text, txtNumero.Text, txtComplemento.Text, txtBairro.Text, txtCidade.Text, txtEstadoProvincia.Text, txtPais.Text, foto.ToString());
                if (auxRet == true)
                {
                    Mensagem("Cadastro efetuado com sucesso!");
                    Response.Redirect("voluntarios.aspx");
                }
                else
                {
                    Mensagem("Cadastro não foi efetuado.");
                }
            } else if (operacao == 2)
            {
                string strCmd = string.Format("UPDATE VOLUNTARIO SET TELEFONE_CONTATO = '{0}', TELEFONE_CONTATO2 ='{1}',EMAIL='{2}', TIPO_VOLUNTARIO = {3} WHERE CPF = '{4}'", txtTel1.Text, txtTel2.Text, txtEmail.Text, ddwTipoVoluntario.Text, txtCpf);
                string strCmd2 = string.Format("UPDATE ENDERECO SET COD_POSTAL = '{0}', LOGRADOURO='{1}',NUMERO='{2}',COMPLEMENTO='{3}',BAIRO='{4}',CIDADE='{5}',ESTADO_PROVINCIA='{6}',PAIS='{7}' WHERE CPF = '{8}'", txtCep.Text, txtLogradouro.Text, txtNumero.Text, txtComplemento.Text, txtBairro.Text, txtCidade.Text, txtEstadoProvincia.Text, txtPais.Text, txtCpf.Text);
                int ret, ret2;
                ret = SqlDB.Instancia.FazerUpdate(strCmd);
                ret2 = SqlDB.Instancia.FazerUpdate(strCmd2);
                if(ret > 0 && ret2 > 0)
                {
                    Response.Write("<script>alert('Alteração Concluida');</script>");
                    Response.Redirect("voluntarios.apsx");
                }
                else
                {
                    Response.Write("<script>alert('Alteração não Efetuada');</script>");
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