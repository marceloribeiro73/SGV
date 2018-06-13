using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;

namespace WebApplication5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario oUs = (Usuario)Session["usuario"];
            Voluntario oVus = new Voluntario();
            VoluntarioDAO oVld = new VoluntarioDAO();
            oVus = oVld.buscarVoluntario(oUs.sVoluntario);
            carregaNomeVol(oVus);
            if(oUs.iTipoUsuario == 1)
            {
                panelAdmin.Visible = true;
                
            }    
        }

        protected void carregaNomeVol(Voluntario pVol)
        {
            lblUser.Text = string.Format("Bem vindo, {0} {1}",pVol.sPrimeiroNome,pVol.sUltimoNome);
        }

        protected void carregaPainelAdm()
        {

        }
    }
}