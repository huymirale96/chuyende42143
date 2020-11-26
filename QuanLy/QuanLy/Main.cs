using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QuanLy
{
    public partial class main : Form
    {
        public main()
        {
            InitializeComponent();
        }

        private void quảnLýLoạiGiấyTờTrảToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QuanLyLoaiGiayToTra f = new QuanLyLoaiGiayToTra();
            f.MdiParent = this;
            f.Show();
        }

        private void quảnLýLoạiHồSơToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QuanLyLoaiHoSo f = new QuanLyLoaiHoSo();
            f.MdiParent = this;
            f.Show();
        }

        private void quảnLýLoạiGiấyTờNhậnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QuanLyGiayToNhan f = new QuanLyGiayToNhan();
            f.MdiParent = this;
            f.Show();
        }

        private void quảnLýHồSơToolStripMenuItem_Click(object sender, EventArgs e)
        {
         
        }

        private void danhSáchHồSơToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DanhSachHoSo f = new DanhSachHoSo();
            f.MdiParent = this;
            f.Show();
        }

        private void thêmHồSơToolStripMenuItem_Click(object sender, EventArgs e)
        {

            ThongTinHoSo f = new ThongTinHoSo();
            f.MdiParent = this;
            f.Show();
        }

        private void báoCáoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
           
        }

        private void báoCáoDanhSáchHồSơToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BaoCaoHoSo bc = new BaoCaoHoSo();
            bc.MdiParent = this;
            bc.Show();
        }

        private void báoCáoSốLượngHồSơTheoLoạiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BaoCaoLoaiHoSo bc = new BaoCaoLoaiHoSo();
            bc.MdiParent = this;
            bc.Show();
        }
    }
}
