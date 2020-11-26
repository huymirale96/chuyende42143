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
    public partial class DanhSachPhanCong : Form
    {
        public DanhSachPhanCong()
        {
            InitializeComponent();
        }

        String constr = ConfigurationManager.ConnectionStrings["db_quanLyThi"].ConnectionString;
        public String maHoiDong = "";

        private void DanhSachGiangVienCuaPhong_Load(object sender, EventArgs e)
        {  
            load_Cbb();
            panelThanhToan.Visible = false;
            panelTimKiem.Visible = false;
            maskedTextBoxNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
            Debug.WriteLine("Ma Hoi Dong: " + maHoiDong);
            loadGrid();
        }

        void load_Cbb()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandText = "select * from tblcanbo";
                    cmd.CommandType = CommandType.Text;
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    comboBoxCanBo.DataSource = data;
                    comboBoxCanBo.DisplayMember = "stengiangvien";
                    comboBoxCanBo.ValueMember = "imacanbo";

                   
                }
            }

            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandText = "select * from tblphonghoc";
                    cmd.CommandType = CommandType.Text;

                    // cmd.Parameters.AddWithValue("@id", maPhongThiChamThi);
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    cbbPhong.DataSource = data;
                    cbbPhong.DisplayMember = "sTenPhong";
                    cbbPhong.ValueMember = "iMaPhongHoc";
                }
            }

            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandText = "select * from tblcathi";
                    cmd.CommandType = CommandType.Text;

                    // cmd.Parameters.AddWithValue("@id", maPhongThiChamThi);
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    cbbCa.DataSource = data;
                    cbbCa.DisplayMember = "stencathi"; 
                    cbbCa.ValueMember = "imacathi";
                }
            }
        }

        private void loadGrid()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_danhSachPhanCongTheoHoiDong";
                    cmd.Parameters.AddWithValue("@id", maHoiDong);
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    dataGridView_.DataSource = data;

                 //   Debug.WriteLine("Ma Hoi Dong: " + maHoiDong + " count: " + data.Rows.Count);
                }
            }

            dataGridView_.Columns["iMaPhanCong"].Visible = false;
          //  dataGridView1.Columns["iMaHoiDong"].Visible = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (kiemTraPhanCongCanBo())
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {

                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_themPhanCongCanBo";
                        cmd.Parameters.AddWithValue("@maPhonghoc", cbbPhong.SelectedValue);
                        cmd.Parameters.AddWithValue("@maCaThi", cbbCa.SelectedValue);
                        cmd.Parameters.AddWithValue("@maCanBo", comboBoxCanBo.SelectedValue);
                        cmd.Parameters.AddWithValue("@maHoiDong", maHoiDong);
                        cmd.Parameters.AddWithValue("@ngay",DateTime.Parse(maskedTextBoxNgay.Text));
                        cnn.Open();
                        int i_ = cmd.ExecuteNonQuery();
                        if (i_ > 0)
                        {
                            loadGrid();
                            load_Cbb();
                            MessageBox.Show(" Thêm Phân Công Cán Bộ Thành Công", "Thông Báo");
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show(" Cán Bộ Đã Có Lịch Phân Công Trùng", "Thông Báo");
            }
        }

        private void btnThanhToan__Click(object sender, EventArgs e)
        {
            panelThanhToan.Visible = false;
            try
            {

                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_thanhToanTienChoCanBo";
                        cmd.Parameters.AddWithValue("@tien", txtTien.Text);
                        cmd.Parameters.AddWithValue("@maPhanCong", dataGridView_.CurrentRow.Cells["iMaPhanCong"].Value.ToString());
                       // cmd.Parameters.AddWithValue("@maCanBo", dataGridView_.CurrentRow.Cells["imacanbo"].Value.ToString());
                        cnn.Open();
                        int i_ = cmd.ExecuteNonQuery();
                        if (i_ > 0)
                        {
                            loadGrid();
                            MessageBox.Show(" Thanh Toán Thành Công", "Thông Báo");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            labelTenCanBo.Text = "Cán Bộ: " + dataGridView_.CurrentRow.Cells["Tên Cán Bộ/Giảng Viên"].Value.ToString();
            panelThanhToan.Visible = true;
        }

        Boolean kiemTraPhanCongCanBo()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_kiemTraPhanCongCanBo";
                    cmd.Parameters.AddWithValue("@maPhong", cbbPhong.SelectedValue);
                    cmd.Parameters.AddWithValue("@maCa", cbbCa.SelectedValue);
                    cmd.Parameters.AddWithValue("@maCanBo", comboBoxCanBo.SelectedValue);
                    cmd.Parameters.AddWithValue("@maHoiDong", maHoiDong);
                    cmd.Parameters.AddWithValue("@ngay", DateTime.Parse(maskedTextBoxNgay.Text));
                    cnn.Open();
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    if (data.Rows.Count > 0)
                    {
                        return false;
                        //    MessageBox.Show(" THêm Cán Bộ Thành Công", "Thông Báo");
                    }
                    else
                    {
                        return true;
                    }
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn có Muốn Phân Công Cán Bộ :  " + dataGridView_.CurrentRow.Cells["Tên Cán Bộ/Giảng Viên"].Value.ToString() + " ?", "Thông Báo",
   MessageBoxButtons.YesNo, MessageBoxIcon.Question,
   MessageBoxDefaultButton.Button1) == System.Windows.Forms.DialogResult.Yes)
                { 
                    using (SqlConnection cnn = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = cnn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "sp_XoaPhanCongCanBo";
                            cmd.Parameters.AddWithValue("@maPhanCong", dataGridView_.CurrentRow.Cells["iMaPhanCong"].Value.ToString());
                           // cmd.Parameters.AddWithValue("@maCanBo", dataGridView_.CurrentRow.Cells["imacanbo"].Value.ToString());
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

        private void txtTien_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (!(Char.IsDigit(e.KeyChar) || (e.KeyChar == (char)Keys.Back)))
                e.Handled = true;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView__CellClick(object sender, DataGridViewCellEventArgs e)
        {
            cbbCa.Text = dataGridView_.CurrentRow.Cells["Ca"].Value.ToString();
            cbbPhong.Text = dataGridView_.CurrentRow.Cells["Phòng"].Value.ToString();
            comboBoxCanBo.Text = dataGridView_.CurrentRow.Cells["Tên Cán Bộ/Giảng Viên"].Value.ToString();
            maskedTextBoxNgay.Text = dataGridView_.CurrentRow.Cells["Ngày"].Value.ToString();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            panelTimKiem.Visible = true;
        }

        private void btnTimKiemPhanCong_Click(object sender, EventArgs e)
        {
            try
            {
                string filter = "select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaPhanCong,tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc ";

            if (txtTenCanBo_TimKiem.Text != string.Empty)
            {
                filter += string.Format(" AND stenGiangVien LIKE '%{0}%'", txtTenCanBo_TimKiem.Text);
            }
            if (maskedTextBoxNgayTimKiem.MaskCompleted)
            {
                filter += " AND dNgay = '" + DateTime.Parse(maskedTextBoxNgayTimKiem.Text).ToString("MM/dd/yyyy") + "'";
            }
          // Debug.WriteLine("mash : " + DateTime.Parse(maskedTextBoxNgayTimKiem.Text).ToString("MM/dd/yyyy")  );


            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = filter;
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);

                    dataGridView_.DataSource = data;
                }
            }
            dataGridView_.Columns["iMaPhanCong"].Visible = false;
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        private void btnHuyTimKiem_Click(object sender, EventArgs e)
        {
            panelTimKiem.Visible = false;
            loadGrid();
        }
    }
}
