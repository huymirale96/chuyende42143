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
    public partial class TaoHoiDong : Form
    {
        public TaoHoiDong()
        {
            InitializeComponent();
        }


        String constr = ConfigurationManager.ConnectionStrings["db_quanLyThi"].ConnectionString;


        private void TaoHoiDong_Load(object sender, EventArgs e)
        {
            radioButtonThi.Checked = true;
            loadCombobox();
            maskedTextBoxDenNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
            maskedTextBoxTuNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
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
                    comboBoxChuTich.DataSource = data;///
                    comboBoxChuTich.DisplayMember = "sTenGiangVien";
                    comboBoxChuTich.ValueMember = "iMaCanBo";

                    comboBoxGiamSat.DataSource = data_;///
                    comboBoxGiamSat.DisplayMember = "sTenGiangVien";
                    comboBoxGiamSat.ValueMember = "iMaCanBo";

                    comboBoxThuKy.DataSource = data__;///
                    comboBoxThuKy.DisplayMember = "sTenGiangVien";
                    comboBoxThuKy.ValueMember = "iMaCanBo";
                }
            }
        }

        private void btnTaoMoi_Click(object sender, EventArgs e)
        {
            if(String.Compare(txtTenHoiDong.Text,"") != 0)
            {
                try
                {
                    using (SqlConnection cnn = new SqlConnection(constr))
                    {

                        using (SqlCommand cmd = cnn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "sp_themhoidong";
                            //  cmd.Parameters.AddWithValue("@id", dataGridView1.CurrentRow.Cells["iMaCanBo"].Value.ToString());
                            cmd.Parameters.AddWithValue("@tenHoiDong", txtTenHoiDong.Text);
                            cmd.Parameters.AddWithValue("@tuNgay",DateTime.Parse(maskedTextBoxTuNgay.Text));
                            cmd.Parameters.AddWithValue("@denNgay", DateTime.Parse(maskedTextBoxDenNgay.Text));
                            cmd.Parameters.AddWithValue("@maChuTich", comboBoxChuTich.SelectedValue);
                            cmd.Parameters.AddWithValue("@maThuKy", comboBoxThuKy.SelectedValue);
                            cmd.Parameters.AddWithValue("@ngaytao", DateTime.Now);
                             cmd.Parameters.AddWithValue("@maGiamSat", comboBoxGiamSat.SelectedValue);
                            if (radioButtonChamThi.Checked == true)
                            {
                                cmd.Parameters.AddWithValue("@loaiHoiDong","1");
                            
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@loaiHoiDong", "0");
                            }
                            cnn.Open();
                            int i_ = cmd.ExecuteNonQuery();
                            if (i_ > 0)
                            {
                                //loadGrid();
                                //MessageBox.Show("Thêm Hội Đồng Thành Công", "Thông Báo");
                                DanhSachHoiDong ds = new DanhSachHoiDong();
                                ds.MdiParent = this.MdiParent;
                                ds.Show();
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
    }
}
