using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;
using WebApplication5.classes_servicos;

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
                //CarregaDropDownList(oEv.iCodEvento);
                txtNomeEvento.Text = oEv.sNomeEvento;
                DateTime dateInicio = new DateTime();
                DateTime.TryParse(oEv.sDataInicio, out dateInicio);
                DateTime dateFim = new DateTime();
                DateTime.TryParse(oEv.sDataFim, out dateFim);
                txtDTinico.Text = dateInicio.ToString("yyyy-MM-dd");
                txtDtFim.Text = dateFim.ToString("yyyy-MM-dd");
                lblCodEve.Text = Convert.ToString(oEv.iCodEvento);
                string codAtv = ddwTipoVoluntario.DataValueField;
                SqlDataSource1.SelectCommand = string.Format("SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV, ATIVIDADE A, TIPO_VOLUNTARIO_x_ATIVIDADE TVA WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND V.CPF NOT IN(SELECT V.CPF FROM VOLUNTARIO V, EVENTO E, VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, ATIVIDADE_x_EVENTO AE, ATIVIDADE A WHERE V.CPF = VAE.VOLUNTARIO AND VAE.ATIVIDADE_x_EVENTO = AE.SEQUENCIAL AND AE.ATIVIDADE = A.COD_ATIVIDADE AND E.COD_EVENTO = AE.EVENTO AND E.COD_EVENTO = {0} AND A.COD_ATIVIDADE = {1}) AND TVA.ATIVIDADE = A.COD_ATIVIDADE AND TVA.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND A.COD_ATIVIDADE = {1}", oEv.iCodEvento, codAtv);
                SqlDataSource2.SelectCommand = string.Format("SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV, VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, ATIVIDADE A, EVENTO E, ATIVIDADE_x_EVENTO AE WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND VAE.VOLUNTARIO = V.CPF AND VAE.ATIVIDADE_x_EVENTO = AE.SEQUENCIAL AND AE.ATIVIDADE = A.COD_ATIVIDADE AND AE.EVENTO = E.COD_EVENTO AND E.COD_EVENTO = {0} AND A.COD_ATIVIDADE = {1}", oEv.iCodEvento, codAtv);
                SqlDataSource3.SelectCommand = string.Format("SELECT V.CPF, V.PRIMEIRO_NOME + ' ' + V.ULTIMO_NOME AS 'VOLUNTÁRIO', TV.NOME_TIPO_VOLUNTARIO FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV, VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, ATIVIDADE A, EVENTO E, ATIVIDADE_x_EVENTO AE WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND VAE.VOLUNTARIO = V.CPF AND VAE.ATIVIDADE_x_EVENTO = AE.SEQUENCIAL AND AE.ATIVIDADE = A.COD_ATIVIDADE AND AE.EVENTO = E.COD_EVENTO AND E.COD_EVENTO = {0} AND A.COD_ATIVIDADE = {1}",oEv.iCodEvento,codAtv);
                SqlDataSource4.SelectCommand = string.Format("SELECT A.COD_ATIVIDADE, A.NOME_ATIVIDADE, A.QTD_VOLUNTARIOS, A.QTD_MINUTOS, A.STATUS FROM ATIVIDADE A, EVENTO E, ATIVIDADE_x_EVENTO AE WHERE A.COD_ATIVIDADE = AE.ATIVIDADE AND E.COD_EVENTO = AE.EVENTO AND A.STATUS <> 'I' AND COD_EVENTO = {0} ", oEv.iCodEvento);
                CarregaDropDownListCordenador();
                //CarregaGridVolunDisponiveis(oEv.iCodEvento, ddwTipoVoluntario.DataValueField);
                //CarregaGridVolunAtribuidos(oEv.iCodEvento, ddwTipoVoluntario.DataValueField);

            }
            else
            {
                Response.Write(string.Format("<script>alert('Evento {0} não carregado');</script>", Convert.ToString(Session["evento"])));
            }

        }
        private int SequencialAtividade_Evento(string pAtividade,int pEvento)
        {
            int ret = 0;
            string strCmd = string.Format("SELECT AE.SEQUENCIAL FROM ATIVIDADE_x_EVENTO AE, ATIVIDADE A , EVENTO E WHERE A.COD_ATIVIDADE = AE.ATIVIDADE AND AE.EVENTO = E.COD_EVENTO AND E.COD_EVENTO = {0} AND A.COD_ATIVIDADE = {1}", pEvento, pAtividade);
            SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
            if (dr1.Read())
            {
                ret = Convert.ToInt32(dr1["SEQUENCIAL"]);
            }
            dr1.Close();
            return ret;
        }


        /*private void CarregaDropDownList(int pEvento)
        {
            string  strCmd = string.Format("SELECT A.COD_ATIVIDADE, A.NOME_ATIVIDADE, A.QTD_VOLUNTARIOS, A.QTD_MINUTOS, A.STATUS FROM ATIVIDADE A, EVENTO E, ATIVIDADE_x_EVENTO AE WHERE A.COD_ATIVIDADE = AE.ATIVIDADE AND E.COD_EVENTO = AE.EVENTO AND A.STATUS <> 'I' AND COD_EVENTO = {0} ", pEvento);
            SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
            if (dr1.HasRows)
            {
                ddwTipoVoluntario.DataSource = dr1;
                ddwTipoVoluntario.DataBind();
                dr1.Close(); 
            }
            else
            {
                dr1.Close();
                Response.Write(string.Format("<script>alert('Não há atividades vinculadas a esse evento. ');window.location = 'eventos.aspx';</script>"));
                
            }


        }*/

        private void CarregaDropDownListCordenador()
        {
            string strCms2 = string.Format("SELECT V.CPF, V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' FROM VOLUNTARIO V WHERE V.CPF IN(SELECT AE.CORDENADOR_ATIVIDADE FROM VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, ATIVIDADE_x_EVENTO AE, ATIVIDADE A, EVENTO E WHERE A.COD_ATIVIDADE = AE.ATIVIDADE AND E.COD_EVENTO = AE.EVENTO AND VAE.ATIVIDADE_x_EVENTO = AE.SEQUENCIAL AND A.COD_ATIVIDADE = {0} AND E.COD_EVENTO = {1})",ddwTipoVoluntario.DataTextField,lblCodEve.Text);
            try
            {
                SqlDataReader dr2 = SqlDB.Instancia.FazerSelect(strCms2);
                if (dr2.HasRows)
                {
                    txtCoodAtual.Text = Convert.ToString(dr2["VOLUNTÁRIO"]);
                    dr2.Close();
                }
                else
                {
                    txtCoodAtual.Text = "Não há um coordenador atribuido.";
                    dr2.Close();
                }
            }
            catch(Exception e)
            {
                Response.Write(string.Format("<script>alert('Erro {0}');</script>", e.Message));
            }
            /*string strCmd = string.Format("SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV, VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, ATIVIDADE A, EVENTO E, ATIVIDADE_x_EVENTO AE WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND VAE.VOLUNTARIO = V.CPF AND VAE.ATIVIDADE_x_EVENTO = AE.SEQUENCIAL AND AE.ATIVIDADE = A.COD_ATIVIDADE AND AE.EVENTO = E.COD_EVENTO AND E.COD_EVENTO = {0} AND A.COD_ATIVIDADE = {1}", lblCodEve.Text,ddwTipoVoluntario.DataValueField);
            
            try
            {
                SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
                if(dr1.HasRows)
                {
                    ddwCordenador.DataSource = dr1;
                    ddwCordenador.DataBind();
                    dr1.Close();
                }
                else
                {
                    dr1.Close();
                    Response.Write(string.Format("<script>alert('Não há voluntarios atribuidos a esta atividade.');</script>"));
                }
            }
            catch(Exception e)
            {
                Response.Write(string.Format("<script>alert('Erro {0}');</script>", e.Message));
                
            }*/
            
        }
        
        protected void btnAtribuir_Click(object sender, EventArgs e)
        {
            int varRet = 0;
            int coutRows = grwVolDispo.Rows.Count;
            int atv = SequencialAtividade_Evento(ddwTipoVoluntario.DataValueField,Convert.ToInt32(Session["evento"]));
            for (int i = 0; i < coutRows; i++)
            {
                CheckBox chk = (CheckBox)grwVolDispo.Rows[i].FindControl("CheckBox1");
                Label lblCpf = (Label)grwVolDispo.Rows[i].FindControl("Label1");
                if (chk.Checked)
                {
                    
                    EventoDAO oEdv = new EventoDAO();
                    int aux = oEdv.atribuirVoluntarioEvento(lblCpf.Text, Convert.ToInt32(lblCodEve.Text),atv.ToString());
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
            int atv = SequencialAtividade_Evento(ddwTipoVoluntario.DataValueField, Convert.ToInt32(Session["evento"]));
            int varRet = 0;
            int coutRows = grwVolAtr.Rows.Count;
            for (int i = 0; i < coutRows; i++)
            {
                CheckBox chk = (CheckBox)grwVolAtr.Rows[i].FindControl("CheckBox2");
                Label lblCpf = (Label)grwVolAtr.Rows[i].FindControl("Label1");
                if (chk.Checked)
                {
                    EventoDAO oEdv = new EventoDAO();
                    int aux = oEdv.desatribuirVolutarioEvento(lblCpf.Text, atv.ToString());
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


        protected void btnSalvarCordenador_Click(object sender, EventArgs e)
        {
            int atv = SequencialAtividade_Evento(ddwTipoVoluntario.DataValueField, Convert.ToInt32(Session["evento"]));
            string strCmd = string.Format("UPDATE ATIVIDADE_x_EVENTO SET CORDENADOR_ATIVIDADE = '{0}' WHERE SEQUENCIAL = {1}", ddwCordenador.DataValueField, atv);

            int auxRet = SqlDB.Instancia.FazerUpdate(strCmd);
            if (auxRet > 0)
            {
                Response.Write(string.Format("<script>alert('if Hows = {0}');", auxRet));
                //Response.Write(string.Format("<script>alert('Coordenador salvo.');window.location = 'atribuicaoVol.aspx';</script>"));
            }
            else
            {
                Response.Write(string.Format("<script>alert('Else Hows = {0}');", auxRet));
                //Response.Write(string.Format("<script>alert('Erro ao salvar coordenador.');window.location = 'atribuicaoVol.aspx';</script>"));
            }
        }

        protected void ddwTipoVoluntario_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = string.Format("SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV, ATIVIDADE A, TIPO_VOLUNTARIO_x_ATIVIDADE TVA WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND V.CPF NOT IN(SELECT V.CPF FROM VOLUNTARIO V, EVENTO E, VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, ATIVIDADE_x_EVENTO AE, ATIVIDADE A WHERE V.CPF = VAE.VOLUNTARIO AND VAE.ATIVIDADE_x_EVENTO = AE.SEQUENCIAL AND AE.ATIVIDADE = A.COD_ATIVIDADE AND E.COD_EVENTO = AE.EVENTO AND E.COD_EVENTO = {0} AND A.COD_ATIVIDADE = {1}) AND TVA.ATIVIDADE = A.COD_ATIVIDADE AND TVA.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND A.COD_ATIVIDADE = {1}", lblCodEve.Text,ddwTipoVoluntario.DataValueField.ToString());
            SqlDataSource2.SelectCommand = string.Format("SELECT V.CPF,V.PRIMEIRO_NOME +' '+V.ULTIMO_NOME AS 'VOLUNTÁRIO' , TV.NOME_TIPO_VOLUNTARIO FROM VOLUNTARIO V, TIPO_VOLUNTARIO TV, VOLUNTARIO_x_ATIVIDADE_x_EVENTO VAE, ATIVIDADE A, EVENTO E, ATIVIDADE_x_EVENTO AE WHERE V.TIPO_VOLUNTARIO = TV.COD_TIPO_VOLUNTARIO AND VAE.VOLUNTARIO = V.CPF AND VAE.ATIVIDADE_x_EVENTO = AE.SEQUENCIAL AND AE.ATIVIDADE = A.COD_ATIVIDADE AND AE.EVENTO = E.COD_EVENTO AND E.COD_EVENTO = {0} AND A.COD_ATIVIDADE = {1}", lblCodEve.Text, ddwTipoVoluntario.DataValueField.ToString());
            grwVolAtr.DataBind();
            grwVolDispo.DataBind();

        }
    }

}