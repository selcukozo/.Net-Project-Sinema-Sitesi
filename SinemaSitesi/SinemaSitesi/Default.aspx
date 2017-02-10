<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SinemaSitesi.WebForm1" %>
<%@ Register Src="~/uc_carousel.ascx" TagPrefix="uc1" TagName="uc_carousel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="uyeBolum">
            <a href="#" class="toPopup1"><div class="uye_ol">Üye Ol</div></a>
            <a href="#" class="js__p_start"><div class="uye_giris"></div>Üye Girişi</a>
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
                    <asp:MenuItem Text="ANASAYFA" Value="ANASAYFA" NavigateUrl="Default.aspx"></asp:MenuItem>
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
                    <asp:MenuItem Text="T&#220;RK&#199;E DUBLAJ FİLMLER" Value="TURKCE DUBLAJ FILMLER" NavigateUrl="Default.aspx?film_kategori=47"></asp:MenuItem>
                    <asp:MenuItem Text="ALTYAZILI FİLMLER" Value="ALTYAZILI FILMLER" NavigateUrl="Default.aspx?film_kategori=13"></asp:MenuItem>
                    <asp:MenuItem Text="TOP 250" Value="TOP 250"></asp:MenuItem>
                    <asp:MenuItem Text="IMDB 7.0+" Value="IMDB 7.0+" NavigateUrl="Default.aspx?film_kategori=30"></asp:MenuItem>
                    <asp:MenuItem Text="1080P FİLMLER" Value="1080P FILMLER" NavigateUrl="Default.aspx?film_kategori=2"></asp:MenuItem>
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
    <div class="sliderBolum">
            <div id="mygallery" class="stepcarousel">
<div class="belt">
<uc1:uc_carousel runat="server" id="uc_carousel" />
</div>
</div>
        </div>
        <div class="anaWrapper">
        <div class="gridBolum">
           <ul class="alt_menu_elyapimi">
               <li><a href="Default.aspx?film_siralama=ye_ek">YENİ EKLENENLER<div></div></a></li>
               <li><a href="Default.aspx?film_siralama=en_iz">EN ÇOK İZLENENLER<div></div></a></li>
               <li><a href="Default.aspx?film_siralama=en_yo">EN ÇOK YORUMLANANLAR<div></div></a></li>
               <li><a href="Default.aspx?film_siralama=en_be">EN ÇOK BEĞENİLENLER<div></div></a></li>
           </ul>
            <div class="grid_cizgi_bir"></div>
            <div class="grid_cizgi_iki"></div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="film_ref_id" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="0">
                <ItemTemplate>
                  <div class="datalist_template">
                  <img class="film_seslendirme" src="<%# Eval("film_seslendirme")%>"/>
                  <div class="imdb_puani">
                  <asp:Label ID="imdb_puaniLabel"  runat="server" Text= '<%# "IMDB Puanı: " + Eval("film_imdb_puani")%>'></asp:Label></div>
                  <img class="film_resim" src="<%# Eval("film_resim") %>"/>
                  <br />
                  
                  <div class="film_adi">
                  <asp:Label CssClass="film_adiLabel" runat="server" Text='<%# Eval("film_adi") + " izle | " + Eval("film_aciklama")%>' />
                  </div>
                  </div>
                  <div class="film_izlenme">
                  <asp:Label CssClass="film_izlenmeLabel" runat="server" Text='<%# Eval("film_izlenme") + " izlenme"%>' />
                  </div>
                </ItemTemplate>
            </asp:DataList>
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
