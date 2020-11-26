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
    public partial class ThongTinHoSo : Form
    {
        public ThongTinHoSo()
        {
            InitializeComponent();
        }

        String constr = ConfigurationManager.ConnectionStrings["db_ql"].ConnectionString;
        public String maHoSo = "";
        String maCongDan = "";
        Boolean trangThai = true;

        private void label3_Click(object sender, EventArgs e)
        {

        }


        void hienThongTinHoSo()
        {
            
          using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_layThongTinHoSo";
                    cmd.Parameters.AddWithValue("@id", maHoSo);
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    labelHS.Text = "Hồ Sơ: HS" + maHoSo;
                    cbbLoaiHoSo.SelectedValue = data.Rows[0]["iMaLoaiHoSo"].ToString();
                    maCongDan = data.Rows[0]["iMaCongDan"].ToString();
                    txtTenCongDan.Text = data.Rows[0]["stencongdan"].ToString();
                    txtCanCuoc.Text = data.Rows[0]["sCanCuoc"].ToString();
                    txtDiaChi.Text = data.Rows[0]["sDiaChi"].ToString();
                    txtSDT.Text = data.Rows[0]["sSDT"].ToString();
                    txtGhiChuHoSo.Text = data.Rows[0]["sGhiChu"].ToString();
                    maskedTextBoxTGhen.Text = DateTime.Parse(data.Rows[0]["dNgayHen"].ToString()).ToString("dd/MM/yyyy hh:mm");
                    trangThai = false;
                }
            }
        }

        private void ThongTinHoSo_Load(object sender, EventArgs e)
        {
            loadLoaiHS();
            loadLoaiGTtra();
            loadGTnhan();
            if (maHoSo.Length == 0)
            {
                maskedTextBoxTGhen.Text = DateTime.Now.ToString("dd/MM/yyyy hh:mm");
                taoHoSo();
            }
            else
            {
                hienThongTinHoSo();
                loadGridGTTra();
                loadGridGTNhan();
                btnHoanThanh.Text = "Cập Nhật Hồ Sơ";
            }
        }


        private void taoHoSo()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_taoHoSo";
                  
                    cmd.Parameters.AddWithValue("@thoigian", DateTime.Now);
                    cmd.Parameters.AddWithValue("@maHoSo", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    maHoSo = cmd.Parameters["@maHoSo"].Value.ToString();
                    //loadGrid();
                    Debug.WriteLine("Ma don vua tao: " + maHoSo);
                    labelHS.Text = "Hồ Sơ: HS" + maHoSo;
                }

            }
        }

        private void taoThongTinCongDan()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_taoTTcongDan_";

                    cmd.Parameters.AddWithValue("@ten", txtTenCongDan.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    cmd.Parameters.AddWithValue("@sdt", txtSDT.Text);
                    cmd.Parameters.AddWithValue("@cancuoc", txtCanCuoc.Text);

                    cmd.Parameters.AddWithValue("@maCongDan", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    maCongDan = cmd.Parameters["@maCongDan"].Value.ToString();
                    //loadGrid();
                    Debug.WriteLine("Ma cd: " + maCongDan);
                    
                }

            }
        }


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
                    cbbLoaiHoSo.DataSource = data;
                    cbbLoaiHoSo.ValueMember = "iMaLoaiHoSo";
                    cbbLoaiHoSo.DisplayMember = "sTenLoaiHoSo";
                }
            }
        }

        private void loadLoaiGTtra()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsLoaiGTtra_";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    cbbLoaiGTtra.DataSource = data;
                    cbbLoaiGTtra.ValueMember = "iMaLoaiGiayToTra";
                    cbbLoaiGTtra.DisplayMember = "sTenLoaiGiayToTra";
                }
            }
        }


        private void loadGTnhan()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cnn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsLoaiGTnhan_";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    cbbLoaiGTnhan.DataSource = data;
                    cbbLoaiGTnhan.ValueMember = "iMaLoaiGiayToNhan";
                    cbbLoaiGTnhan.DisplayMember = "sTenLoaiGiayTonhan";
                }
            }
        }


        private void btnHoanThanh_Click(object sender, EventArgs e)
        {
            if(txtTenCongDan.Text.Length !=0 && txtCanCuoc.Text.Length != 0 && txtDiaChi.Text.Length != 0 && txtSDT.Text.Length != 0)
            {
                if (trangThai == true)
                {
                    taoThongTinCongDan();
                    updateHoSo();
                }
                {
                    updateHoSo();
                    updateCongDann();
                }
            }
            else
            {
                MessageBox.Show("Phải Điền Đầy Đủ Thông Tin", "Thông Báo");
            }
        }

        void updateHoSo()
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_updateHoSo_";
                    cmd.Parameters.AddWithValue("@id", maHoSo);
                    cmd.Parameters.AddWithValue("@maCongDan", maCongDan);
                    cmd.Parameters.AddWithValue("@maLoai", cbbLoaiHoSo.SelectedValue);
                        cmd.Parameters.AddWithValue("@ghichu", txtGhiChuHoSo.Text);
                        cmd.Parameters.AddWithValue("@tghen", DateTime.Parse(maskedTextBoxTGhen.Text));
                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                            this.Hide();
                    }
                }
            }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                //MessageBox.Show("Xoá Loại HS Không Thành Công", "Thông Báo");
            }
        }


        void updateCongDann()
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_updateCongDan";
                        cmd.Parameters.AddWithValue("@id", maCongDan);
                        cmd.Parameters.AddWithValue("@ten", txtTenCongDan.Text);
                        cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                        cmd.Parameters.AddWithValue("@sdt", txtSDT.Text);
                        cmd.Parameters.AddWithValue("@cancuoc", txtCanCuoc.Text);
                        cnn.Open();
                        cmd.ExecuteNonQuery();
                      
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                //MessageBox.Show("Xoá Loại HS Không Thành Công", "Thông Báo");
            }
        }



        private void dataGridView_GT_Tra_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            txtGhiChu_Tra.Text = dataGridView_GT_Tra.CurrentRow.Cells["Ghi Chú"].Value.ToString();
            txtSoLuong.Text = dataGridView_GT_Tra.CurrentRow.Cells["Số Lượng"].Value.ToString();
            cbbLoaiGTtra.SelectedValue = dataGridView_GT_Tra.CurrentRow.Cells["iMaLoaiGiayToTra"].Value.ToString();
        }

        private void dataGridView_GT_Nhan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            ghiChu_Nhan.Text = dataGridView_GT_Nhan.CurrentRow.Cells["Ghi Chú"].Value.ToString();
            txtMaSo_Nhan.Text = dataGridView_GT_Nhan.CurrentRow.Cells["Mã/Số"].Value.ToString();
            cbbLoaiGTnhan.SelectedValue = dataGridView_GT_Nhan.CurrentRow.Cells["iMaGiayToNhan"].Value.ToString();
        }

        private void btnThem_Nhan_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_themChiTietGTNhan";
                    cmd.Parameters.AddWithValue("@maHoSo", maHoSo);
                    cmd.Parameters.AddWithValue("@maLoaiGT", cbbLoaiGTnhan.SelectedValue);
                    cmd.Parameters.AddWithValue("@maso", txtMaSo_Nhan.Text);
                    cmd.Parameters.AddWithValue("@ghichu", ghiChu_Nhan.Text);
                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                        loadGridGTNhan();
                       // loadGridGTnhan();
                        txtMaSo_Nhan.Text = "";
                    }
                }
            }
        }

        private void btnSua_Nhan_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_suaChiTietGTnhan";
                    cmd.Parameters.AddWithValue("@id", dataGridView_GT_Nhan.CurrentRow.Cells["id"].Value.ToString());
                    cmd.Parameters.AddWithValue("@maHoSo", maHoSo);
                    cmd.Parameters.AddWithValue("@ghichu", ghiChu_Nhan.Text);
                    cmd.Parameters.AddWithValue("@maso", txtMaSo_Nhan.Text);
                    cmd.Parameters.AddWithValue("@maLoaiGT", cbbLoaiGTnhan.SelectedValue);

                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                        // MessageBox.Show("Thêm Loại Hồ Sơ Thành Công", "Thông Báo");
                        loadGridGTNhan();
                        txtMaSo_Nhan.Text = "";
                        ghiChu_Nhan.Text = "";

                    }
                }
            }
        }

        private void btnXoa_Nhan_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_xoaChiTietGTnhan";
                        cmd.Parameters.AddWithValue("@id", dataGridView_GT_Nhan.CurrentRow.Cells["id"].Value.ToString());

                        cnn.Open();
                        int i_ = cmd.ExecuteNonQuery();
                        if (i_ > 0)
                        {
                            loadGridGTNhan();
                            txtMaSo_Nhan.Text = "";
                            ghiChu_Nhan.Text = "";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Xoá Không Thành Công", "Thông Báo");
            }
        }
        void loadGridGTTra()
        {
            int tongTien = 0;
            CultureInfo elGR = CultureInfo.CreateSpecificCulture("el-GR");
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsChiTietGTtra";
                    cmd.Parameters.AddWithValue("@maHoSo", maHoSo);
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    foreach(DataRow dr in data.Rows)
                    {
                        tongTien += Int32.Parse(dr["Tiền Phí"].ToString()) * Int32.Parse(dr["Số Lượng"].ToString());
                    }
                    labelTien.Text = "Tổng Tiền Phí: " + String.Format(elGR, "{0:0,0}", tongTien) + " VNĐ";

                    dataGridView_GT_Tra.DataSource = data;
                }
            }
            dataGridView_GT_Tra.Columns["id"].Visible = false; 
            dataGridView_GT_Tra.Columns["iMaLoaiGiayToTra"].Visible = false;
        }

        void loadGridGTNhan()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsChiTietGTnhan";
                    cmd.Parameters.AddWithValue("@maHoSo", maHoSo);
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);

                    dataGridView_GT_Nhan.DataSource = data;
                }
            }
            dataGridView_GT_Nhan.Columns["id"].Visible = false;
            dataGridView_GT_Nhan.Columns["iMaGiayToNhan"].Visible = false;
        }
        private void btnThem_Tra_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_themChiTietGTTra";
                    cmd.Parameters.AddWithValue("@maHoSo", maHoSo);
                    cmd.Parameters.AddWithValue("@ghichu", txtGhiChu_Tra.Text);
                    cmd.Parameters.AddWithValue("@soluong",Int32.Parse(txtSoLuong.Text));
                    cmd.Parameters.AddWithValue("@maLoaiGT", cbbLoaiGTtra.SelectedValue);

                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                       // MessageBox.Show("Thêm Loại Hồ Sơ Thành Công", "Thông Báo");
                        loadGridGTTra();
                        txtSoLuong.Text = "1";
                        txtGhiChu_Tra.Text = "";

                    }
                }
            }
        }

        private void btnSua_Tra_Click(object sender, EventArgs e)
        {
            
                  using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_suaChiTietGTTra";
                    cmd.Parameters.AddWithValue("@id", dataGridView_GT_Tra.CurrentRow.Cells["id"].Value.ToString());
                    cmd.Parameters.AddWithValue("@maHoSo", maHoSo);
                    cmd.Parameters.AddWithValue("@ghichu", txtGhiChu_Tra.Text);
                    cmd.Parameters.AddWithValue("@soluong", Int32.Parse(txtSoLuong.Text));
                    cmd.Parameters.AddWithValue("@maLoaiGT", cbbLoaiGTtra.SelectedValue);

                    cnn.Open();
                    int i_ = cmd.ExecuteNonQuery();
                    if (i_ > 0)
                    {
                        // MessageBox.Show("Thêm Loại Hồ Sơ Thành Công", "Thông Báo");
                        loadGridGTTra();
                        txtSoLuong.Text = "1";
                        txtGhiChu_Tra.Text = "";

                    }
                }
            }
        }

        private void btnXoa_Tra_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_xoaChiTietGTtra";
                        cmd.Parameters.AddWithValue("@id", dataGridView_GT_Tra.CurrentRow.Cells["id"].Value.ToString());

                        cnn.Open();
                        int i_ = cmd.ExecuteNonQuery();
                        if (i_ > 0)
                        {
                            loadGridGTTra();
                            txtSoLuong.Text = "1";
                            txtGhiChu_Tra.Text = "";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Xoá Không Thành Công", "Thông Báo");
            }
        }

 

        private void ThongTinHoSo_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (trangThai == true)
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_xoahs";
                        cmd.Parameters.AddWithValue("@ma", maHoSo);

                        cnn.Open();
                        int i_ = cmd.ExecuteNonQuery();
                        if (i_ > 0)
                        {
                            this.Hide();
                        }
                    }
                }
            }
            else
            {
                this.Hide();
            }
        }

        private void txtSoLuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(Char.IsDigit(e.KeyChar) || (e.KeyChar == (char)Keys.Back)))
                e.Handled = true;
        }
    }
}
