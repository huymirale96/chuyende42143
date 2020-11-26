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


namespace QuanLyPhanCongCanBo
{
    public partial class QuanLyCanBo : Form
    {
        public QuanLyCanBo()
        {
            InitializeComponent();
        }


        String constr = ConfigurationManager.ConnectionStrings["db_quanLyThi"].ConnectionString;


        private void QuanLyCanBo_Load(object sender, EventArgs e)
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
                    cmd.CommandText = "sp_dsCanBo";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    dataGridView1.DataSource = data;///
                }
            }
            dataGridView1.Columns["iMaCanBo"].Visible = false;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtDiaChi.Text.Length != 0 && txtEmail.Text.Length != 0 && txtSĐT.Text.Length != 0 && txtTen.Text.Length != 0)
                {
                    using (SqlConnection cnn = new SqlConnection(constr))
                {

                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_suaCanBo";
                        cmd.Parameters.AddWithValue("@id", dataGridView1.CurrentRow.Cells["iMaCanBo"].Value.ToString());
                        cmd.Parameters.AddWithValue("@ten", txtTen.Text);
                        cmd.Parameters.AddWithValue("@sdt", txtSĐT.Text);
                        cmd.Parameters.AddWithValue("@mail", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                        cnn.Open();
                        int i_ = cmd.ExecuteNonQuery();
                        if (i_ > 0)
                        {
                            loadGrid();
                            XoaTrang();
                            MessageBox.Show("Sửa Cán Bộ Thành Công", "Thông Báo");
                        }
                    }
                  }
                }

                else
                {
                    MessageBox.Show("Yêu Cầu Điền Đầy Đủ Thông Tin.", "Thông Báo");
                }
            }

            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }

            
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtDiaChi.Text.Length != 0 && txtEmail.Text.Length != 0 && txtSĐT.Text.Length != 0 && txtTen.Text.Length != 0 )
                {
                    using (SqlConnection cnn = new SqlConnection(constr))
            {

                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_themCanBo";
                    cmd.Parameters.AddWithValue("@ten", txtTen.Text);
                    cmd.Parameters.AddWithValue("@sdt", txtSĐT.Text);
                    cmd.Parameters.AddWithValue("@mail", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                        loadGrid();
                        XoaTrang();
                        MessageBox.Show("Thêm Cán Bộ Thành Công", "Thông Báo");
                    }
                }
            }
                }
            
                else
                {
                MessageBox.Show("Yêu Cầu Điền Đầy Đủ Thông Tin.", "Thông Báo");
            }
        }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
}

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn có Muốn Xoá Cán Bộ :  " + dataGridView1.CurrentRow.Cells["Tên Giảng Viên"].Value.ToString(), "Thông Báo",
    MessageBoxButtons.YesNo, MessageBoxIcon.Question,
    MessageBoxDefaultButton.Button1) == System.Windows.Forms.DialogResult.Yes)
                {
                    using (SqlConnection cnn = new SqlConnection(constr))
                    {

                        using (SqlCommand cmd = cnn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "sp_xoaCanBo";
                            cmd.Parameters.AddWithValue("@id", dataGridView1.CurrentRow.Cells["iMaCanBo"].Value.ToString());

                            cnn.Open();
                            int i_ = cmd.ExecuteNonQuery();
                            if (i_ > 0)
                            {
                                loadGrid();
                                MessageBox.Show("Xoá Cán Bộ Thành Công", "Thông Báo");
                            }
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        void XoaTrang()
        {
            txtEmail.Text = "";
            txtSĐT.Text = "";
            txtTen.Text = "";
            txtDiaChi.Text = "";
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtTen.Text = dataGridView1.CurrentRow.Cells["Tên Giảng Viên"].Value.ToString();
            txtSĐT.Text = dataGridView1.CurrentRow.Cells["Số Điện Thoại"].Value.ToString();
            txtEmail.Text = dataGridView1.CurrentRow.Cells["Email"].Value.ToString();
            txtDiaChi.Text = dataGridView1.CurrentRow.Cells["Địa Chỉ"].Value.ToString();
        }
    }
}
