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
    public partial class QuanLyGiayToNhan : Form
    {
        public QuanLyGiayToNhan()
        {
            InitializeComponent();
        }

        String constr = ConfigurationManager.ConnectionStrings["db_ql"].ConnectionString;


        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtTen.Text = dataGridView1.CurrentRow.Cells["Tên Loại"].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_themLoaiGTnhan";
                    cmd.Parameters.AddWithValue("@ten", txtTen.Text);

                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                        MessageBox.Show("Thêm Loại Giấy Tờ Nhận Thành Công", "Thông Báo");
                        loadGrid();
                        txtTen.Text = "";
                    }
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
                    cmd.CommandText = "sp_suaLoaiGTnhan";
                    cmd.Parameters.AddWithValue("@ten", txtTen.Text);
                    cmd.Parameters.AddWithValue("@maLoai", Convert.ToInt32(dataGridView1.CurrentRow.Cells["iMaLoaiGiayToNhan"].Value.ToString()));

                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                        MessageBox.Show("Sửa Loại Giấy Tờ Nhận Thành Công", "Thông Báo");
                        loadGrid();
                        txtTen.Text = "";
                    }
                }
            }
        }

        private void QuanLyGiayToNhan_Load(object sender, EventArgs e)
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
                    cmd.CommandText = "sp_dsLoaiGTnhan";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);

                    dataGridView1.DataSource = data;
                }
            }
            dataGridView1.Columns["iMaLoaiGiayToNhan"].Visible = false;
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
                            cmd.CommandText = "sp_xoaLoaiGTnhan";
                            cmd.Parameters.AddWithValue("@maLoai", dataGridView1.CurrentRow.Cells["iMaLoaiGiayToNhan"].Value.ToString());

                            cnn.Open();
                            int i_ = cmd.ExecuteNonQuery();
                            if (i_ > 0)
                            {
                                MessageBox.Show("Xoá Loại GIấy Tờ Nhận Thành Công", "Thông Báo");
                                loadGrid();
                                txtTen.Text = "";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Xoá Loại HS Không Thành Công", "Thông Báo");
                }
            }
        }
    }
}
