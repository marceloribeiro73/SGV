using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario oUs = (Usuario)Session["usuario"];
            Voluntario oVus = new Voluntario();
            VoluntarioDAO oVld = new VoluntarioDAO();
            oVus = oVld.BuscarVoluntario(oUs.sVoluntario);
            carregaNomeVol(oVus);
            carregaPainelUser(oUs.sVoluntario);
            if(oUs.iTipoUsuario == 1)
            {
                panelAdmin.Visible = true;
                carregaPainelAdm();
                
            }    
        }

        protected void carregaNomeVol(Voluntario pVol)
        {
            lblCab.Text = string.Format("Bem vindo, {0} {1}",pVol.sPrimeiroNome,pVol.sUltimoNome);
        }

        protected void carregaPainelAdm()
        {
            Notificacoes oNoti = new Notificacoes();
            lblVolCad.Text =Convert.ToString(oNoti.adminPendenciasVolunatrio());
            lblVolBloq.Text = Convert.ToString(oNoti.adminUserBloq());
            lblVolBloq.Visible = true;
            lblVolCad.Visible = true;
            aVoluntarios.Visible = true;
            aUserBlq.Visible = true;
        }

        protected void carregaPainelUser(string pCpf)
        {
            Notificacoes oNoti = new Notificacoes();
            lblVolAcepEve.Text = Convert.ToString(oNoti.userPendentesAceitacao(pCpf));
            lblVolAcepEve.Visible = true;
            lblHoraTrab.Text = Convert.ToString(oNoti.userPendentesDeclaracao(pCpf));
            lblHoraTrab.Visible = true;
            aAceptEve.Visible =true;
            aDeclEve.Visible = true;
        }
    }
}