<%@ Page Title="Calculadora" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TesteCalculadora._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <div class="row">

            <center>
                <section class="col-md-4 calculadora">
                    <div class="centro-disp">
                        <asp:TextBox ID="txtDisplay" runat="server" ReadOnly="true" CssClass="display-calculadora"></asp:TextBox>
                        <asp:Button ID="btnApaga" runat="server" Text="<==" class="btn-calculadora btnApaga" ToolTip="Apagar" OnClick="apagaUmCaract_Click" BackColor="#ff3300" />

                    </div>
                    <br />
                    <asp:Button ID="btn1" runat="server" Text="1" class="btn-calculadora btn1" OnClick="btnNumero_Click" />
                    <asp:Button ID="btn2" runat="server" Text="2" class="btn-calculadora btn2" OnClick="btnNumero_Click" />
                    <asp:Button ID="btn3" runat="server" Text="3" class="btn-calculadora btn3" OnClick="btnNumero_Click" />
                    <asp:Button ID="btnAdd" runat="server" Text="+" class="btn-calculadora btnAdd" ToolTip="Adição" OnClick="btnOperacao_Click" />
                    <br />
                    <asp:Button ID="btn4" runat="server" Text="4" class="btn-calculadora btn4" OnClick="btnNumero_Click" />
                    <asp:Button ID="btn5" runat="server" Text="5" class="btn-calculadora btn5" OnClick="btnNumero_Click" />
                    <asp:Button ID="btn6" runat="server" Text="6" class="btn-calculadora btn6" OnClick="btnNumero_Click" />
                    <asp:Button ID="btnSubtracao" runat="server" Text="-" class="btn-calculadora btnSubtracao" ToolTip="Subtração" OnClick="btnOperacao_Click" />
                    <br />
                    <asp:Button ID="btn7" runat="server" Text="7" class="btn-calculadora btn7" OnClick="btnNumero_Click" />
                    <asp:Button ID="btn8" runat="server" Text="8" class="btn-calculadora btn8" OnClick="btnNumero_Click" />
                    <asp:Button ID="btn9" runat="server" Text="9" class="btn-calculadora btn9" OnClick="btnNumero_Click" />
                    <asp:Button ID="btnMultiplicacao" runat="server" Text="*" class="btn-calculadora btnMultiplicacao" ToolTip="Multiplicação" OnClick="btnOperacao_Click" />
                    <br />
                    <asp:Button ID="btn0" runat="server" Text="0" class="btn-calculadora btn0" OnClick="btnNumero_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="C" class="btn-calculadora btnClear" ToolTip="Limpar" BackColor="#3399ff" OnClick="btnClear_Click" />
                    <asp:Button ID="btnIgual" runat="server" Text="=" class="btn-calculadora btnIgual" ToolTip="Igual" BackColor="#00cc00" OnClick="btnResult_Click" />
                    <asp:Button ID="btnDivisao" runat="server" Text="/" class="btn-calculadora btnDivisao" ToolTip="Divisão" OnClick="btnOperacao_Click" />
                    <br />
                    <asp:Button ID="ButtonPonto" runat="server" Text="," class="btn-calculadora btnPt" OnClick="btnPonto_Click" />

                </section>
            </center>



        </div>
    </main>
    <br />
    <br />
    <br />
    <script type="text/javascript">
        window.onload = function () {
            var btnPt = document.getElementById('<%= ButtonPonto.ClientID %>');

            btnPt.style.position = 'relative';
            btnPt.style.right = '35%';
        };

        document.addEventListener('DOMContentLoaded', function () {
            document.addEventListener('keydown', function (event) {
                var key = event.key;
                var button;
                console.log(key);
                var display = document.getElementById('<%= txtDisplay.ClientID %>');
                if (!isNaN(key)) {
                    button = document.getElementsByClassName('btn' + key)[0];
                } else {
                    switch (key) {
                        case '+':
                            button = document.getElementsByClassName('btnAdd')[0];
                            break;
                        case '-':
                            button = document.getElementsByClassName('btnSubtracao')[0];
                            break;
                        case '*':
                            button = document.getElementsByClassName('btnMultiplicacao')[0];
                            break;
                        case '/':
                            button = document.getElementsByClassName('btnDivisao')[0];
                            break;
                        case 'Enter':
                            button = document.getElementsByClassName('btnIgual')[0];
                            break;
                        case 'Escape':
                            button = document.getElementsByClassName('btnClear')[0];
                            break;
                        case '.':
                        case ',':
                            button = document.getElementsByClassName('btnPt')[0];
                            break;
                        case 'Backspace':
                            //display.value = display.value.slice(0, -1);
                            button = document.getElementById('<%= btnApaga.ClientID %>');
                            break;
                    }
                }
                console.log(button);
                if (button) {
                    button.click();
                }
            });
        });
    </script>
</asp:Content>
