<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SinemaSitesi.WebForm5" %>
<%@ Register src="uc_film_yorum_kul.ascx" tagname="uc_film_yorum_kul" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Profile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="uyeBolum">
            <a href="#" class="users_profile_anc"><div class="users_profile">Profilim</div></a>
            <a href="#" id="users_singout_anc" runat="server"><div class="users_singout"></div>Çıkış</a><br />
            <asp:Label ID="Users_Label1" CssClass="users_label" runat="server"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <nav>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="anaMenu" StaticEnableDefaultPopOutImage="False">
                <DynamicHoverStyle CssClass="dinamik_menu_hover"></DynamicHoverStyle>

                <DynamicMenuItemStyle  CssClass="dinamik_menu_item"></DynamicMenuItemStyle>

                <DynamicMenuStyle CssClass="dinamik_menu"></DynamicMenuStyle>

                <DynamicSelectedStyle CssClass="dinamik_menu_secili"></DynamicSelectedStyle>
                <Items>
                    <asp:MenuItem Text="ANASAYFA" Value="ANASAYFA" NavigateUrl="Users.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="YABANCI DİZİLER" Value="YABANCI DIZILER">
                        <asp:MenuItem Text="PRISON BREAK" Value="PRISON BREAK"></asp:MenuItem>
                        <asp:MenuItem Text="BREAKING BAD" Value="BREAKING BAD"></asp:MenuItem>
                        <asp:MenuItem Text="THE WALKING DEAD" Value="THE WALKING DEAD"></asp:MenuItem>
                        <asp:MenuItem Text="GOTHAM" Value="GOTHAM"></asp:MenuItem>
                        <asp:MenuItem Text="FRINGE" Value="FRINGE"></asp:MenuItem>
                        <asp:MenuItem Text="TEEN WOLF" Value="TEEN WOLF"></asp:MenuItem>
                        <asp:MenuItem Text="UNDER THE DOME" Value="UNDER THE DOME"></asp:MenuItem>
                        <asp:MenuItem Text="THE ORIGINALS" Value="THE ORIGINALS"></asp:MenuItem>
                        <asp:MenuItem Text="STAR WARS: KLON SAVAŞLARI" Value="STAR WARS: KLON SAVASLARI"></asp:MenuItem>
                        <asp:MenuItem Text="DEXTER" Value="DEXTER"></asp:MenuItem>
                        <asp:MenuItem Text="LOST" Value="LOST"></asp:MenuItem>
                        <asp:MenuItem Text="GAME OF THRONES" Value="GAME OF THRONES"></asp:MenuItem>
                        <asp:MenuItem Text="DOCTOR WHO" Value="DOCTOR WHO"></asp:MenuItem>
                        <asp:MenuItem Text="DA VINCI&#39;S DEMONS" Value="DA VINCIS DEMONS"></asp:MenuItem>
                        <asp:MenuItem Text="HZ. &#214;MER" Value="HZ. OMER"></asp:MenuItem>
                        <asp:MenuItem Text="GOSSIP GIRL" Value="GOSSIP GIRL"></asp:MenuItem>
                        <asp:MenuItem Text="THE PACIFIC" Value="THE PACIFIC"></asp:MenuItem>
                        <asp:MenuItem Text="PERSON OF INTEREST" Value="PERSON OF INTEREST"></asp:MenuItem>
                        <asp:MenuItem Text="VIKINGS" Value="VIKINGS"></asp:MenuItem>
                        <asp:MenuItem Text="THE KILLING" Value="THE KILLING"></asp:MenuItem>
                        <asp:MenuItem Text="THE FOLLOWING" Value="THE FOLLOWING"></asp:MenuItem>
                        <asp:MenuItem Text="THE BIBLE" Value="THE BIBLE"></asp:MenuItem>
                        <asp:MenuItem Text="MERLIN" Value="MERLIN"></asp:MenuItem>
                        <asp:MenuItem Text="SHERLOCK" Value="SHERLOCK"></asp:MenuItem>
                        <asp:MenuItem Text="RED WIDOW" Value="RED WIDOW"></asp:MenuItem>
                        <asp:MenuItem Text="THE VAMPIRE DIARIES" Value="THE VAMPIRE DIARIES"></asp:MenuItem>
                        <asp:MenuItem Text="AMERICAN HORROR STORY" Value="AMERICAN HORROR STORY"></asp:MenuItem>
                        <asp:MenuItem Text="THE SOPRANOS" Value="THE SOPRANOS"></asp:MenuItem>
                        <asp:MenuItem Text="TOUCH" Value="TOUCH"></asp:MenuItem>
                        <asp:MenuItem Text="MASTER OF HORROR" Value="MASTER OF HORROR"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="T&#220;RK&#199;E DUBLAJ FİLMLER" Value="TURKCE DUBLAJ FILMLER" NavigateUrl="Users.aspx?film_kategori=47"></asp:MenuItem>
                    <asp:MenuItem Text="ALTYAZILI FİLMLER" Value="ALTYAZILI FILMLER" NavigateUrl="Users.aspx?film_kategori=13"></asp:MenuItem>
                    <asp:MenuItem Text="TOP 250" Value="TOP 250"></asp:MenuItem>
                    <asp:MenuItem Text="IMDB 7.0+" Value="IMDB 7.0+" NavigateUrl="Users.aspx?film_kategori=30"></asp:MenuItem>
                    <asp:MenuItem Text="1080P FİLMLER" Value="1080P FILMLER" NavigateUrl="Users.aspx?film_kategori=2"></asp:MenuItem>
                    <asp:MenuItem Text="OYUNCULAR" Value="OYUNCULAR"></asp:MenuItem>
                    <asp:MenuItem Text="HUKUKSAL" Value="HUKUKSAL"></asp:MenuItem>
                </Items>
                <StaticHoverStyle CssClass="statik_menu_hover"></StaticHoverStyle>

                <StaticMenuItemStyle CssClass="statik_menu_item"></StaticMenuItemStyle>
                <StaticMenuStyle CssClass="statik_menu"></StaticMenuStyle>
                <StaticSelectedStyle CssClass="statik_menu_secili"></StaticSelectedStyle>
            </asp:Menu>
        </nav>
        <br />
        <br />
    <div class="anaWrapper">
    <div class="profil_content">
        <h2><asp:Label ID="Profile_Label1" runat="server"></asp:Label></h2>
        <div class="profil_detay">
        <div class="profil_resim"></div>
            <div class="profile_button_cizgi"><asp:Button ID="Profile_Button1" CssClass="profile_button" runat="server" Text="Başlangıç" OnClick="Profile_Button1_Click" /></div>
            <div class="profile_button_cizgi"><asp:Button ID="Profile_Button2" CssClass="profile_button" runat="server" Text="Profil Düzenle" /></div>
        </div>
        
        <div class="profil_hakkımda">
            <h3>Hakkımda</h3>
                    <asp:Label CssClass="profil_hakkımda_label1" ID="profil_hakkımda_Label1" runat="server"></asp:Label>
                    <br/><asp:Label CssClass="profil_hakkımda_label2" ID="profil_hakkımda_Label2" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="profil_bos"></div>
        <asp:Literal ID="profil_yorumlar_Literal1" runat="server"></asp:Literal>
        <div class="profil_yorumlar_bolumu">
            <h3>Son Yaptığı Yorumlar</h3>
            <div class="profil_yorumlar_content">
            <div class="profil_yorumlar_baslik">
                ?????
            </div>
            <div class="profil_yorumlar_icerik">
                <p>Bu zamana kadar bize hiç bir görüş bildirmedi.</p>
            </div>
            </div>
        </div>
        <asp:Literal ID="profil_yorumlar_Literal2" runat="server"></asp:Literal>
        <asp:Literal ID="profil_yorumlar_Literal3" runat="server"></asp:Literal>
        <uc4:uc_film_yorum_kul ID="uc_film_yorum_kul1" runat="server" />
        <asp:Literal ID="profil_yorumlar_Literal4" runat="server"></asp:Literal>
    </div>
            <div class="reklamBolum">
            <table class="reklam_tablo">
                <tr>
                    <th>Site</th>
                    <th>Bonus</th>
                    <th>Giriş</th>
                </tr>
                <tr>
                    <td><img src="../reklam_images/youwin.png" /></td>
                    <td>300 TL</td>
                    <td><a href="#">Youwin</a></td>
                </tr>
                <tr>
                    <td><img src="../reklam_images/superbahis.png" /></td>
                    <td>350 TL</td>
                    <td><a href="#">Süperbahis</a></td>
                </tr>
                <tr>
                    <td><img src="../reklam_images/betboo.png" /></td>
                    <td>350 TL</td>
                    <td><a href="#">Betboo</a></td>
                </tr>
                <tr>
                    <td><img src="../reklam_images/oddsring.png" /></td>
                    <td>500 TL</td>
                    <td><a href="#">Oddsring</a></td>
                </tr>
                <tr>
                    <td><img src="../reklam_images/tempobet.png" /></td>
                    <td>%10</td>
                    <td><a href="#">Tempobet</a></td>
                </tr>
            </table>
        </div>
        <div class="emailBolum">
            <h2>Yeni Filmlerden Haberdar Ol!</h2>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="email_bolum_text"></asp:TextBox>
            <a href="#"><img src="../images/email_Tus1.png" /></a>
        </div>
        <div class="yanMenuBolum">
            <asp:Label ID="yanMenuBolum_Label1" runat="server" Text="Label"></asp:Label>
        </div>
        </div>
</asp:Content>
