using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class tipo_atividade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_tp_Atividade_incluir_Click(object sender, EventArgs e)
        {
            lbn_tp_Atvidade.Enabled = true;
            txt_tp_Atividade.Enabled = true;

            lbn_descricao_atividade.Enabled = true;
            txt_descricao_atividade.Enabled = true;

            btn_salvar_cad_tp_Atividade.Enabled = true;
            btn_cancelar_cad_tp_Atividade.Enabled = true;
        }

        protected void btn_cancelar_cad_tp_Atividade_Click(object sender, EventArgs e)
        {
            lbn_tp_Atvidade.Enabled = false;
            txt_tp_Atividade.Enabled = false;
            txt_tp_Atividade.Text = "";

            lbn_descricao_atividade.Enabled = false;
            txt_descricao_atividade.Enabled = false;
            txt_descricao_atividade.Text = "";

            btn_salvar_cad_tp_Atividade.Enabled = false;
            btn_cancelar_cad_tp_Atividade.Enabled = false;
        }
    }
}