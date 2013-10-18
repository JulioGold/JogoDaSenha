<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Senha.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Jogo da senha</title>
    <link type="text/css" rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/ui-darkness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#dialog-message").dialog({
                autoOpen: false,
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
            $("#btnSobre").click(function () {
                $("#dialog-message").dialog("open");
            });
        });
    </script>
</head>
<body>
    <div id="dialog-message" title="Jogo da senha">
        <p>
            Curso: Sistemas para Internet<br />
            Disciplina de programação para internet IV.<br />
            Professor: Gabriel da Silva Simões<br />
        </p>
        <p>
            Desenvolvido por:<br />
            Julia Andreolla<br />
            Julio Cesar Goldschmidt<br />
            Vaneis de Jesus Rodrigues<br />
        </p>
    </div>
    <form id="frmCores" runat="server">
        <h1>Jogo da senha</h1>
        <br />
        <div class="jogo">
            <div class="opcoes">
                <label><strong>Cores:</strong></label><br />
                <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton_Click" />
                <asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton_Click" />
                <asp:ImageButton ID="ImageButton3" runat="server" OnClick="ImageButton_Click" />
                <asp:ImageButton ID="ImageButton4" runat="server" OnClick="ImageButton_Click" />
                <asp:ImageButton ID="ImageButton5" runat="server" OnClick="ImageButton_Click" />
                <asp:ImageButton ID="ImageButton6" runat="server" OnClick="ImageButton_Click" />

                <asp:Button ID="btnNovoJogo" runat="server" Text="Novo jogo" OnClick="btnNovoJogo_Click" />
                <asp:Button ID="btnVerificar" runat="server" Text="Verificar" OnClick="btnVerificar_Click" Enabled="False" />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <input id="btnSobre" type="button" value="Sobre..." />
            </div>
            <div class="tentativas">
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib1" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib2" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib3" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib4" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph1" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib5" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib6" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib7" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib8" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph2" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib9" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib10" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib11" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib12" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph3" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib13" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib14" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib15" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib16" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph4" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib17" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib18" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib19" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib20" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph5" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib21" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib22" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib23" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib24" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph6" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib25" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib26" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib27" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib28" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph7" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib29" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib30" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib31" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib32" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph8" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib33" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib34" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib35" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib36" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph9" runat="server"></asp:PlaceHolder>
                </div>
                <div class="tentativa">
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib37" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib38" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib39" runat="server" Enabled="False" />
                    <asp:ImageButton ImageUrl="./img/empty.png" ID="ib40" runat="server" Enabled="False" />
                    <asp:PlaceHolder ID="ph10" runat="server"></asp:PlaceHolder>
                </div>
                <div class="resultado">
                    <asp:PlaceHolder ID="phResultado" runat="server"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
