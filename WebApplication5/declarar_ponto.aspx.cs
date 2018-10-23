using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;

namespace WebApplication5
{
    public partial class declarar_ponto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Evento oEv = new Evento();
            EventoDAO oEvd = new EventoDAO();
            oEv = oEvd.BuscarEventoCod(Convert.ToString(Session["evento"]));
            txt_decla_evento.Text = oEv.sNomeEvento;
            lblCod.Text = Convert.ToString(oEv.iCodEvento);
        }

        protected void btn_decla_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btn_decla_salvar_Click(object sender, EventArgs e)
        {
            if(int.Parse(txt_decla_horas.Text) <= 8)
            {
                Usuario oUs = new Usuario();
                oUs = (Usuario)Session["usuario"];
                DateTime dataDecla = new DateTime();
                DateTime.TryParse(txtData.Text, out dataDecla);
                VoluntarioDAO oVld = new VoluntarioDAO();
                int aux = oVld.DeclararHoras(Convert.ToInt32(lblCod.Text), oUs.sVoluntario, Convert.ToInt32(txt_decla_horas.Text), dataDecla);
                if(aux > 0)
                {
                    Response.Write(string.Format("<script>alert('Declaração Efetuada, voce será redirecionado para a tela de ponto');window.location = 'ponto.aspx';</script>"));
                }
                else
                {
                    Response.Write(string.Format("<script>alert('Erro ao declarar')</script>"));
                }
            }
        }
    }
}