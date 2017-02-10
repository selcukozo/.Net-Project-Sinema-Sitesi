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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["User"]!=null)
            {
                Kullanici k_ = new Kullanici();

                k_ = (Kullanici)Session["User"];
                Users_Label1.Text = "Hoşgeldin " + k_.kul_adi + " " + k_.kul_soyadi;
                users_singout_anc.ServerClick += new EventHandler(users_singout_anc_Click);
                string film_kategori = Request.QueryString["film_kategori"];
                if (film_kategori == null)
                {

                    GridYukleAltMenu();
                }
                else
                {
                    GridYukleUstMenu();
                }
                if(!IsPostBack)
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
            }else
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
       private void GridYukleAltMenu()
       {
           string film_siralama = Request.QueryString["film_siralama"];
           DataSet ds_fs;
           switch (film_siralama)
           {
               case "ye_ek":
                   ds_fs = clsSabitler.veritabani.DataSetYukle("SELECT TOP 9 * FROM tbl_filmler ORDER BY film_ref_id DESC", "ds_filmler");
                   break;
               case "en_iz":
                   ds_fs = clsSabitler.veritabani.DataSetYukle("SELECT * FROM tbl_filmler ORDER BY film_izlenme DESC", "ds_filmler");
                   break;
               case "en_yo":
                   ds_fs = clsSabitler.veritabani.DataSetYukle("SELECT film_ref_id,film_adi,film_seslendirme,film_aciklama,film_resim,film_imdb_puani,film_izlenme, COUNT(1)AS CNT FROM View_film_yorum group by film_ref_id,film_adi,film_seslendirme,film_aciklama,film_resim,film_imdb_puani,film_izlenme ORDER BY CNT Desc", "ds_filmler");
                   break;
               case "en_be":
                   ds_fs = clsSabitler.veritabani.DataSetYukle("SELECT film_ref_id,film_adi,film_seslendirme,film_aciklama,film_resim,film_imdb_puani,film_izlenme, COUNT(1)AS CNT FROM View_film_begenme group by film_ref_id,film_adi,film_seslendirme,film_aciklama,film_resim,film_imdb_puani,film_izlenme ORDER BY CNT Desc", "ds_filmler");
                   break;
               default:
                   ds_fs = clsSabitler.veritabani.DataSetYukle("SELECT * FROM tbl_filmler ORDER BY film_ref_id DESC", "ds_filmler");
                   break;
           }


           DataList1.DataSource = ds_fs.Tables["ds_filmler"];
           DataList1.DataBind();
       }
       private void GridYukleUstMenu()
       {
           int film_kategori = int.Parse( Request.QueryString["film_kategori"]);
           DataSet ds_fu;
           ds_fu = clsSabitler.veritabani.DataSetYukle("SELECT * FROM View_filmler_ve_kategoriler WHERE kategori_ref_id=" + film_kategori + " ORDER BY film_upload_tarihi DESC", "ds_filmler");
           if (ds_fu.Tables["ds_filmler"].Rows.Count != 0)
           {
               DataList1.DataSource = ds_fu.Tables["ds_filmler"];
               DataList1.DataBind();
           }
           else
           {
               Response.Redirect("Users.aspx");
           }
       }
    }
}