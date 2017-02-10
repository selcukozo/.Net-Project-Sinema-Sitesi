using SinemaSitesi.cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinemaSitesi
{
    public partial class WebForm6 : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
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
                if (!IsPostBack)
                {
                    yanMenuBolum_Label1.Text = "";
                    SqlDataReader dr_ym;
                    dr_ym = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_kategoriler");
                    string yan_menu = "<h2>Kategoriler</h2><ul>";
                    while (dr_ym.Read())
                    {
                        yan_menu += "<li><a href='Admin.aspx?film_kategori=" + dr_ym[0].ToString() + "'/>" + dr_ym[1].ToString() + "</li>";
                    }
                    yanMenuBolum_Label1.Text = yan_menu + "</ul>";
                }
                if(!IsPostBack)
                {

                
                string id = Request.QueryString["film_id"];
                if (id != null)
                {
                    SqlDataReader dr;
                    dr = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_filmler WHERE film_ref_id=" + id);
                    if (dr.HasRows == true)
                    {
                        dr.Read();
                        bilgiler_bolumu_TextBox1.Text = dr[0].ToString();// id  
                        bilgiler_bolumu_TextBox2.Text = dr[1].ToString();//adı 
                        bilgiler_bolumu_TextBox3.Text = dr[2].ToString();//izlenme
                        if (dr[3].ToString().Length > 15)
                        {
                            bilgiler_bolumu_TextBox4.Text = dr[3].ToString().Remove(0, 15); //resim
                        }
                        else
                        {
                            bilgiler_bolumu_TextBox4.Text = "";
                        }
                        if (dr[4].ToString().Length > 10)
                        {
                            bilgiler_bolumu_TextBox5.Text = dr[4].ToString().Remove(0, 10); ;//ses 
                        }
                        else
                        {
                            bilgiler_bolumu_TextBox5.Text = "";
                        }
                        bilgiler_bolumu_TextBox6.Text = dr[5].ToString();//imdb  

                         bilgiler_bolumu_TextBox7.Text = dr[6].ToString(); //acıklama 
                        bilgiler_bolumu_TextBox8.Text = dr[7].ToString();//link fragman
                        bilgiler_bolumu_TextBox9.Text = dr[8].ToString();//link film
                        uplad_bolum_Image1.ImageUrl = dr[3].ToString();
                        bilgiler_bolumu_TextBox10.Text = dr[10].ToString();//upload tarihi // sayılar eşit;
                        string kunye = dr[11].ToString().Replace("<a>", "(vurgula!)"); // Burası filmin künyesinde beyaz renk görünen kısımlar için. injectiona karşı güvenliği kapatmak yerine bu yöntemi tercih ettim
                        kunye = kunye.Replace("</a>", "(!vurgula)");
                        bilgiler_bolumu_TextBox11.Text = kunye;//künye
                        bilgiler_bolumu_TextBox12.Text = dr[12].ToString();//yapım
                        bilgiler_bolumu_TextBox13.Text = dr[13].ToString();//yonetmen
                        bilgiler_bolumu_TextBox14.Text = dr[14].ToString();//oyuncular
                        
                    }
                    }
                }
            }else
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                CheckboxOlustur();
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
               Response.Redirect("Admin.aspx");
           }
           
       }
       protected void Button1_Click(object sender, EventArgs e)
       {
           if (bilgiler_bolumu_TextBox11.Text != "")
           {
               try
               {
                   bool ykatsec=false;
                   for (int i = 0; i < checkbox_bolum_CheckBoxList1.Items.Count; i++)
                   {
                     ykatsec = checkbox_bolum_CheckBoxList1.Items[i].Selected;
                      if (ykatsec == true)
                          break;
                   }
                   if (ykatsec == false)
                   {
                       Label1.ForeColor = Color.Orange;
                       Label1.Text = "Filme birkaç kategori ekleyin";
                   }
                   else
                   {
                       bool kattdub = checkbox_bolum_CheckBoxList1.Items[46].Selected;
                       bool kattalt = checkbox_bolum_CheckBoxList1.Items[12].Selected;
                       string film_ses;
                       if(kattdub == true & kattalt==true)
                       {
                           Label1.ForeColor = Color.Orange;
                           Label1.Text = "Aynı anda türkçe dublaj ve altyazı seçili";
                       }
                       else
                       {

                           if (kattdub == true)
                        {
                            film_ses = "../images/tr_dublaj.png";
                        }
                           else if (kattalt==true)
                        {
                            film_ses = "../images/tr_altyazi.png";
                        }
                           else
                           {
                               film_ses = "";
                           }
                       if(bilgiler_bolumu_TextBox3.Text=="")
                       {
                           bilgiler_bolumu_TextBox3.Text = "0";
                       }
                       int tb3 = int.Parse(bilgiler_bolumu_TextBox3.Text);
                       bilgiler_bolumu_TextBox11.Text = bilgiler_bolumu_TextBox11.Text.Replace("(vurgula!)", "<a>");
                       bilgiler_bolumu_TextBox11.Text = bilgiler_bolumu_TextBox11.Text.Replace("(!vurgula)", "</a>");
                       bilgiler_bolumu_TextBox11.Text = bilgiler_bolumu_TextBox11.Text.Replace("'", "''");
                       int i = clsSabitler.veritabani.NonSqlCalistir("INSERT INTO tbl_filmler (film_adi,film_izlenme,film_resim,film_seslendirme,film_imdb_puani,film_aciklama,film_link_fragman,film_link,film_kunye,film_yapim,film_yonetmen,film_oyuncular) VALUES('"
                           + bilgiler_bolumu_TextBox2.Text + "'," + tb3 + ",'../film_images/" + bilgiler_bolumu_TextBox4.Text + "','" + film_ses + "','" + bilgiler_bolumu_TextBox6.Text.Replace(",", ".")
                           + "','" + bilgiler_bolumu_TextBox7.Text + "','" + bilgiler_bolumu_TextBox8.Text + "','" + bilgiler_bolumu_TextBox9.Text + "','" + bilgiler_bolumu_TextBox11.Text + "','" + bilgiler_bolumu_TextBox12.Text + "','" + bilgiler_bolumu_TextBox13.Text + "','" + bilgiler_bolumu_TextBox14.Text + "')");
                       if (i > 0)
                       {
                           Label1.ForeColor = Color.Green;
                           Label1.Text = "İşlem başarılı";
                           bilgiler_bolumu_TextBox11.Text = "";
                           bilgiler_bolumu_TextBox3.Text = "";
                           SqlDataReader dr_yf;
                           dr_yf = clsSabitler.veritabani.SqlCalistir("Select * FROM tbl_filmler ORDER BY film_ref_id DESC");
                           if(dr_yf.HasRows==true)
                           {
                               dr_yf.Read();
                               string id = dr_yf[0].ToString();
                               CheckboxGuncelle(id);
                           }
                       }
                       else
                       {
                           Label1.ForeColor = Color.Orange;
                           Label1.Text = "İşlem tamamlanmadı";
                       }
                       GridYukleAltMenu();
                       }
                   }
               }
               catch (Exception)
               {
                   Label1.ForeColor = Color.Yellow;
                   Label1.Text = "Girdiğiniz bilgileri kontrol edin";
               }
           }
           else
           {
               Label1.ForeColor = Color.Orange;
               Label1.Text = "Filmin künyesi boş olmamalı";
           }
      
       }
       protected void Button2_Click(object sender, EventArgs e)
       {
           if(bilgiler_bolumu_TextBox11.Text != "")
           {

               try
               {
                   bool ykatsec = false;
                   for (int i = 0; i < checkbox_bolum_CheckBoxList1.Items.Count; i++)
                   {
                       ykatsec = checkbox_bolum_CheckBoxList1.Items[i].Selected;
                       if (ykatsec == true)
                           break;
                   }
                   if (ykatsec == false)
                   {
                       Label1.ForeColor = Color.Orange;
                       Label1.Text = "Filme birkaç kategori ekleyin";
                   }
                   else
                   {
                       bool kattdub = checkbox_bolum_CheckBoxList1.Items[46].Selected;
                       bool kattalt = checkbox_bolum_CheckBoxList1.Items[12].Selected;
                       string film_ses;
                       if (kattdub == true & kattalt == true)
                       {
                           Label1.ForeColor = Color.Orange;
                           Label1.Text = "Aynı anda türkçe dublaj ve altyazı seçili";
                       }
                       else
                       {

                           if (kattdub == true)
                           {
                               film_ses = "../images/tr_dublaj.png";
                           }
                           else if (kattalt == true)
                           {
                               film_ses = "../images/tr_altyazi.png";
                           }
                           else
                           {
                               film_ses = "";
                           }
                           if (bilgiler_bolumu_TextBox3.Text == "")
                           {
                               bilgiler_bolumu_TextBox3.Text = "0";
                           }
                           int tb3 = int.Parse(bilgiler_bolumu_TextBox3.Text);
                           bilgiler_bolumu_TextBox11.Text = bilgiler_bolumu_TextBox11.Text.Replace("(vurgula!)", "<a>");
                           bilgiler_bolumu_TextBox11.Text = bilgiler_bolumu_TextBox11.Text.Replace("(!vurgula)", "</a>");
                           bilgiler_bolumu_TextBox11.Text = bilgiler_bolumu_TextBox11.Text.Replace("'", "''");
                           string SQL = "UPDATE tbl_filmler SET film_adi='" + bilgiler_bolumu_TextBox2.Text
                            + "',film_izlenme=" + tb3
                            + ",film_resim='../film_images/" + bilgiler_bolumu_TextBox4.Text + "',film_seslendirme='"
                            + film_ses + "',film_imdb_puani='" + bilgiler_bolumu_TextBox6.Text.Replace(",", ".")
                            + "',film_aciklama='" + bilgiler_bolumu_TextBox7.Text + "',film_link_fragman='" + bilgiler_bolumu_TextBox8.Text
                            + "',film_link='" + bilgiler_bolumu_TextBox9.Text + "',film_kunye='" + bilgiler_bolumu_TextBox11.Text + "',film_yapim='"
                            + bilgiler_bolumu_TextBox12.Text + "',film_yonetmen='" + bilgiler_bolumu_TextBox13.Text + "',film_oyuncular='"
                            + bilgiler_bolumu_TextBox14.Text + "' WHERE film_ref_id=" + bilgiler_bolumu_TextBox1.Text;
                           int i = clsSabitler.veritabani.NonSqlCalistir(SQL);
                           if (i > 0)
                           {
                               Label1.ForeColor = Color.Green;
                               Label1.Text = "İşlem başarılı";
                               bilgiler_bolumu_TextBox11.Text = "";
                               bilgiler_bolumu_TextBox3.Text = "";
                               SqlDataReader dr_yf;
                               dr_yf = clsSabitler.veritabani.SqlCalistir("Select * FROM tbl_filmler ORDER BY film_ref_id DESC");

                               if (dr_yf.HasRows == true)
                               {
                                   dr_yf.Read();
                                   string id = dr_yf[0].ToString();
                                   CheckboxGuncelle(id);
                               }
                           }
                           else
                           {
                               Label1.ForeColor = Color.Orange;
                               Label1.Text = "İşlem tamamlanmadı";
                           }
                           
                           GridYukleAltMenu();
                       }
                   }
               }
               catch (Exception)
               {
                   Label1.ForeColor = Color.Yellow;
                   Label1.Text = "Girdiğiniz bilgileri kontrol edin";
               }
           }
           else
           {
               Label1.ForeColor = Color.Orange;
               Label1.Text = "Devam etmeden önce bir film seçin";
           }
       }
       protected void Button3_Click(object sender, EventArgs e)
       {
           int i = clsSabitler.veritabani.NonSqlCalistir("DELETE FROM tbl_filmler WHERE film_ref_id=" + bilgiler_bolumu_TextBox1.Text);
           if (i > 0)
           {
               string resim_dy = MapPath("/film_images/" + bilgiler_bolumu_TextBox4.Text);
               if (File.Exists(resim_dy))
                   File.Delete(resim_dy);
               Label1.Text = "";
               Label1.ForeColor = Color.Green;
               Label1.Text = "İşlem başarılı";
           }
           else
           {
               Label1.ForeColor = Color.Orange;
               Label1.Text = "İşlem tamamlanmadı";
           }
           GridYukleAltMenu();
       }

       protected void Button4_Click(object sender, EventArgs e)
       {
           if (FileUpload1.HasFile)
           {
               FileUpload1.SaveAs(MapPath("film_images/" + FileUpload1.FileName));
               uplad_bolum_Image2.ImageUrl = "film_images/" + FileUpload1.FileName;
               Label1.ForeColor = Color.Green;
               Label1.Text = "Resim yüklendi";
               bilgiler_bolumu_TextBox4.Text = FileUpload1.FileName;
           }
       }

       protected void Button5_Click(object sender, EventArgs e)
       {
           string resim_dy = MapPath("film_images/" + bilgiler_bolumu_TextBox4.Text);
           if (File.Exists(resim_dy))
           {
               File.Delete(resim_dy);
               bilgiler_bolumu_TextBox4.Text = "";
               uplad_bolum_Image2.ImageUrl = "";
               Label1.ForeColor = Color.Green;
               Label1.Text = "Resim silindi";
           }
           else
           {
               Label1.ForeColor = Color.Orange;
               Label1.Text = "Resim silinemedi";
           }

       }
       private void CheckboxOlustur()
       {
           string id = Request.QueryString["film_id"];
           string kategoriler = "";
           SqlDataReader dr,dr_;
           if (id != null)
           { 
           dr_ = clsSabitler.veritabani.SqlCalistir("SELECT * FROM View_filmler_ve_kategoriler Where film_ref_id=" + id);
           while (dr_.Read())
           {
               kategoriler += dr_[16].ToString() + ",";
           }
               if(kategoriler=="")
               {// Eski kategorisiz filmler
                   Response.Redirect("Users.aspx");
               }
               kategoriler = kategoriler.Remove(kategoriler.Length - 1);
           }

           dr = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_kategoriler");
           while (dr.Read())
           {
               ListItem item = new ListItem();
               item.Text = dr[1].ToString();
               item.Value = dr[0].ToString();
               if (kategoriler.Contains(item.Text))
                   item.Selected = true;
               checkbox_bolum_CheckBoxList1.Items.Add(item);
           }
       } // www.aspsnippets.com/Articles/Bind-CheckBoxList-from-Database-in-ASPNet.aspx  checkbıxlist örneğini burdan öğrendim ancak seçili olanların atamaları kendi fikrim.
       private void CheckboxGuncelle(string id)
       {
           SqlDataReader dr;
           for (int i = 0; i < checkbox_bolum_CheckBoxList1.Items.Count; i++)
           {
               dr = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_filmler_ve_kategoriler Where film_ref_id="+id+" AND kategori_ref_id=" + checkbox_bolum_CheckBoxList1.Items[i].Value);
               if (dr.HasRows == true)
               {
                   if (checkbox_bolum_CheckBoxList1.Items[i].Selected == false)
                   {
                       int j = clsSabitler.veritabani.NonSqlCalistir("DELETE FROM tbl_filmler_ve_kategoriler WHERE film_ref_id="+id+" AND kategori_ref_id=" + checkbox_bolum_CheckBoxList1.Items[i].Value);
                   }
               }
               else
               {
                   if (checkbox_bolum_CheckBoxList1.Items[i].Value != "1" && checkbox_bolum_CheckBoxList1.Items[i].Selected == true) // 1. kategoriyi çıkattım çünkü filmlerin tamamı filmler kategorisine giriyor. Ama sitede filmler diye kategori olduğundan ben de ekledim. Ayrıca bunu iptal ederseniz kod hatalı çalışır.
                   {
                       int k = clsSabitler.veritabani.NonSqlCalistir("INSERT INTO tbl_filmler_ve_kategoriler(film_ref_id,kategori_ref_id) VALUES("+id+"," + checkbox_bolum_CheckBoxList1.Items[i].Value + ")");
                   }
               }
           }
       }
    }
    
}