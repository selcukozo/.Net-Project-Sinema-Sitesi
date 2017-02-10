<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="SinemaSitesi.WebForm4" %>
<%@ Register src="uc_film_yorum.ascx" tagname="uc_film_yorum" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Movies.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="uyeBolum">
            <a href="Profile.aspx" class="users_profile_anc"><div class="users_profile">Profilim</div></a>
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
            <div class="FilmBolum">
                <div class="Film_baslik">
                    <asp:Label ID="film_baslik_Label3" runat="server"></asp:Label>
                    <asp:Label CssClass="film_baslik_label_header" ID="film_baslik_Label1" runat="server" Text="Film Adı"></asp:Label>
                    <asp:Label CssClass="film_baslik_label_menu" ID="film_baslik_Label2" runat="server" Text="Anasayfa>1080p Filmler"></asp:Label>
                </div>
                <a href="#" runat="server" id="film_begen_anc">
                <asp:Label ID="film_begen_Label1" runat="server"></asp:Label>
                </a>
                <div class="Film_content">
                    <div class="Film_content_icerik_tuslar">
                        <div class="Film_content_icerik_tuslar_sari"><p>(Yüksek Kalite)</p></div>
                        <div class="Film_content_icerik_tuslar_sari"><p>ODL 720P PART 1</p></div>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>ODL 720P PART 2</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>ODL 720P PART 3</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>ODL 720P TEK PART</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>720P PART1</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>720P PART2</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>720P PART3</p></div></a>
                        <a href="#" runat="server" id="film_content_720P_tek_part_anc"><div class="Film_content_icerik_tuslar_mavi"><p>720P TEK PART</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>720P 16:9 PART 1</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>720P 16:9 PART 2</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_mavi"><p>720P 16:9 PART 3</p></div></a>
                        <a href="#" runat="server" id="film_content_fragman_anc"><div class="Film_content_icerik_tuslar_mavi"><p>FRAGMAN</p></div></a>
                        <a href="#"><div class="Film_content_icerik_tuslar_kirmizi"><p>Yorum yap</p></div></a>
                    </div>
                    <div class="Film_content_icerik_video">
                        <asp:Label ID="film_content_icerik_video_Label1" runat="server"></asp:Label>
                    </div>
                    <div class="Film_content_icerik_alt">
                        <asp:Label ID="film_content_icerik_alt_face_Label1" runat="server"></asp:Label>
                        <div class="Film_content_icerik_alt_tv">
                        <div class="Film_content_icerik_alt_izlenme"><asp:Label ID="film_content_icerik_alt_izlenme_Label1" runat="server" Text="Label"></asp:Label></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="FilmKunye">
                <div class="FilmKunye_baslik">
                    <h2>FILM BILGILERI</h2>
                    <asp:Label ID="filmKunye_baslik_Label1" runat="server"></asp:Label>
                </div>
            
            <div class="FilmKunye_resim">
                <asp:Label ID="filmKunye_resim_label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="FilmKunye_bilgiler">
                <div class="FilmKunye_bilgiler_ozet">
                    <asp:Label ID="filmKunye_bilgiler_ozet_Label1" runat="server"></asp:Label>
                </div>
                <table class="FilmKunye_bilgiler_tablo">
                    <tr>
                        <td class="FilmKunye_bilgiler_td">Tür</td>
                        <td>:<asp:Label ID="filmKunye_bilgiler_Label1" runat="server"></asp:Label></td>
                    </tr>
                     <tr>
                        <td class="FilmKunye_bilgiler_td">Yapım</td>
                        <td>:<asp:Label ID="filmKunye_bilgiler_Label2" runat="server"></asp:Label></td>
                    </tr>
                     <tr>
                        <td class="FilmKunye_bilgiler_td">IMDB Puanı</td>
                        <td>:<asp:Label ID="filmKunye_bilgiler_Label3" runat="server"></asp:Label></td>
                    </tr>
                     <tr>
                        <td class="FilmKunye_bilgiler_td">Yönetmen</td>
                        <td>:<asp:Label ID="filmKunye_bilgiler_Label4" runat="server"></asp:Label></td>
                    </tr>
                     <tr>
                        <td class="FilmKunye_bilgiler_td">Oyuncular</td>
                        <td>:<asp:Label ID="filmKunye_bilgiler_Label5" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </div>
            </div>
            <div class="YorumBolum">
             <div class="YorumBolum_baslik">
             <h2>YORUMLAR</h2>
             <p>YORUM YAPMAK İSTERMİSİNİZ?</p>
             </div>
                 <asp:TextBox ID="yorumBolum_yaz_TextBox1" CssClass="YorumBolum_yaz" runat="server" TextMode="MultiLine"></asp:TextBox>
                 <div class="YorumBolum_profil">
                     <div class="YorumBolum_profil_avatar"></div>
                     <asp:Label ID="yorumBolum_profil_Label1" runat="server"></asp:Label>
                     <p>Hemen bir yorum yazın.</p>
                     
                     <a href="#" id="yorumBolum_profil_cikis_anc" class="yorumBolum_profil_cikis" runat="server">(Çıkış)</a>
                 </div>
                 <asp:Button CssClass="yorumBolum_button" ID="yorumBolum_Button1" runat="server" Text="Yorumu Gönder" OnClick="yorumBolum_Button1_Click" />
                <asp:Literal ID="yorumBolum_tum_yorumlar_Literal1" runat="server"></asp:Literal>
                    <asp:Label ID="yorumBolum_tum_yorumlar_Label1" runat="server"></asp:Label>
                    <uc3:uc_film_yorum ID="uc_film_yorum1" runat="server" />
                <asp:Literal ID="yorumBolum_tum_yorumlar_Literal2" runat="server"></asp:Literal>
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
            <asp:TextBox ID="TextBox2" runat="server" CssClass="email_bolum_text" onfocus="clearBox()" onblur="fillBox()" Text="Buraya e-mail adresini yaz"></asp:TextBox>
            <a href="#"><img src="../images/email_Tus1.png" /></a>
        </div>
        <div class="yanMenuBolum">
        <asp:Label ID="yanMenuBolum_Label1" runat="server"></asp:Label>
        </div>
        </div>
</asp:Content>
