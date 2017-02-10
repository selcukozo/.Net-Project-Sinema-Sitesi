using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace SinemaSitesi
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            string SQLSERVER = ConfigurationManager.AppSettings["SQLSERVER"].ToString();
            string VERITABANI = ConfigurationManager.AppSettings["VERITABANI"].ToString();
            clsSabitler.veritabani = new DatabaseBaglanti.clsDb(SQLSERVER, VERITABANI);

            clsSifreleme sif = new clsSifreleme();

            //string a = sif.TextSifrele("Selcuk");
            string b = sif.TextSifreCoz(ConfigurationManager.AppSettings["USER"].ToString());
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}