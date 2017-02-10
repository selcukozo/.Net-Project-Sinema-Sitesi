using SinemaSitesi.cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinemaSitesi
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Kullanici k_ = new Kullanici();

                k_ = (Kullanici)Session["User"];
                Users_Label1.Text = "Hoşgeldin " + k_.kul_adi + " " + k_.kul_soyadi;
                users_singout_anc.ServerClick += new EventHandler(users_singout_anc_Click);
                film_begen_anc.ServerClick += new EventHandler(film_begen_anc_Click);
                film_content_fragman_anc.ServerClick += new EventHandler(film_content_fragman_anc_Click);
                film_content_720P_tek_part_anc.ServerClick += new EventHandler(film_content_720P_tek_part_anc_Click);
                yorumBolum_profil_cikis_anc.ServerClick += new EventHandler(users_singout_anc_Click);
                if (!IsPostBack)
                {
                    yanMenuBolum_Label1.Text = "";
                    SqlDataReader dr_ym;
                    dr_ym = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_kategoriler");
                    string yan_menu = "<h2>Kategoriler</h2><ul>";
                    while (dr_ym.Read())
                    {
                        yan_menu += "<li><a href='Users.aspx?film_kategori=" + dr_ym[0].ToString() + "'/>" + dr_ym[1].ToString() + "</li>";
                    }
                    yanMenuBolum_Label1.Text = yan_menu + "</ul>";
                }

                string id = Request.QueryString["film_id"];
                if (id != null)
                {
                    SqlDataReader dr;
                    dr = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_filmler WHERE film_ref_id=" + id);
                    if (dr.HasRows == true)
                    {
                        dr.Read();
                        film_baslik_Label1.Text = dr[1].ToString() + " izle | " + dr[6].ToString();
                        film_baslik_Label3.Text = "<a href='http:/" + "/www.google.com/search?hl=tr&q=" + film_baslik_Label1.Text + "'><div class=Film_baslik_google></div></a>";
                            switch (Request.QueryString["iframe_sec"])
                            {
                                case "fragman":
                                    film_content_icerik_video_Label1.Text = "<iframe src='" + dr[7].ToString() + "' width='702' height='400' class='iframe' allowfullscreen></iframe>";
                                break;
                                case "720P_tek_part":
                                    film_content_icerik_video_Label1.Text = "<iframe src='" + dr[8].ToString() + "' width='702' height='400' class='iframe' allowfullscreen></iframe>";
                                break;
                                //case: // Diğer tuşları eklemedim 1080p ise başka tuşlar 720p ise başka tuş. filmle fragman arası geçişi 2 tuş yapıyor part olanlar boş
                                default:
                                    film_content_icerik_video_Label1.Text = "<iframe src='" + dr[8].ToString() + "' width='702' height='400' class='iframe' allowfullscreen></iframe>";
                                break;
                            }
                        TimeSpan ts = DateTime.Now - Convert.ToDateTime(dr[10].ToString());
                        //Bu kısmı daha kısa yapabileceğimi biliyorum ama isteyerek bu şekilde yaptım 
                        // Aynı şekilde ay da eklenebilir ama timespanda ay seçeneğini göremedim 30 a bölerek ay ı hesaplasak da yanlış geldiği için yapmadım.
                        if(ts.TotalDays < 1)
                        {
                            if (ts.TotalHours <1)
                            {
                                filmKunye_baslik_Label1.Text = "<p>" + Convert.ToString(Math.Floor(double.Parse(ts.TotalMinutes.ToString()))) + " DAKİKA ÖNCE EKLENDİ</p>";
                                
                            }
                            else
                            {
                                filmKunye_baslik_Label1.Text = "<p>" + Convert.ToString(Math.Floor(double.Parse(ts.TotalHours.ToString()))) + " SAAT ÖNCE EKLENDİ</p>";
                            }

                        }
                        else
                        {
                            filmKunye_baslik_Label1.Text ="<p>"+ Convert.ToString(Math.Floor(double.Parse(ts.TotalDays.ToString()))) + " GÜN ÖNCE EKLENDİ</p>";
                        }
                        filmKunye_resim_label1.Text = "<img src='"+dr[3].ToString()+"'/>";
                        filmKunye_bilgiler_ozet_Label1.Text = dr[11].ToString();
                        SqlDataReader dr_k;
                        dr_k = clsSabitler.veritabani.SqlCalistir("SELECT * FROM View_filmler_ve_kategoriler WHERE film_ref_id=" + id+" ORDER BY kategori_ref_id");
                        while(dr_k.Read())
                        {
                            if (dr_k[2].ToString() == "")
                            break;
                            filmKunye_bilgiler_Label1.Text += "<a href='#'>" + dr_k[16].ToString() + "</a>,";
                        }
                        if(filmKunye_bilgiler_Label1.Text!="")
                        {
                            filmKunye_bilgiler_Label1.Text = filmKunye_bilgiler_Label1.Text.Substring(0, filmKunye_bilgiler_Label1.Text.Length - 1);
                        }
                        
                        filmKunye_bilgiler_Label2.Text = dr[12].ToString();
                        filmKunye_bilgiler_Label3.Text= dr[5].ToString();
                        filmKunye_bilgiler_Label4.Text = dr[13].ToString();
                        filmKunye_bilgiler_Label5.Text = dr[14].ToString();
                        string film_begenme;
                        SqlDataReader dr_bg;
                        dr_bg = clsSabitler.veritabani.SqlCalistir("SELECT COUNT(*) FROM [dbo].[View_film_begenme] WHERE film_ref_id="+id);
                        if (dr_bg.HasRows == true)
                        {
                            dr_bg.Read();
                            film_begenme = dr_bg[0].ToString();
                        }
                        else
                        {
                            film_begenme = "0";
                        }
                        film_begen_Label1.Text = "<div class='Film_begen'><p class='Film_begen_sayac'>" + film_begenme.ToString()+ "</p></div>";
                        film_content_icerik_alt_izlenme_Label1.Text = dr[2].ToString();
                        if (film_content_icerik_alt_izlenme_Label1.Text == "")
                        {
                            film_content_icerik_alt_izlenme_Label1.Text = "0";
                        }
                        
                        film_content_icerik_alt_face_Label1.Text = "<a href='http:/" + "/www.facebook.com/sharer.php?u=http:/" + "/www.sinemaSitesi.com/" + dr[1].ToString() + " izle - " + dr[6].ToString()+
                        "'>"+"<div class='Film_content_icerik_alt_face'></div></a>";
                    }
                    int izlenme = Convert.ToInt32(film_content_icerik_alt_izlenme_Label1.Text);
                    izlenme++;
                    clsSabitler.veritabani.NonSqlCalistir("UPDATE tbl_filmler SET film_izlenme="+ izlenme+" where film_ref_id="+id);
                    SqlDataReader dr_;
                    dr_ = clsSabitler.veritabani.SqlCalistir("SELECT * FROM View_filmler_ve_kategoriler WHERE film_ref_id=" + id);
                    dr_.Read();
                    if (dr_.HasRows == true)
                    {
                        film_baslik_Label2.Text = "<a href='Users.aspx' style='color:#515151;text-decoration:none;display:inline;'>Anasayfa</a><p style='display:inline;'> > </p><a href='Users.aspx?film_kategori=" + dr_[15].ToString() +"' style='color:#515151;text-decoration:none;display:inline;'>"
                    + dr_[16].ToString() + "</a>";

                    }
                    else
                    {
                        film_baslik_Label2.Text = "<a href='Users.aspx' style='color:#515151;text-decoration:none;display:inline;'>Anasayfa</a><p style='display:inline;'> > </p>";
                    }
                    yorumBolum_profil_Label1.Text = "<h2>Merhaba </h2><a class='yorumBolum_profil_baslik_a' href='Profile.aspx'>" + k_.kul_username + "</a>";
                    string yorum_sayisi="";
                    SqlDataReader dr_ys;
                    dr_ys = clsSabitler.veritabani.SqlCalistir("SELECT COUNT(*) FROM tbl_yorumlar WHERE film_ref_id=" + id);
                    if (dr_ys.HasRows == true)
                    {
                        dr_ys.Read();
                        yorum_sayisi = dr_ys[0].ToString();
                        if(yorum_sayisi=="0")
                        {
                            yorum_sayisi = "0"; 
                            yorumBolum_tum_yorumlar_Literal1.Text = "<div class='YorumBolum_tum_yorumlar' style='display:none'>";
                            yorumBolum_tum_yorumlar_Literal2.Text = "</div>";
                        }
                        else
                        {
                            yorumBolum_tum_yorumlar_Literal1.Text = "<div class='YorumBolum_tum_yorumlar'";
                            yorumBolum_tum_yorumlar_Literal2.Text = "</div>";
                        }
                        
                    }
                    else
                    {       
                    }
                    yorumBolum_tum_yorumlar_Label1.Text = "<h1>\"" + film_baslik_Label1.Text + "\" filminde " + yorum_sayisi + " yorum bulunuyor.</h1>";
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        protected void users_singout_anc_Click(object sender, EventArgs e)
        {
            Kullanici k__ = new Kullanici();
            k__ = (Kullanici)Session["User"];
            k__.Set_logOut(k__.kul_id);
            Session.Abandon();
            Response.Redirect("Default.aspx");
            
        }
        protected void film_begen_anc_Click(object sender, EventArgs e)
        {
            Kullanici k__ = new Kullanici();
            
            k__= (Kullanici)Session["User"];
            string id = Request.QueryString["film_id"];
            SqlDataReader dr__;
            dr__ = clsSabitler.veritabani.SqlCalistir("SELECT * FROM View_film_begenme WHERE film_ref_id=" +id+" AND kul_id="+k__.kul_id);
            if (dr__.HasRows == true)
            {
                dr__.Read();
                //film daha önce beğenilmiş tablodan düş
                clsSabitler.veritabani.NonSqlCalistir("DELETE FROM tbl_film_begenme WHERE kul_id="+k__.kul_id+" AND film_ref_id="+ id);
                Response.Redirect("Movies.aspx?film_id=" + Request.QueryString["film_id"]);
            }
            else
            {//film daha önce beğenilmemiş tabloya ekle
                clsSabitler.veritabani.NonSqlCalistir("INSERT INTO tbl_film_begenme(kul_id,film_ref_id) VALUES(" + k__.kul_id + "," + id + ")");
                Response.Redirect("Movies.aspx?film_id=" + Request.QueryString["film_id"]);
            }
        }
        protected void film_content_fragman_anc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx?film_id="+Request.QueryString["film_id"]+"&iframe_sec=fragman");
        }
        protected void film_content_720P_tek_part_anc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx?film_id="+Request.QueryString["film_id"]+"&iframe_sec=720P_tek_part");
        }

        protected void yorumBolum_Button1_Click(object sender, EventArgs e)
        {
            if(yorumBolum_yaz_TextBox1.Text!="")
            {
                Kullanici k_yr = new Kullanici();
                k_yr= (Kullanici)Session["User"];
                clsSabitler.veritabani.NonSqlCalistir("INSERT INTO tbl_yorumlar(yorum_icerik,yorum_silinme,film_ref_id,kul_ref_id) VALUES('"
                + yorumBolum_yaz_TextBox1.Text + "','False'," + Request.QueryString["film_id"] + "," + k_yr.kul_id + ")");
                Response.Redirect("Movies.aspx?film_id="+Request.QueryString["film_id"]);
            }
        }
    }
}