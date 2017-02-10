using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinemaSitesi
{
    public partial class uc_carousel : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataReader dr;
            //SELECT TOP 8  * FROM tbl_filmler ORDER BY film_ref_id DESC en son eklenen filmleri ya da orjinal sitedeki slider kategorisine düşen filmler gösterilebilir. ilk hali www.dynamicdrive.com/dynamicindex4/stepcarousel.htm
            dr = clsSabitler.veritabani.SqlCalistir("SELECT * FROM tbl_filmler ORDER BY film_ref_id DESC");
            string _menu = "";
            
            while(dr.Read())
            {
                _menu += "<a href='Movies.aspx?film_id=" + dr[0].ToString() + "'><div class=panel>";
                _menu += "<img height=186px width=108px src=" + dr[3].ToString()+ "><img/>";
                _menu += "<div class=carousel_izlenme>";
                _menu += "<p>" + dr[2].ToString()+ " izlenme</p>";
                _menu += "</div>";
                _menu += "</div></a>";
            }
            Literal1.Text = _menu;
        }
    }
}