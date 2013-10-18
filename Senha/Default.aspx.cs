using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Senha
{
    public partial class Default : System.Web.UI.Page
    {
        List<String> sorteadas = new List<String>();
        String[] todasCores = new String[6];
        List<int> tentativa = new List<int>();

        int linhaCount = 1; //Indica em qual linha estou atuando.
        int posicaoCount = 1; //Indica em qual imagem eu estou definindo a cor, matriz 4 colunas por 10 linhas.
        int jogadas = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Definindo as opções
            todasCores[0] = "./img/blue.png";
            todasCores[1] = "./img/green.png";
            todasCores[2] = "./img/orange.png";
            todasCores[3] = "./img/red.png";
            todasCores[4] = "./img/yellow.png";
            todasCores[5] = "./img/purple.png";

            //Mostrando as opções
            ImageButton1.ImageUrl = todasCores[0];
            ImageButton2.ImageUrl = todasCores[1];
            ImageButton3.ImageUrl = todasCores[2];
            ImageButton4.ImageUrl = todasCores[3];
            ImageButton5.ImageUrl = todasCores[4];
            ImageButton6.ImageUrl = todasCores[5];

            if (Session.IsNewSession)
            {
                Session["linhaCount"] = linhaCount;
                Session["posicaoCount"] = posicaoCount;

                Session["tentativa"] = tentativa;
                Session["jogadas"] = jogadas;
                Sortear();
            }
            else
            {
                linhaCount = int.Parse(Session["linhaCount"].ToString());
                posicaoCount = int.Parse(Session["posicaoCount"].ToString());
                sorteadas = (List<String>)Session["sorteadas"];
            }
        }

        protected void btnNovoJogo_Click(object sender, EventArgs e)
        {
            LimparCores();
            Button btnVerificar = (Button)FindControl("btnVerificar");
            btnVerificar.Enabled = false;
            // Reseta valores
            linhaCount = 1;
            posicaoCount = 1;
            Session["linhaCount"] = linhaCount;
            Session["posicaoCount"] = posicaoCount;
            Session["jogadas"] = 0;
            
            Sortear();
        }

        private void LimparCores()
        {
            for (int i = 1; i <= 40; i++)
            {
                ImageButton ib = (ImageButton)FindControl("ib" + i.ToString());
                ib.ImageUrl = "./img/empty.png";
            }
        }

        private void Sortear()
        {
            sorteadas.Clear();
            //Random r = new Random();
            //for (int i = 0; i < 4; i++)
            //{
            //    sorteadas.Add(todasCores[r.Next(0, 5)]);
            //}
            sorteadas.Add(todasCores[0]);
            sorteadas.Add(todasCores[1]);
            sorteadas.Add(todasCores[2]);
            sorteadas.Add(todasCores[3]);
            Session["sorteadas"] = sorteadas;
        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            //Objeto que enviou o comando
            ImageButton btn = (ImageButton)sender;

            //Busco o imagebutton que vou alterar
            ImageButton ib = (ImageButton)FindControl("ib" + posicaoCount.ToString());
            Button btnVerificar = (Button)FindControl("btnVerificar");
            if (btnVerificar.Enabled == false)
            {
                //Defino a mesma cor do botão que disparou o click
                ib.ImageUrl = btn.ImageUrl;

                //A cada 4 cores escolhidas, somo uma linha
                if ((posicaoCount % 4) == 0)
                {
                    linhaCount = linhaCount + 1;
                    Session["linhaCount"] = linhaCount;
                    // Button btnVerificar = (Button)FindControl("btnVerificar");
                    btnVerificar.Enabled = true;
                }
                else
                {
                    btnVerificar.Enabled = false;
                }

                posicaoCount = posicaoCount + 1;
                Session["posicaoCount"] = posicaoCount;
            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            int posicaoTentativa = 3;
            int posicoesCorretas = 0;
            List<String> copiaSorteadas = CriarCopiaSorteio();
            jogadas = int.Parse(Session["jogadas"].ToString());
            jogadas++;
            Session["jogadas"] = jogadas;

            PlaceHolder ph = (PlaceHolder)FindControl("ph" + (linhaCount - 1).ToString());
            for (int i = (linhaCount - 1) * 4; i > ((linhaCount - 1) * 4) - 4; i--)
            {
                ImageButton ib = (ImageButton)FindControl("ib" + i.ToString());

                //se tem uma cor na posicao certa
                if (sorteadas.ElementAt(posicaoTentativa) == ib.ImageUrl)
                {
                    System.Web.UI.WebControls.Image imgAcerto = new System.Web.UI.WebControls.Image();
                    imgAcerto.ImageUrl = "./img/result-black.png";
                    ph.Controls.Add(imgAcerto);
                    copiaSorteadas[posicaoTentativa] = "";
                    posicoesCorretas++;
                }
                posicaoTentativa--;
            }

            posicaoTentativa = 3;
            for (int i = (linhaCount - 1) * 4; i > ((linhaCount - 1) * 4) - 4; i--)
            {
                ImageButton ib = (ImageButton)FindControl("ib" + i.ToString());

                //se tem uma cor certa na posicao errada
                if (copiaSorteadas.Contains(ib.ImageUrl))
                {
                    System.Web.UI.WebControls.Image imgAcerto = new System.Web.UI.WebControls.Image();
                    imgAcerto.ImageUrl = "./img/result-white.png";
                    ph.Controls.Add(imgAcerto);
                }
                posicaoTentativa--;
            }

            //Se acertou as quatro posições
            if ((posicoesCorretas == 4) || (jogadas == 10 & posicoesCorretas < 4))
            {
                PlaceHolder phRes = (PlaceHolder)FindControl("phResultado");
                System.Web.UI.WebControls.Image img1 = new System.Web.UI.WebControls.Image();
                System.Web.UI.WebControls.Image img2 = new System.Web.UI.WebControls.Image();
                System.Web.UI.WebControls.Image img3 = new System.Web.UI.WebControls.Image();
                System.Web.UI.WebControls.Image img4 = new System.Web.UI.WebControls.Image();
                System.Web.UI.WebControls.Image img5 = new System.Web.UI.WebControls.Image();
                img1.ImageUrl = sorteadas.ElementAt(0);
                img2.ImageUrl = sorteadas.ElementAt(1);
                img3.ImageUrl = sorteadas.ElementAt(2);
                img4.ImageUrl = sorteadas.ElementAt(3);
                System.Web.UI.WebControls.Label lbl1 = new Label();
                if (posicoesCorretas == 4)
                {
                    img5.ImageUrl = "./img/Check.png";
                    lbl1.Text = "Você venceu!";
                }
                else
                {
                    img5.ImageUrl = "./img/DeleteRed.png";
                    lbl1.Text = "Tente novamente!";
                }

                phRes.Controls.Add(img1);
                phRes.Controls.Add(img2);
                phRes.Controls.Add(img3);
                phRes.Controls.Add(img4);
                phRes.Controls.Add(img5);
                phRes.Controls.Add(lbl1);
                //Button btnVerificar = (Button)FindControl("btnVerificar");
                //btnVerificar.Enabled = false;
            }
            Button btnVerificar = (Button)FindControl("btnVerificar");
            btnVerificar.Enabled = false;
        }

        private List<String> CriarCopiaSorteio()
        {
            List<String> copiaSorteadas = new List<string>();
            copiaSorteadas.Add(sorteadas[0]);
            copiaSorteadas.Add(sorteadas[1]);
            copiaSorteadas.Add(sorteadas[2]);
            copiaSorteadas.Add(sorteadas[3]);
            return copiaSorteadas;
        }
    }
}
