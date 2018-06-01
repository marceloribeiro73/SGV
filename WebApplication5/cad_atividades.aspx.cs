using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class cad_atividades : System.Web.UI.Page
    {
        int operacao = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["atividade"] != null)
            {
                string strCmd = string.Format("SELECT NOME_ATIVIDADE, QTD_VOLUNTARIOS,DURACAO_MEDIA_MINUTOS,TIPO_ATIVIDADE WHERE NOME_ATIVIDADE = '{0}' ", (string)Session["atividade"]);
                SqlDataReader dr = classes_servicos.SqlDB.Instancia.FazerSelect(strCmd);
                if (dr.Read())
                {
                    txtNome.Text = Convert.ToString(dr["NOME_ATIVIDADE"]);
                    txtQtd.Text = Convert.ToString(dr["QTD_VOLUNTARIOS"]);
                    txtMin.Text = Convert.ToString(dr["DURACAO_MEDIA_MINUTOS"]);
                    //DropDownList1.Text = Convert.ToString(dr["TIPO_ATIVIDADE"]);
                    txtNome.Enabled = false;
                    //DropDownList1.Enabled = false;
                    operacao = 2;
                }
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (operacao == 1)
            {
                SqlCommand comando = new SqlCommand("[dbo].[sp_sgv_incluir_atividades]", SqlDB.Instancia.Connection);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add(new SqlParameter("@nome", SqlDbType.VarChar)).Value = txtNome.Text;
                comando.Parameters.Add(new SqlParameter("@qtd", SqlDbType.Int)).Value = txtQtd.Text;
                comando.Parameters.Add(new SqlParameter("@duraca", SqlDbType.Int)).Value = txtMin.Text;
                //comando.Parameters.Add(new SqlParameter("@tipo", SqlDbType.Int)).Value = DropDownList1.Text;
                int ret = comando.ExecuteNonQuery();
                if(ret > 0)
                {
                    Response.Write("<script>alert('Cadastro Efetuado');</script>");
                    Response.Redirect("atividades.apsx");
                }
                else
                {
                    Response.Write("<script>alert('Cadastro não Efetuado');</script>");
                }
            }
            else
            {
                string strCmd = string.Format("UPDATE ATIVIDADE SET QTD_VOLUNTARIOS = {0},DURACAO_MEDIA_MINUTOS = {1} WHERE NOME_ATIVIDADE = `'{2}'", txtQtd.Text, txtMin.Text, txtNome.Text);
                int ret = SqlDB.Instancia.FazerUpdate(strCmd);
                if (ret > 0)
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
            Response.Redirect("atividades.aspx");
        }
    }
}