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
using System.Diagnostics;

namespace QuanLyPhanCongCanBo
{
    public partial class BaoCaoTheoHoiDongg : Form
    {
        public BaoCaoTheoHoiDongg()
        {
            InitializeComponent();
        }

        String constr = ConfigurationManager.ConnectionStrings["db_quanLyThi"].ConnectionString;


        private void BaoCaoTheoHoiDongg_Load(object sender, EventArgs e)
        {
            loadCombobox();
        }

        void loadCombobox()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select * from tblhoidong";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();

                    dap.Fill(data);

                    cbbHoiDong.DataSource = data;///
                    cbbHoiDong.DisplayMember = "stenHoiDong";
                    cbbHoiDong.ValueMember = "iMaHoiDong";

                }
            }
        }


        private void btnBaoCao_Click(object sender, EventArgs e)
        {
          
        }

        private void BaoCaoTienCongTheoHoiDong_Load_1(object sender, EventArgs e)
        {
            
        }

        private void btnBaoCao_Click_1(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cnn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_baoCaoTienCongTheoHoiDong";
                        cmd.Parameters.AddWithValue("@id", (cbbHoiDong.SelectedValue));
                        // cmd.Parameters.AddWithValue("@ngayKetThuc", DateTime.Parse(txtNgayKetThuc.Text));
                        SqlDataAdapter dap = new SqlDataAdapter(cmd);
                        DataTable data = new DataTable();
                        dap.Fill(data);
                        BaoCaoTienCongTheoHoiDong report = new BaoCaoTienCongTheoHoiDong();
                        report.SetDataSource(data);
                        crystalReportViewer1.ReportSource = report;

                    }
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine(exx.Message);
            }
        }
    }
}
