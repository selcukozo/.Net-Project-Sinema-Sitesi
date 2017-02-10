<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_user_create_popup.ascx.cs" Inherits="SinemaSitesi.uc_user_create_popup" %>
<link href="css/uc_user_create_popup.css" rel="stylesheet" type="text/css" />
<div class="uyelikBolumPopup">
            <h2>Üye Ol</h2>
            <div class="uyelik_popup_cizgi_bir"></div>
            <div class="uyelik_popup_cizgi_iki"></div>
    <table>
        <tr>
            <td><p>Adı</p></td>
            <td><asp:TextBox CssClass="uyelik_popup_textbox" ID="TextBox1" runat="server"></asp:TextBox></td>
            
        </tr>
        <tr>
            <td><p>Soyadı</p></td>
            <td><asp:TextBox CssClass="uyelik_popup_textbox" ID="TextBox2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><p>Kullanıcı Adı</p></td>
            <td><asp:TextBox  CssClass="uyelik_popup_textbox" ID="TextBox3" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><p>Şifre</p></td>
            <td><asp:TextBox CssClass="uyelik_popup_textbox" ID="TextBox4" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><p>E-Posta</p></td>
            <td><asp:TextBox CssClass="uyelik_popup_textbox" ID="TextBox5" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Button ID="Button1" CssClass="uyelik_popup_button1" runat="server" Text="Kayıt Ol" OnClick="Button1_Click" /></td>
            <td></td>
        </tr>
    </table>
</div>