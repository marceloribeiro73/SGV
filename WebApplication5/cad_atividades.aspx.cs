using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.classes_servicos;
using WebApplication5.Classes;


namespace WebApplication5
{
    public partial class cad_atividades : System.Web.UI.Page
    {
        int operacao = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["atividade"] != null)
            {
                string strCmd = string.Format("SELECT NOME_ATIVIDADE, QTD_VOLUNTARIOS,QTD_MINUTOS FROM ATIVIDADE WHERE NOME_ATIVIDADE = '{0}' ", (string)Session["atividade"]);
                SqlDataReader dr = classes_servicos.SqlDB.Instancia.FazerSelect(strCmd);
                if (dr.Read())
                {
                    txtNome.Text = Convert.ToString(dr["NOME_ATIVIDADE"]);
                    txtQtd.Text = Convert.ToString(dr["QTD_VOLUNTARIOS"]);
                    txtMin.Text = Convert.ToString(dr["QTD_MINUTOS"]);
                    
                    txtNome.Enabled = false;
                    ddwTipoVoluntario.Enabled = false;
                    FonteTVNuvem.SelectCommand = string.Format("SELECT * FROM TIPO_VOLUNTARIO TV, ATIVIDADE A, TIPO_VOLUNTARIO_x_ATIVIDADE TVA WHERE TV.COD_TIPO_VOLUNTARIO = TVA.TIPO_VOLUNTARIO AND TVA.ATIVIDADE = A.COD_ATIVIDADE AND A.NOME_ATIVIDADE = '{0}'", txtNome.Text);

                    operacao = 2;
                }
            }
        }

        protected Atividade carregarObj()
        {
            Atividade oAtivi = null;
            if(!txtNome.Text.Equals(null))
            {
                oAtivi = new Atividade();
                oAtivi.sNome = txtNome.Text;
                oAtivi.iQtdVol = Convert.ToInt32(txtQtd.Text);
                oAtivi.iMedMin = Convert.ToInt32(txtMin.Text);
                oAtivi.sTipoVoluntario = Convert.ToString(ddwTipoVoluntario.Text);
                
                return oAtivi;
            }
            else
            {
                return oAtivi;
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (operacao == 1)
            {
                Atividade oAt = new Atividade();
                oAt = carregarObj();
                AtividadeDAO oAtd = new AtividadeDAO();
                Response.Write(string.Format("<script>alert('{0}.')</script>",oAt.sTipoVoluntario));
                int aux = oAtd.inserirAtividade(oAt);
                if(aux == 6)
                {
                    Response.Write("<script>alert('Inclusão não efetuada, atividade já cadastrada no sistema.')</script>");
                }
                else if(aux == 1)
                {
                    Response.Write(string.Format("<script>alert('Inclusão efetuada, redirecionando para a tela de Atividades.');window.location = 'atividades.aspx';</script>"));
                }
                else if(aux == 4)
                {
                    Response.Write("<script>alert('Inclusão não efetuada, campo quantidade de voluntários não foi preenchido.')</script>");
                }
                else if(aux == 5)
                {
                    Response.Write("<script>alert('Inclusão não efetuada, campo nome não foi preechido.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Inclusão não efetuada, erro ao efetuar cadastro.')</script>");
                }
            }
            else
            {
                string strCmd = string.Format("UPDATE ATIVIDADE SET QTD_VOLUNTARIOS = {0},QTD_MINUTOS = {1} WHERE NOME_ATIVIDADE = '{2}'", txtQtd.Text, txtMin.Text, txtNome.Text);
                int ret = SqlDB.Instancia.FazerUpdate(strCmd);
                if (ret > 0)
                {
                    Response.Write(string.Format("<script>alert('Alteração efetuada, redirecionando para a tela de Ativivdades.');window.location = 'atividades.aspx';</script>"));
                }
                else
                {
                    Response.Write("<script>alert('Alteração não Efetuada');</script>");
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("atividades.aspx");
        }
    }
}