using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;

namespace WebApplication5
{
    public partial class atribuicaoVol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            EventoDAO oEvd = new EventoDAO();
            Evento oEv = new Evento();
            oEv = oEvd.BuscarEventoCod(Convert.ToString(Session["evento"]));
            if (!oEv.Equals(null))
            {
                txtNomeEvento.Text = oEv.sNomeEvento;
                DateTime dateInicio = new DateTime();
                DateTime.TryParse(oEv.sDataInicio, out dateInicio);
                DateTime dateFim = new DateTime();
                DateTime.TryParse(oEv.sDataFim, out dateFim);
                txtDTinico.Text = dateInicio.ToString("yyyy-MM-dd");
                txtDtFim.Text = dateFim.ToString("yyyy-MM-dd");
                lblCodEve.Text = Convert.ToString(oEv.iCodEvento);
                voldisponiveis.SelectCommand = string.Format("SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND V.CPF NOT IN(SELECT V.CPF FROM VOLUNTARIO V, EVENTO E, VOLUNTARIO_x_EVENTO VE WHERE V.CPF = VE.VOLUNTARIO AND VE.EVENTO = E.COD_EVENTO AND E.COD_EVENTO = {0})", oEv.iCodEvento);
                volAtribuidos.SelectCommand = string.Format("SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV, EVENTO E, VOLUNTARIO_x_EVENTO VE WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND V.CPF = VE.VOLUNTARIO AND E.COD_EVENTO = VE.EVENTO AND E.COD_EVENTO = '{0}'", oEv.iCodEvento);
                fonteatrvol.SelectCommand= string.Format("SELECT A.COD_ATIVIDADE, A.NOME_ATIVIDADE, A.QTD_VOLUNTARIOS, A.QTD_MINUTOS, A.STATUS FROM ATIVIDADE A, EVENTO E, ATIVIDADE_x_EVENTO AE WHERE A.COD_ATIVIDADE = AE.ATIVIDADE AND E.COD_EVENTO = AE.EVENTO AND A.STATUS <> 'I' AND COD_EVENTO = {0}", oEv.iCodEvento);

            }
            else
            {
                Response.Write(string.Format("<script>alert('Evento {0} não carregado');</script>", Convert.ToString(Session["evento"])));
            }

        }

        protected void btnAtribuir_Click(object sender, EventArgs e)
        {
            int varRet = 0;
            int coutRows = grwVolDispo.Rows.Count;
            for (int i = 0; i < coutRows; i++)
            {
                CheckBox chk = (CheckBox)grwVolDispo.Rows[i].FindControl("CheckBox1");
                Label lblCpf = (Label)grwVolDispo.Rows[i].FindControl("Label1");
                if (chk.Checked)
                {
                    EventoDAO oEdv = new EventoDAO();
                    int aux = oEdv.atribuirVoluntarioEvento(lblCpf.Text, Convert.ToInt32(lblCodEve.Text));
                    if (aux == 1)
                    {
                        varRet++;
                    }

                }
            }

            if (varRet > 0)
            {
                Response.Write(string.Format("<script>alert('Foram atribuidos {0} voluntários a este evento ');window.location = 'atribuicaoVol.aspx';</script>", varRet));
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("eventos.aspx");
        }

        protected void btnDesatribuir_Click(object sender, EventArgs e)
        {
            int varRet = 0;
            int coutRows = grwVolAtr.Rows.Count;
            for (int i = 0; i < coutRows; i++)
            {
                CheckBox chk = (CheckBox)grwVolAtr.Rows[i].FindControl("CheckBox2");
                Label lblCpf = (Label)grwVolAtr.Rows[i].FindControl("Label1");
                if (chk.Checked)
                {
                    EventoDAO oEdv = new EventoDAO();
                    int aux = oEdv.desatribuirVolutarioEvento(lblCpf.Text, Convert.ToInt32(lblCodEve.Text));
                    if (aux == 1)
                    {
                        varRet++;
                    }

                }
            }

            if (varRet > 0)
            {
                Response.Write(string.Format("<script>alert('Foram desatribuidos {0} voluntários a este evento ');window.location = 'atribuicaoVol.aspx';</script>", varRet));
            }
        }
    }

}