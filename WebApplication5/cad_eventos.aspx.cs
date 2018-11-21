using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;
using WebApplication5.Classes;
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
                    DateTime dInicio = new DateTime();
                    DateTime dFim = new DateTime();
                    DateTime.TryParse(oEvento.sDataInicio, out dInicio);
                    DateTime.TryParse(oEvento.sDataFim, out dFim);
                    txtNomeEvento.Text = oEvento.sNomeEvento;
                    txtNomeEvento.Enabled = false;
                    txtDataInicio.Text = dInicio.ToString("yyyy-MM-dd");
                    txtDataFim.Text = dFim.ToString("yyyy-MM-dd");
                    txtEndereco.Text = oEvento.sEndereco;
                    ddlTipoEvento.Text = Convert.ToString(oEvento.iTipoEvento);
                    ddlTipoEvento.Enabled = false;
                    string strCmd3 = string.Format("SELECT ATIVIDADE FROM ATIVIDADE_x_EVENTO WHERE EVENTO = {0} ", oEvento.iCodEvento);
                    SqlDataReader dr2 = SqlDB.Instancia.FazerSelect(strCmd);
                    while(dr2.Read())
                    {
                        int aux1 = grvAtividade.Rows.Count;
                        for(int i = 0; i < aux1; i++)
                        {

                        }
                    }
                    operacao = 2;
                }
            }
        }

        private bool validaObrigatorio()
        {
           if((txtNomeEvento.Text != string.Empty || txtNomeEvento.Text.Length >0) || (txtDataInicio.Text != string.Empty || txtDataInicio.Text.All(char.IsDigit)) || (txtDataFim.Text != string.Empty || txtDataFim.Text.All(char.IsDigit)))
           {
                return true;
           }
           else
           {
                return false;
           }
        }

        protected bool validaSeExiste()
        {
            string sEvent = txtNomeEvento.Text;
            string strCmd = string.Format("SELECT NOME_EVENTO FROM EVENTO WHERE NOME_EVENTO = '{0}'", sEvent);
            SqlDataReader dr = SqlDB.Instancia.FazerSelect(strCmd);
            if(dr.Read())
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

        protected bool validaConsisData()
        {
            DateTime dInicio = new DateTime();
            DateTime dFim = new DateTime();
            if(DateTime.TryParse(txtDataInicio.Text, out dInicio))
            {
                if(DateTime.TryParse(txtDataFim.Text, out dFim))
                {
                    if(dFim.Date >= dInicio.Date)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }

            
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (operacao == 1)
            {
                bool bObrPreenchidos = validaObrigatorio();
                if (bObrPreenchidos != true)
                {
                    lblAlerta.Text = "Campos obrigatorios não foram preenchidos, para continuar, preencha todos os campos obrigatorios.";
                    lblAlerta.Visible = true;
                }
                else
                {
                    bool bExisteEvento = validaSeExiste();
                    if(bExisteEvento != true)
                    {
                        bool bDataConsistente = validaConsisData();
                        if(bDataConsistente == true)
                        {
                            EventoDAO oEvd = new EventoDAO();
                            bool auxRet = oEvd.inserirEvento(txtNomeEvento.Text, txtDataInicio.Text, txtDataFim.Text, Convert.ToInt32(ddlTipoEvento.Text), txtEndereco.Text);
                            if (auxRet == true)
                            {
                                string strCmdCod = string.Format("SELECT COD_EVENTO FROM EVENTO WHERE NOME_EVENTO = '{0}'", txtNomeEvento.Text);
                                SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmdCod);
                                int iCodEvento = 0;
                                if (dr1.Read())
                                {
                                    iCodEvento = Convert.ToInt32(dr1["COD_EVENTO"]);
                                }
                                dr1.Close();
                                int aux = grvAtividade.Rows.Count;
                                for(int cont = 0; cont < aux; cont++)
                                {
                                    CheckBox checkAtivi = (CheckBox)grvAtividade.Rows[cont].FindControl("CheckBox1");
                                    Label lblAtivi = (Label)grvAtividade.Rows[cont].FindControl("label2");
                                    if(checkAtivi.Checked == true)
                                    {
                                        string strCmd = string.Format("INSERT INTO ATIVIDADE_x_EVENTO VALUES ({0},{1},null)", lblAtivi.Text, iCodEvento);
                                        int inu = SqlDB.Instancia.FazerUpdate(strCmd);
                                    }
                                }
                                Response.Write(string.Format("<script>alert('Cadastro Efetuado, voce será redirecionado para a tela de eventos.');window.location = 'eventos.aspx';</script>"));

                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Cadastro não efetuado, data de fim menor que a data de inicio.');</script>");
                        }
                    }
                    else
                    {
                            Response.Write("<script>alert('Cadastro não efetuado, já existe um evento com o mesmo nome.');</script>");
                    }
                }
            }
            else
            {
                string strCmd = string.Format("UPDATE EVENTO SET DATA_INICIO = '{0}', DATA_FIM = '{1}', ENDERECO = '{2}' WHERE NOME_EVENTO = '{3}'", txtDataInicio.Text, txtDataFim.Text, txtEndereco.Text, txtNomeEvento.Text);
                int ret =SqlDB.Instancia.FazerUpdate(strCmd);
                if(ret > 0)
                {
                    Response.Write(string.Format("<script>alert('Cadastro Efetuado, voce será redirecionado para a tela de eventos.');window.location = 'eventos.aspx';</script>"));
                }
                else
                {
                    Response.Write("<script>alert('Alteração não Efetuada.');</script>");
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/eventos.apsx");
        }
    }
}