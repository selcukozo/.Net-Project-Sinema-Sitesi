using SinemaSitesi.cls;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinemaSitesi
{
    public partial class uc_user_create_popup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox1.Text = TextBox1.Text.Replace("'", "''");
            TextBox2.Text = TextBox2.Text.Replace("'", "''");
            TextBox3.Text = TextBox3.Text.Replace("'", "''");
            TextBox4.Text = TextBox4.Text.Replace("'", "''");
            TextBox5.Text = TextBox5.Text.Replace("'", "''");

            //Regex Rgxtxt1 = new Regex("[^a-zA-Z0-9]+$");
            
            //if(!TextBox5.Text.Contains("@"))
            //{
            //    Label1.Text = "gecersiz eposta";
            //    Response.Redirect("Default.aspx");
            //}
            Kullanici _k = new Kullanici();
            _k.kul_adi = TextBox1.Text;
            _k.kul_soyadi = TextBox2.Text;
            _k.kul_username = TextBox3.Text;
            _k.kul_password = TextBox4.Text;
            _k.kul_email = TextBox5.Text;

            if(_k.Create_User(_k)>0)
            {
                SqlDataReader dr;
                dr = clsSabitler.veritabani.SqlCalistir("SELECT kul_id FROM tbl_kul WHERE kul_username='"+TextBox3.Text+"' and kul_email='"+TextBox5.Text+"'");
                if (dr.HasRows == true)
                {
                    dr.Read();
                    _k.kul_id = int.Parse(dr[0].ToString());
                    _k.Set_lastLogin(_k.kul_id);
                }
                Session["User"] = _k;
                Response.Redirect("Users.aspx");
             }
             else
             {
                    Response.Redirect("Default.aspx");
             }
            }
        }
}