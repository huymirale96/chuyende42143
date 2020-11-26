using System;
using System.Collections.Generic;
using System.ComponentModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

using System.Diagnostics;

namespace QuanLy
{
    public partial class BaoCaoHoSo : Form
    {
        public BaoCaoHoSo()
        {
            InitializeComponent();
        }

        String constr = ConfigurationManager.ConnectionStrings["db_ql"].ConnectionString;


        private void button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_thongKeHoSo";

                    //   cmd.Parameters.AddWithValue("@id", cbbHso.SelectedValue);
                    cmd.Parameters.AddWithValue("@ngayBatDau", DateTime.Parse(maskedTextBoxTuNgay.Text));
                    cmd.Parameters.AddWithValue("@ngayKetThuc", DateTime.Parse(maskedTextBoxDenNgay.Text));
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    BaoCaoDanhSachHoSo report = new BaoCaoDanhSachHoSo();
                    report.SetDataSource(data);
                    crystalReportViewer1.ReportSource = report;

                }
            }
        }

        private void BaoCaoHoSo_Load(object sender, EventArgs e)
        {
            maskedTextBoxTuNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
            maskedTextBoxDenNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }
}
