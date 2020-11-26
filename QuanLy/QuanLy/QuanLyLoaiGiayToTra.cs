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
    public partial class QuanLyLoaiGiayToTra : Form
    {
        public QuanLyLoaiGiayToTra()
        {
            InitializeComponent();
        }


        String constr = ConfigurationManager.ConnectionStrings["db_ql"].ConnectionString;


        private void btnThem_Click(object sender, EventArgs e)
        {

            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_themLoaiGTtra";
                    cmd.Parameters.AddWithValue("@ten", txtTen.Text);
                    cmd.Parameters.AddWithValue("@tien", txtTienPhi.Text);
                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                        MessageBox.Show("Thêm Loại Giấy Tờ Trả Thành Công", "Thông Báo");
                        loadGrid();
                        txtTen.Text = "";
                        txtTienPhi.Text = "";
                    }
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có Muốn Xoá Loại Giấy Tờ:  " + dataGridView1.CurrentRow.Cells["Tên Loại"].Value.ToString(), "Thông Báo",
  MessageBoxButtons.YesNo, MessageBoxIcon.Question,
  MessageBoxDefaultButton.Button1) == System.Windows.Forms.DialogResult.Yes)
            {
                try
                {
                    using (SqlConnection cnn = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = cnn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "sp_xoaLoaiGTtra";
                            cmd.Parameters.AddWithValue("@maLoai", dataGridView1.CurrentRow.Cells["iMaLoaiGiayToTra"].Value.ToString());

                            cnn.Open();
                            int i_ = cmd.ExecuteNonQuery();
                            if (i_ > 0)
                            {
                                MessageBox.Show("Xoá Loại Giấy Tờ Trả Thành Công", "Thông Báo");
                                loadGrid();
                                txtTen.Text = "";
                                txtTienPhi.Text = "";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Xoá Loại Giáy Tờ Không Thành Công", "Thông Báo");
                }
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_suaLoaiGTtra";
                    cmd.Parameters.AddWithValue("@ten", txtTen.Text);
                    cmd.Parameters.AddWithValue("@tien",Int32.Parse(txtTienPhi.Text));
                    cmd.Parameters.AddWithValue("@maLoai", Convert.ToInt32(dataGridView1.CurrentRow.Cells["iMaLoaiGiayToTra"].Value.ToString()));

                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                        MessageBox.Show("Sửa Loại Giấy Tờ Trả Thành Công", "Thông Báo");
                        loadGrid();
                        txtTen.Text = "";
                        txtTienPhi.Text = "";
                    }
                }
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtTen.Text = dataGridView1.CurrentRow.Cells["Tên Loại"].Value.ToString();
            txtTienPhi.Text = dataGridView1.CurrentRow.Cells["Tiền Phí"].Value.ToString();
        }

        private void QuanLyLoaiGiayToTra_Load(object sender, EventArgs e)
        {
                loadGrid();
        }

        private void loadGrid()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsLoaiGTtra";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);

                    dataGridView1.DataSource = data;
                }
            }
            dataGridView1.Columns["iMaLoaiGiayToTra"].Visible = false;
        }

        private void txtTienPhi_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(Char.IsDigit(e.KeyChar) || (e.KeyChar == (char)Keys.Back)))
                e.Handled = true;
        }
    }
}
