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
    public partial class uc_film_yorum : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string b1, b2, b3, b4, b5;
            bool tek = true;
            Kullanici k_ucy = new Kullanici();
            k_ucy = (Kullanici)Session["User"];
            string id = Request.QueryString["film_id"];
            SqlDataReader dr_ucy;
            dr_ucy = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_yorumlar WHERE film_ref_id=" + id+" ORDER BY yorum_tarihi DESC");
            while(dr_ucy.Read())
            {
                if(dr_ucy[3].ToString()=="False")
               {

                
                if(tek == true)
                {
                    b1 = "<a name='yorumNo" + dr_ucy[0].ToString()+ "'><div class='YorumBolum_tum_yorumlar_icerik_tek'><div class='YorumBolum_tum_yorumlar_resim'></div>";
                    tek = false;
                }
                else
                {
                    b1 = "<a name='yorumNo"+dr_ucy[0].ToString()+"'><div class='YorumBolum_tum_yorumlar_icerik_cift'><div class='YorumBolum_tum_yorumlar_resim'></div>";
                    tek = true;
                }
                b2 = "<h2>" + k_ucy.kul_username + " - </h2>";
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
                b3 = "<h3>" + tarih + " önce demiş ki:</h3>";
                DateTime tarih_ = Convert.ToDateTime(dr_ucy[2].ToString());
                b4 ="<h4>"+ tarih_.ToLongDateString()+" günü yazıldı.</h4>";
                b5 = "<div class='YorumBolum_tum_yorumlar_icerik_yazi'><p>"
                 +dr_ucy[1].ToString()+" </p></div></div></a>";
                Label1.Text += b1 + b2 + b3 + b4 + b5;
              }
            }
            
        }
    }
}