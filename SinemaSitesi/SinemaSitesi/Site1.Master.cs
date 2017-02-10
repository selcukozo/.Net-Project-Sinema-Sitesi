using SinemaSitesi.cls;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinemaSitesi
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void popup_login_Button1_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_kul WHERE kul_username='" +
            popup_login_TextBox1.Text + "' AND kul_password='" + popup_login_TextBox2.Text + "'");
            if(dr.HasRows==true)
            {
                dr.Read();
                Kullanici k = new Kullanici();
                k.kul_id=int.Parse(dr[0].ToString());
                k.kul_adi=dr[1].ToString();
                k.kul_soyadi=dr[2].ToString();
                k.kul_username = dr[3].ToString();
                k.kul_password = dr[4].ToString();
                k.kul_last_login = dr[7].ToString();
                k.Set_lastLogin(k.kul_id);
                Session["User"] = k;
                Response.Redirect("Users.aspx");
            }else
            {
                //Hatalı kullanıcı adı ve ya şifre olayında random güvenlik sorusu yapılabilirdim bu kısım sadece yapılabilirliği göstermek için
                if( popup_login_Label1.Text =="")
                {
                popup_login_Label1.ForeColor = Color.Green;
                popup_login_Label1.Text = "Kullanıcı adı veya parola yanlış";
                }
                else if (popup_login_Label1.ForeColor == Color.Green)
                {
                    popup_login_Label1.ForeColor = Color.Orange;
                }
                else if (popup_login_Label1.ForeColor == Color.Orange)
                {
                    popup_login_Label1.ForeColor = Color.Red;
                }else if(popup_login_Label1.ForeColor == Color.Red)
                {
                    popup_login_Label1.Text = "Çok fazla hatalı giriş!";
                }
            }
        }
        

      
    }
}