using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SinemaSitesi.cls
{
    public class Kullanici
    {
        public int kul_id { get; set; }
        public string kul_adi { get; set; }
        public string kul_soyadi { get; set; }
        public string kul_username { get; set; }
        public string kul_password { get; set; }
        public string kul_last_login { get; set; }
        public string kul_email { get; set; }
        public int Create_User(Kullanici k)
        {
            string _SQL = "SET DATEFORMAT DMY;INSERT INTO tbl_kul(kul_adi,kul_soyadi,kul_username,kul_password,kul_email,kul_is_active,kul_last_login)";
            _SQL += "VALUES(";
            _SQL += "'" + k.kul_adi + "',";
            _SQL += "'" + k.kul_soyadi + "',";
            _SQL += "'" + k.kul_username + "',";
            _SQL += "'" + k.kul_password + "',";
            _SQL += "'" + k.kul_email+"',";
            _SQL += "1,'";
            _SQL += DateTime.Now+"')";
            return clsSabitler.veritabani.NonSqlCalistir(_SQL);
        }
        public void Set_lastLogin(int id)
        {
            int i = clsSabitler.veritabani.NonSqlCalistir
                ("SET DATEFORMAT DMY;UPDATE tbl_kul SET kul_last_login='"+
                DateTime.Now+"',kul_is_active=1 WHERE kul_id="+id);
            Set_logGenel(id, "Giriş yapıldı", 1);
        }
        public void Set_logOut(int id)
        {
            Set_logGenel(id, "Çıkış yapıldı", 0);
            int j = clsSabitler.veritabani.NonSqlCalistir("UPDATE tbl_kul SET kul_is_active=0 WHERE kul_id=" + id); //son dkda gördüm
        }
        public void Set_logGenel(int id, string _aciklama, int _logTipi)
        {
            int i = clsSabitler.veritabani.NonSqlCalistir
                ("INSERT INTO tbl_log_kul(log_aciklama,log_tipi,log_kul_id) VALUES ('" + _aciklama + "',"
                + _logTipi+","+id+ ")");
        }
    }
}