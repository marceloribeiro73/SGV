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
            
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario oUs = usuarioDAO.BuscarUsuario("20132467801"); //(Usuario)Session["usuario"];
            if(!oUs.Equals(null))
            {
                SqlDataSource1.SelectCommand = string.Format("SELECT E.NOME_EVENTO, A.NOME_ATIVIDADE, VAE.DATA_DECLARADA, VAE.QUANTIDADE_HORAS_DELCARADA, VAE.DATA_DECLARACAO, VAE.STATUS_DECLARACAO FROM VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, VOLUNTARIO V, ATIVIDADE_x_EVENTO AE, ATIVIDADE A, EVENTO E WHERE E.COD_EVENTO = AE.EVENTO AND A.COD_ATIVIDADE = AE.ATIVIDADE AND AE.SEQUENCIAL = VAE.ATIVIDADE_x_EVENTO AND VAE.VOLUNTARIO = V.CPF AND V.CPF = '{0}'",oUs.sVoluntario.ToString());
                SqlDataSource2.SelectCommand = string.Format("SELECT AE.SEQUENCIAL,E.NOME_EVENTO, A.NOME_ATIVIDADE, VAE.STATUS, VAE.QUANTIDADE_HORAS_DELCARADA FROM EVENTO E, ATIVIDADE A, ATIVIDADE_x_EVENTO AE, VOLUNTARIO V, VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE WHERE E.COD_EVENTO = AE.EVENTO AND A.COD_ATIVIDADE = AE.ATIVIDADE AND AE.SEQUENCIAL = VAE.ATIVIDADE_x_EVENTO AND V.CPF = VAE.VOLUNTARIO AND V.CPF = '{0}'", oUs.sVoluntario.ToString());
            }
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
                Label lblEvento = (Label)grwEventos.Rows[i].FindControl("Label1");
                if (chk.Checked)
                {
                    VoluntarioDAO oVld = new VoluntarioDAO();
                    int aux = oVld.AceitarEvento(oUs.sVoluntario, Convert.ToInt32(lblEvento.Text));
                    if (aux == 1)
                    {
                        Response.Write(string.Format("<script>alert('Evento Aceito.');window.location = 'ponto.aspx';</script>"));
                    }
                    else
                    {
                        Response.Write(string.Format("<script>alert('Erro ao aceitar evento.');window.location = 'ponto.aspx';</script>"));
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
                    int aux = oVld.RecusarEvento(oUs.sVoluntario, Convert.ToInt32(lblEvento.Text));
                    if (aux == 1)
                    {
                        Response.Write(string.Format("<script>alert('Evento Recusado.');window.location = 'ponto.aspx';</script>"));
                    }
                    else
                    {
                        Response.Write(string.Format("<script>alert('Erro ao reccusar evento.');window.location = 'ponto.aspx';</script>"));
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
                Label lblEvento = (Label)grwEventos.Rows[i].FindControl("Label1");
                if (chk.Checked)
                {
                    Session["evento"] = lblEvento.Text;
                    Response.Redirect("declarar_ponto.aspx");
                }
            }
        }

        
    }
}