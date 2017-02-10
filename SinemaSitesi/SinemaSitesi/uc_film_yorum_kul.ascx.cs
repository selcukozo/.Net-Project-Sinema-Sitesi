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
    public partial class uc_film_yorum_kul : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string b1, b2, b3, b4, b5;
            bool tek = true;
            Kullanici k_ucy = new Kullanici();
            k_ucy = (Kullanici)Session["User"];
            SqlDataReader dr_ucy;
            dr_ucy = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_yorumlar WHERE kul_id=" + k_ucy.kul_id + " ORDER BY yorum_tarihi DESC");
            while (dr_ucy.Read())
            {
                if (dr_ucy[3].ToString() == "False")
                {


                    if (tek == true)
                    {
                        b1 = "<a href='Movies.aspx?film_id=" + dr_ucy[4].ToString() + "#yorumNo" + dr_ucy[0].ToString() + "'><div class='YorumBolum_tum_yorumlar_icerik_tek'><div class='YorumBolum_tum_yorumlar_resim'></div>";
                        tek = false;
                    }
                    else
                    {
                        b1 = "<a href='Movies.aspx?film_id=" + dr_ucy[4].ToString()+"#yorumNo" + dr_ucy[0].ToString()+"'><div class='YorumBolum_tum_yorumlar_icerik_cift'><div class='YorumBolum_tum_yorumlar_resim'></div>";
                        tek = true;
                    }
                    b2 = "<h5>" + k_ucy.kul_username + " - </h5>";
                    TimeSpan ts_ = DateTime.Now - Convert.ToDateTime(dr_ucy[2].ToString());
                    string tarih;
                    if (ts_.TotalDays < 1)
                    {
                        if (ts_.TotalHours < 1)
                        {
                            tarih = Convert.ToString(Math.Floor(double.Parse(ts_.TotalMinutes.ToString()))) + " dakika";

                        }
                        else
                        {
                            tarih = Convert.ToString(Math.Floor(double.Parse(ts_.TotalHours.ToString()))) + " saat";
                        }

                    }
                    else
                    {
                        tarih = Convert.ToString(Math.Floor(double.Parse(ts_.TotalDays.ToString()))) + " gün";
                    }
                    SqlDataReader dr_ucyfi;
                    dr_ucyfi = clsSabitler.veritabani.SqlCalistir("Select * From tbl_filmler Where film_ref_id="+dr_ucy[4].ToString());
                    string film_adi = "";
                    if (dr_ucyfi.HasRows==true)
                    {
                        dr_ucyfi.Read();
                        film_adi= dr_ucyfi[1].ToString();
                     }
                    b3 = "<h3>" + tarih + " önce " + film_adi +" filmi için demişiniz ki:</h3>";
                    DateTime tarih_ = Convert.ToDateTime(dr_ucy[2].ToString());
                    b4 = "<h4>" + tarih_.ToLongDateString() + " günü yazdınız.</h4>";
                    b5 = "<div class='YorumBolum_tum_yorumlar_icerik_yazi'><p>"
                     + dr_ucy[1].ToString() + " </p></div></div></a>";
                    Label1.Text += b1 + b2 + b3 + b4 + b5;
                }
            }
            Label1.Text = "<div class=YorumBolum_tum_yorumlar>" + Label1.Text + "</div>";

        }
    }
}