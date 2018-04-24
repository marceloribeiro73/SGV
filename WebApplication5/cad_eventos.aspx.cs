using System;
using System.Data.SqlClient;
using System.Linq;
using WebApplication.Classes;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class cad_eventos : System.Web.UI.Page
    {
        int operacao = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["evento"] != null)
            {
                string aux = (string)Session["evento"];
                string strCmd = string.Format("SELECT COD_EVENTO,NOME_EVENTO,DATA_INICIO,DATA_FIM,ENDERECO,TIPO_EVENTO FROM EVENTO WHERE COD_EVENTO = {0} ", aux);
                SqlDataReader dr = classes_servicos.SqlDB.Instancia.FazerSelect(strCmd);
                Evento oEvento = null;
                if (dr.Read())
                {
                    oEvento = new Evento();
                    oEvento.iCodEvento = Convert.ToInt32(dr["COD_EVENTO"]);
                    oEvento.sNomeEvento = Convert.ToString(dr["NOME_EVENTO"]);
                    oEvento.sDataInicio = Convert.ToString(dr["DATA_INICIO"]);
                    oEvento.sDataFim = Convert.ToString(dr["DATA_FIM"]);
                    oEvento.sEndereco = Convert.ToString(dr["ENDERECO"]);
                    oEvento.iTipoEvento = Convert.ToInt32(dr["TIPO_EVENTO"]);

                }
                if(oEvento != null)
                {
                    txtNomeEvento.Text = oEvento.sNomeEvento;
                    txtNomeEvento.Enabled = false;
                    txtDataInicio.Text = oEvento.sDataInicio;
                    txtDataFim.Text = oEvento.sDataFim;
                    txtEndereco.Text = oEvento.sEndereco;
                    ddlTipoEvento.Text = Convert.ToString(oEvento.iTipoEvento);
                    ddlTipoEvento.Enabled = false;
                    operacao = 2;
                }
            }
        }

        private bool validaObrigatorio()
        {
           if((txtNomeEvento.Text != string.Empty && txtNomeEvento.Text.Length >0) || (txtDataInicio.Text != string.Empty && txtDataInicio.Text.All(char.IsDigit)) || (txtDataFim.Text != string.Empty && txtDataFim.Text.All(char.IsDigit)))
           {
                return true;
           }
           else
           {
                return false;
           }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (operacao ==1)
            {
                bool bObrPreenchidos = validaObrigatorio();
                if (bObrPreenchidos != true)
                {
                    lblAlerta.Text = "Campos obrigatorios não foram preenchidos, para continuar, preencha todos os campos obrigatorios!";
                    lblAlerta.Visible = true;
                }
                else
                {
                    EventoDAO oEvd = new EventoDAO();
                    bool auxRet = oEvd.inserirEvento(txtNomeEvento.Text, txtDataInicio.Text, txtDataFim.Text, Convert.ToInt32(ddlTipoEvento.Text), txtEndereco.Text);
                    if (auxRet == true)
                    {
                        Response.Write("<script>alert('Cadastro Efetuado');</script>");
                        Response.Redirect("eventos.apsx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Cadastro não Efetuado');</script>");
                    }

                }
            }
            else
            {
                string strCmd = string.Format("UPDATE EVENTO SET DATA_INICIO = '{0}', DATA_FIM = '{1}', ENDERECO = '{2}' WHERE NOME_EVENTO = '{3}'", txtDataInicio.Text, txtDataFim.Text, txtEndereco.Text, txtNomeEvento.Text);
                int ret =SqlDB.Instancia.FazerUpdate(strCmd);
                if(ret > 0)
                {
                    Response.Write("<script>alert('Alteração Concluida');</script>");
                    Response.Redirect("eventos.apsx");
                }
                else
                {
                    Response.Write("<script>alert('Alteração não Efetuada');</script>");
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("eventos.aspx");
        }
    }
}