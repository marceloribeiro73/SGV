using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;

namespace WebApplication5
{
    public partial class ponto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario oUs = (Usuario)Session["usuario"];
            EVENTOS.SelectCommand = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO AS 'EVENTO', E.DATA_INICIO 'DATA DE INICIO', E.DATA_FIM AS 'DATA DE TERMINO', SA.NOME_STATUS AS 'STATUS' FROM EVENTO E, VOLUNTARIO_x_EVENTO VE, VOLUNTARIO V, STATUS_APP SA WHERE V.CPF = VE.VOLUNTARIO AND E.COD_EVENTO = VE.EVENTO AND SA.SIGLA_STATUS = VE.STATUS AND V.CPF = '{0}'", oUs.sVoluntario);
        }

        protected void btn_aceitar_evento_Click(object sender, EventArgs e)
        {
            Usuario oUs = new Usuario();
            oUs = (Usuario)Session["usuario"];
            int varRet = 0;
            int coutRows = grwEventos.Rows.Count;
            for (int i = 0; i < coutRows; i++)
            {
                CheckBox chk = (CheckBox)grwEventos.Rows[i].FindControl("CheckBox1");
                Label lblEvento = (Label)grwEventos.Rows[i].FindControl("Label2");
                if (chk.Checked)
                {
                    VoluntarioDAO oVld = new VoluntarioDAO();
                    int aux = oVld.aceitarEvento(oUs.sVoluntario, Convert.ToInt32(lblEvento.Text));
                    if (aux == 1)
                    {
                        Response.Write(string.Format("<script>alert('Evento Aceito.');window.location = 'ponto.aspx';</script>"));
                    }
                    else
                    {
                        Response.Write(string.Format("<script>alert('Erro ao aceitar evento.');window.location = 'ponto.aspx';</script>", varRet));
                    }

                }
            }
        }

        protected void btn_recusar_evento_Click(object sender, EventArgs e)
        {
            Usuario oUs = new Usuario();
            oUs = (Usuario)Session["usuario"];
            int varRet = 0;
            int coutRows = grwEventos.Rows.Count;
            for (int i = 0; i < coutRows; i++)
            {
                CheckBox chk = (CheckBox)grwEventos.Rows[i].FindControl("CheckBox1");
                Label lblEvento = (Label)grwEventos.Rows[i].FindControl("Label2");
                if (chk.Checked)
                {
                    VoluntarioDAO oVld = new VoluntarioDAO();
                    int aux = oVld.recusarEvento(oUs.sVoluntario, Convert.ToInt32(lblEvento.Text));
                    if (aux == 1)
                    {
                        Response.Write(string.Format("<script>alert('Evento Recusado.');window.location = 'ponto.aspx';</script>"));
                    }
                    else
                    {
                        Response.Write(string.Format("<script>alert('Erro ao reccusar evento.');window.location = 'ponto.aspx';</script>", varRet));
                    }

                }
            }
        }

        protected void btn_declarar_horas_Click(object sender, EventArgs e)
        {
            Usuario oUs = new Usuario();
            oUs = (Usuario)Session["usuario"];
            int varRet = 0;
            int coutRows = grwEventos.Rows.Count;
            for (int i = 0; i < coutRows; i++)
            {
                CheckBox chk = (CheckBox)grwEventos.Rows[i].FindControl("CheckBox1");
                Label lblEvento = (Label)grwEventos.Rows[i].FindControl("Label2");
                if (chk.Checked)
                {
                    Session["evento"] = lblEvento.Text;
                    Response.Redirect("declarar_ponto.aspx");
                }
            }
        }
    }
}