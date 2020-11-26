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
using System.Globalization;

namespace QuanLy
{
    public partial class DanhSachHoSo : Form
    {
        public DanhSachHoSo()
        {
            InitializeComponent();
        }

        String constr = ConfigurationManager.ConnectionStrings["db_ql"].ConnectionString;

        private void DanhSachHoSo_Load(object sender, EventArgs e)
        {
            loadGrid();
            panel1.Visible = false;
        }

        void loadGrid()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsHoSo";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);

                    dataGridView1.DataSource = data;
                }
            }
            dataGridView1.Columns["iMaHoSo"].Visible = false;
            dataGridView1.Columns["bTrangThai"].Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ThongTinHoSo f = new ThongTinHoSo();
            f.maHoSo = dataGridView1.CurrentRow.Cells["iMaHoSo"].Value.ToString();
            f.MdiParent = this.MdiParent;
            f.Show();
            this.Hide();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {

                panel1.Visible = true;
            Debug.WriteLine(Boolean.Parse(dataGridView1.CurrentRow.Cells["bTrangThai"].Value.ToString()));
            if (Boolean.Parse(dataGridView1.CurrentRow.Cells["bTrangThai"].Value.ToString()) == false)
            {
                rdbDaNhan.Checked = true;
                btnXacNhan.Visible = true;
            }
            else
            {
                Debug.WriteLine("t");
                rdbDaTra.Checked = true;
                btnXacNhan.Visible = false;
            }
            }
            catch (Exception ex)
            {
                ///  MessageBox.Show("Xoá Loại HS Không Thành Công", "Thông Báo");
            }
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {

            CultureInfo elGR = CultureInfo.CreateSpecificCulture("el-GR");
            if (MessageBox.Show("Xác Nhận Trả Kết Quả Cho Công Dân " + dataGridView1.CurrentRow.Cells["Công Dân"].Value.ToString() + " Và Thu Phí "+ String.Format(elGR, "{0:0,0}", Int32.Parse(dataGridView1.CurrentRow.Cells["Tiền Phí"].Value.ToString())) + " VNĐ", "Thông Báo",
  MessageBoxButtons.YesNo, MessageBoxIcon.Question,
  MessageBoxDefaultButton.Button1) == System.Windows.Forms.DialogResult.Yes)
            {
                
                        using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_updateTrahoSo";
                        cmd.Parameters.AddWithValue("@id", dataGridView1.CurrentRow.Cells["iMaHoSo"].Value.ToString());
                        cnn.Open();
                        int i_ = cmd.ExecuteNonQuery();
                        if (i_ > 0)
                        {
                            loadGrid();
                            panel1.Visible = false;

                        }
                    }
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
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_timHoSo";
                    cmd.Parameters.AddWithValue("@id", Int32.Parse(txtMa.Text));
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);

                    dataGridView1.DataSource = data;
                }
            }
                panel1.Visible = false;
                dataGridView1.Columns["iMaHoSo"].Visible = false;
            dataGridView1.Columns["bTrangThai"].Visible = false;
            }
            catch (Exception ex)
            {
              ///  MessageBox.Show("Xoá Loại HS Không Thành Công", "Thông Báo");
            }
        }
    }
}
