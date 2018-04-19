using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class eventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //grwEventos.DataBind();
        }

        protected void btnIncluirEvento_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_eventos.aspx");
        }

        protected void btnInativar_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Mama mia fora ." + grwEventos.Rows.Count + " ');</script>");
            int aux = grwEventos.Rows.Count;
            for (int cont = 0; cont <  aux; cont++)
            {
                Response.Write("<script>alert('Mama mia ."+ grwEventos.Rows.Count+" ');</script>");
                string strCmd = null;
                CheckBox check = (CheckBox)grwEventos.Rows[cont].FindControl("CheckBox1");
                Label lbCod = (Label)grwEventos.Rows[cont].FindControl("Label1");
                Label lbStat = (Label)grwEventos.Rows[cont].FindControl("label2");
                if (check.Checked == true)
                {
                    if (lbStat.Text.Equals("A"))
                    {
                        strCmd = string.Format("UPDATE EVENTO SET STATUS = 'I' WHERE COD_EVENTO = {0}", lbCod.Text);
                    }else if (lbStat.Text.Equals("I"))
                    {
                        strCmd = string.Format("UPDATE EVENTO SET STATUS = 'A' WHERE COD_EVENTO = {0}", lbCod.Text);
                    }
                    else
                    {
                        strCmd = null;
                    }
                    if(strCmd != null)
                    {
                        SqlDB.Instancia.FazerUpdate(strCmd);
                        Response.Write("<script>alert('Status Alterado');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Status não pode ser alterado.');</script>");
                    }
                }
            }
           
        }
    }
}