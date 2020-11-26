using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QuanLyPhanCongCanBo
{
    public partial class MainQuanLy : Form
    {
        public MainQuanLy()
        {
            InitializeComponent();
        }

        private void quảnLýPhòngHọcToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //QuanLyPhonghoc quanLy = new QuanLyPhonghoc();
            //quanLy.MdiParent = this;
            //quanLy.Show();
        }

        private void quảnLýHọcPhầnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //QuanLyHocPhanThi quanLy = new QuanLyHocPhanThi();
            //quanLy.MdiParent = this;
            //quanLy.Show();
        }

        private void tạoHộiĐồngMớiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TaoHoiDong f = new TaoHoiDong();
            f.MdiParent = this;
            f.Show();
        }

        private void quảnLýCánBộToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QuanLyCanBo f = new QuanLyCanBo();
            f.MdiParent = this;
            f.Show();
        }

        private void danhSáchHộiĐồngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DanhSachHoiDong ds = new DanhSachHoiDong();
            ds.MdiParent = this;
            ds.Show();
        }

        private void báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BaoCaoPhanCongTheoNgay bc = new BaoCaoPhanCongTheoNgay();
            bc.MdiParent = this;
            bc.Show();
        }

        private void báoCáoTheoHộiĐồngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BaoCaoTheoHoiDongg bc = new BaoCaoTheoHoiDongg();
            bc.MdiParent = this;
            bc.Show();
        }
    }
}
