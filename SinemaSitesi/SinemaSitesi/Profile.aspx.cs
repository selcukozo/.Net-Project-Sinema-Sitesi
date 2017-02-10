using SinemaSitesi.cls;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinemaSitesi
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Kullanici k_ = new Kullanici();

                k_ = (Kullanici)Session["User"];
                Users_Label1.Text = "Hoşgeldin " + k_.kul_adi + " " + k_.kul_soyadi;
                Profile_Label1.Text = k_.kul_adi + " " + k_.kul_soyadi;
                users_singout_anc.ServerClick += new EventHandler(users_singout_anc_Click);
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
                SqlDataReader dr = clsSabitler.veritabani.SqlCalistir(" SELECT * FROM tbl_kul WHERE kul_id="+k_.kul_id);
                if(dr.HasRows==true)
                {
                    dr.Read();
                    if(dr[9].ToString()!="")
                    {
                        profil_hakkımda_Label1.Text = dr[9].ToString();
                    }else
                    {
                        profil_hakkımda_Label1.Text = "Henüz kendisini bizlere anlatmamış!";
                    }
                    profil_hakkımda_Label2.Text = "Kayıt Tarihi: "+dr[6].ToString();
                }
                string yorum_sayisi = "";
                SqlDataReader dr_ys;
                dr_ys = clsSabitler.veritabani.SqlCalistir("SELECT COUNT(*) FROM tbl_yorumlar WHERE kul_id=" + k_.kul_id);
                if (dr_ys.HasRows == true)
                {
                    dr_ys.Read();
                    yorum_sayisi = dr_ys[0].ToString();
                    if (yorum_sayisi == "0")
                    {
                        yorum_sayisi = "0";
                        profil_yorumlar_Literal3.Text="<div style='display:none'>";
                        profil_yorumlar_Literal4.Text = "</div>";
                    }
                    else
                    {
                        profil_yorumlar_Literal1.Text = "<div style='display:none'>";
                        profil_yorumlar_Literal2.Text = "</div>";
                        profil_yorumlar_Literal3.Text = "";
                        profil_yorumlar_Literal4.Text = "";
                    }
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

        protected void Profile_Button1_Click(object sender, EventArgs e)
        {
            Kullanici k_by = new Kullanici();

                k_by = (Kullanici)Session["User"];
            SqlDataReader dr_by = clsSabitler.veritabani.SqlCalistir(" SELECT * FROM tbl_kul WHERE kul_id="+k_by.kul_id);
            if (dr_by.HasRows == true)
            {
                dr_by.Read();
                string yetki=dr_by[10].ToString();
                if (yetki == "ADMIN")//Güvenlik için buraya ve sayfaya daha değişik isimler verilebilir biz sadece sistemi
                    //test ediyoruz
                {
                    Response.Redirect("Admin.aspx");
                }
            }
        }
    }
}