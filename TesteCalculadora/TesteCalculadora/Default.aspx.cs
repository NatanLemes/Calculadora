using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TesteCalculadora
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNumero_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            txtDisplay.Text += button.Text;
            btnAdd.Enabled= true;
            btnDivisao.Enabled= true;
            btnSubtracao.Enabled= true;
            btnMultiplicacao.Enabled= true;
        }

        protected void btnOperacao_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            ViewState["Operacao"] = button.Text;
            ViewState["PrimeiroNumero"] = txtDisplay.Text;
            txtDisplay.Text = string.Empty;
        }

        protected void btnResult_Click(object sender, EventArgs e)
        {
            
            double primeiroNumero = Convert.ToDouble(ViewState["PrimeiroNumero"]);
            double secondNumber = Convert.ToDouble(txtDisplay.Text);
            string operacao = ViewState["Operacao"].ToString();
            double result = 0;

            switch (operacao)
            {
                case "+":
                    result = primeiroNumero + secondNumber;
                    break;
                case "-":
                    result = primeiroNumero - secondNumber;
                    break;
                case "*":
                    result = primeiroNumero * secondNumber;
                    break;
                case "/":
                    result = primeiroNumero / secondNumber;
                    break;
            }
            txtDisplay.Text = result.ToString();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = string.Empty;
            ViewState["PrimeiroNumero"] = null;
            ViewState["Operacao"] = null;
        }

        protected void apagaUmCaract_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtDisplay.Text))
                txtDisplay.Text = "";
            else
                txtDisplay.Text = txtDisplay.Text.Substring(0, txtDisplay.Text.Length - 1) ?? "";
        }
        protected void btnPonto_Click(object sender, EventArgs e)
        {
            
            if (string.IsNullOrEmpty(txtDisplay.Text)) //se n tiver numero, add o zero a esquerda
            {
                txtDisplay.Text = "0,";
                btnAdd.Enabled = false;
                btnDivisao.Enabled = false;
                btnSubtracao.Enabled = false;
                btnMultiplicacao.Enabled = false;
            }
            else if (!txtDisplay.Text.Contains(","))//se ja tiver virgula, nao pode add mais
                txtDisplay.Text += ",";
        }
    }
}