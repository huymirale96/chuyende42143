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
    public partial class DanhSachHoiDong : Form
    {
        public DanhSachHoiDong()
        {
            InitializeComponent();
        }


        String constr = ConfigurationManager.ConnectionStrings["db_quanLyThi"].ConnectionString;


        private void DanhSachHoiDong_Load(object sender, EventArgs e)
        {
            loadGrid();
            loadCombobox();
        }

        private void loadGrid()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsHoiDong";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    dataGridView1.DataSource = data;///
                }
            }
            dataGridView1.Columns["iMaHoiDong"].Visible = false;
        }

        private void btnXemDanhSachPhong_Click(object sender, EventArgs e)
        {
            try
            {
                DanhSachPhanCong ds = new DanhSachPhanCong();
                ds.maHoiDong = dataGridView1.CurrentRow.Cells["iMaHoiDong"].Value.ToString();
                ds.MdiParent = this.MdiParent;
                ds.Show();
            }
            catch(Exception ex)
            {

            }
        }

        void loadCombobox()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_layDanhSachCanBo";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    DataTable data_ = new DataTable();
                    DataTable data__ = new DataTable();
                    dap.Fill(data);
                    dap.Fill(data_);
                    dap.Fill(data__);
                    cbbChuTich.DataSource = data;///
                    cbbChuTich.DisplayMember = "sTenGiangVien";
                    cbbChuTich.ValueMember = "iMaCanBo";

                    cbbGiamSat.DataSource = data_;///
                    cbbGiamSat.DisplayMember = "sTenGiangVien";
                    cbbGiamSat.ValueMember = "iMaCanBo";

                    cbbThuKy.DataSource = data__;///
                    cbbThuKy.DisplayMember = "sTenGiangVien";
                    cbbThuKy.ValueMember = "iMaCanBo";
                }
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (String.Compare(txtTen.Text, "") != 0)
            {
                try
                {
                    using (SqlConnection cnn = new SqlConnection(constr))
                    {

                        using (SqlCommand cmd = cnn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "sp_suahoidong";
                             cmd.Parameters.AddWithValue("@id", dataGridView1.CurrentRow.Cells["iMaHoiDong"].Value.ToString());
                            cmd.Parameters.AddWithValue("@tenHoiDong", txtTen.Text);
                            cmd.Parameters.AddWithValue("@tuNgay", DateTime.Parse(maskedTextBoxTuNgay.Text));
                            cmd.Parameters.AddWithValue("@denNgay", DateTime.Parse(maskedTextBoxDenNgay.Text));
                            cmd.Parameters.AddWithValue("@maChuTich", cbbChuTich.SelectedValue);
                            cmd.Parameters.AddWithValue("@maThuKy", cbbThuKy.SelectedValue);
                            
                            cmd.Parameters.AddWithValue("@maGiamSat", cbbGiamSat.SelectedValue);
                            if (radioButtonCoiThi.Checked == true)
                            {
                                cmd.Parameters.AddWithValue("@loaiHoiDong", "1");

                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@loaiHoiDong", "0");
                            }
                            cnn.Open();
                            int i_ = cmd.ExecuteNonQuery();
                            if (i_ > 0)
                            {
                               loadGrid();
                               
                            }
                        }
                    }
                }

                catch (Exception ex)
                {
                    Debug.WriteLine(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Nhập Tên Hội Đồng", "Thông Báo");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
                 try
            {
                if (MessageBox.Show("Bạn có Muốn Xoá Hội Đồng :  " + dataGridView1.CurrentRow.Cells["Tên Hội Đồng"].Value.ToString() + " ?", "Thông Báo",
   MessageBoxButtons.YesNo, MessageBoxIcon.Question,
   MessageBoxDefaultButton.Button1) == System.Windows.Forms.DialogResult.Yes)
                {
                    using (SqlConnection cnn = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = cnn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "sp_xoaHoiDong";
                            cmd.Parameters.AddWithValue("@id", dataGridView1.CurrentRow.Cells["iMaHoiDong"].Value.ToString());
                           // cmd.Parameters.AddWithValue("@maCanBo", dataGridView1.CurrentRow.Cells["imacanbo"].Value.ToString());
                            cnn.Open();
                            int i_ = cmd.ExecuteNonQuery();
                            if (i_ > 0)
                            {
                                loadGrid();
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

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                txtTen.Text = dataGridView1.CurrentRow.Cells["Tên Hội Đồng"].Value.ToString();
            maskedTextBoxTuNgay.Text = DateTime.Parse(dataGridView1.CurrentRow.Cells["Từ Ngày"].Value.ToString()).ToString("dd/MM/yyyy");
            maskedTextBoxDenNgay.Text = DateTime.Parse(dataGridView1.CurrentRow.Cells["Đến Ngày"].Value.ToString()).ToString("dd/MM/yyyy");
            cbbChuTich.Text = dataGridView1.CurrentRow.Cells["Chủ Tịch"].Value.ToString();
            cbbGiamSat.Text = dataGridView1.CurrentRow.Cells["Giám Sát"].Value.ToString();
            cbbThuKy.Text = dataGridView1.CurrentRow.Cells["Thư Ký"].Value.ToString();
            if(String.Compare(cbbChuTich.Text = dataGridView1.CurrentRow.Cells["Loại Hội Đồng"].Value.ToString(),"Coi Thi") == 0)
            {
                radioButtonCoiThi.Checked = true;
            }
            else
            {
                radioButtonChamThi.Checked = true;
            }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }

        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_timKiemHoiDong";
                    cmd.Parameters.AddWithValue("@tenHoiDong", dataGridView1.CurrentRow.Cells["Tên Hội Đồng"].Value.ToString());
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);

                    DataTable data = new DataTable();
                    dap.Fill(data);
                    dataGridView1.DataSource = data;///
                }
            }
            dataGridView1.Columns["iMaHoiDong"].Visible = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            TaoHoiDong f = new TaoHoiDong();
            f.MdiParent = this.MdiParent;
            f.Show();
        }

        private void btnTaiLai_Click(object sender, EventArgs e)
        {
            loadGrid();
        }
    }
}
