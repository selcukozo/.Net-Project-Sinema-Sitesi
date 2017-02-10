using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseBaglanti
{
    public class clsDb
    {

        public string SunucuAdi { get; set; }
        public string VeritabaniAdi { get; set; }

        SqlConnection baglanti;
        public clsDb(string _SunucuAdi, string _VeritabaniAdi)
        {
            SunucuAdi = _SunucuAdi;
            VeritabaniAdi = _VeritabaniAdi;
            baglanti = new SqlConnection(@"Data Source=" + SunucuAdi + ";Initial Catalog=" + VeritabaniAdi + ";Integrated Security=True;MultipleActiveResultSets=True");
            BaglantiAc();
        }
        private void BaglantiAc()
        {
            if (baglanti.State == System.Data.ConnectionState.Open)
            {
                baglanti.Close();
                baglanti.Open();
            }
            else if (baglanti.State == System.Data.ConnectionState.Closed)
            {
                baglanti.Open();
            }
        }
        public SqlDataReader SqlCalistir(string _sql)
        {
            SqlCommand komut = new SqlCommand();
            SqlDataReader dr;
            komut.CommandText = _sql;
            komut.Connection = baglanti;

            dr = komut.ExecuteReader();
            return dr;
        }
        public DataSet DataSetYukle(string _sql, string _TabloAdi)
        {
            SqlDataAdapter da = new SqlDataAdapter(_sql, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds, _TabloAdi);
            return ds;
        }
        public int NonSqlCalistir(string _sql)
        {
            SqlCommand komut = new SqlCommand();
            komut.CommandText = _sql;
            komut.Connection = baglanti;
            int i = komut.ExecuteNonQuery();
            return i;
        }
    }

}