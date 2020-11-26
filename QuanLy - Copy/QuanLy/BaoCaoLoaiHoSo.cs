
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CrystalDecisions.CrystalReports.Engine;
using System.Globalization;

namespace QuanLy
{
    public partial class BaoCaoLoaiHoSo : Form
    {
        public BaoCaoLoaiHoSo()
        {
            InitializeComponent();
        }
        String constr = ConfigurationManager.ConnectionStrings["db_ql"].ConnectionString;

        private void loadLoaiHS()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsLoaiHS";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    cbbHso.DataSource = data;
                    cbbHso.ValueMember = "iMaLoaiHoSo";
                    cbbHso.DisplayMember = "sTenLoaiHoSo";
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_thongKeHoSoTHeoNgay_1";

                 //   cmd.Parameters.AddWithValue("@id", cbbHso.SelectedValue);
                    cmd.Parameters.AddWithValue("@ngayBatDau", DateTime.Parse(maskedTextBoxTuNgay.Text));
                    cmd.Parameters.AddWithValue("@ngayKetThuc", DateTime.Parse(maskedTextBoxDenNgay.Text));
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    dataGridView1.DataSource = data;
                      
                        //BaoCaoTheoLoaiHoSo report = new BaoCaoTheoLoaiHoSo();
                        //report.SetDataSource(data);
                        //crystalReportViewer1.ReportSource = report;

                    }
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        private void BaoCaoLoaiHoSo_Load(object sender, EventArgs e)
        {
          //  loadLoaiHS();
            maskedTextBoxTuNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
            maskedTextBoxDenNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");



        }
    }
}
