namespace QuanLyPhanCongCanBo
{
    partial class DanhSachPhanCong
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.comboBoxCanBo = new System.Windows.Forms.ComboBox();
            this.btnThem = new System.Windows.Forms.Button();
            this.panelThanhToan = new System.Windows.Forms.Panel();
            this.labelTenCanBo = new System.Windows.Forms.Label();
            this.btnThanhToan_ = new System.Windows.Forms.Button();
            this.txtTien = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnThanhToan = new System.Windows.Forms.Button();
            this.btnXoa = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.cbbCa = new System.Windows.Forms.ComboBox();
            this.cbbPhong = new System.Windows.Forms.ComboBox();
            this.btnSua = new System.Windows.Forms.Button();
            this.dataGridView_ = new System.Windows.Forms.DataGridView();
            this.panelTimKiem = new System.Windows.Forms.Panel();
            this.maskedTextBoxNgayTimKiem = new System.Windows.Forms.MaskedTextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.btnTimKiemPhanCong = new System.Windows.Forms.Button();
            this.txtTenCanBo_TimKiem = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.maskedTextBoxNgay = new System.Windows.Forms.MaskedTextBox();
            this.btnTimKiem = new System.Windows.Forms.Button();
            this.btnHuyTimKiem = new System.Windows.Forms.Button();
            this.panelThanhToan.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_)).BeginInit();
            this.panelTimKiem.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 252);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Cán Bộ";
            // 
            // comboBoxCanBo
            // 
            this.comboBoxCanBo.FormattingEnabled = true;
            this.comboBoxCanBo.Location = new System.Drawing.Point(90, 250);
            this.comboBoxCanBo.Name = "comboBoxCanBo";
            this.comboBoxCanBo.Size = new System.Drawing.Size(174, 21);
            this.comboBoxCanBo.TabIndex = 2;
            // 
            // btnThem
            // 
            this.btnThem.Location = new System.Drawing.Point(12, 391);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(87, 23);
            this.btnThem.TabIndex = 3;
            this.btnThem.Text = "Thêm";
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // panelThanhToan
            // 
            this.panelThanhToan.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.panelThanhToan.Controls.Add(this.labelTenCanBo);
            this.panelThanhToan.Controls.Add(this.btnThanhToan_);
            this.panelThanhToan.Controls.Add(this.txtTien);
            this.panelThanhToan.Controls.Add(this.label2);
            this.panelThanhToan.Location = new System.Drawing.Point(341, 252);
            this.panelThanhToan.Name = "panelThanhToan";
            this.panelThanhToan.Size = new System.Drawing.Size(324, 99);
            this.panelThanhToan.TabIndex = 4;
            // 
            // labelTenCanBo
            // 
            this.labelTenCanBo.AutoSize = true;
            this.labelTenCanBo.Location = new System.Drawing.Point(4, 10);
            this.labelTenCanBo.Name = "labelTenCanBo";
            this.labelTenCanBo.Size = new System.Drawing.Size(64, 13);
            this.labelTenCanBo.TabIndex = 6;
            this.labelTenCanBo.Text = "Tên Cán Bộ";
            // 
            // btnThanhToan_
            // 
            this.btnThanhToan_.Location = new System.Drawing.Point(132, 66);
            this.btnThanhToan_.Name = "btnThanhToan_";
            this.btnThanhToan_.Size = new System.Drawing.Size(91, 23);
            this.btnThanhToan_.TabIndex = 5;
            this.btnThanhToan_.Text = "Thanh Toán";
            this.btnThanhToan_.UseVisualStyleBackColor = true;
            this.btnThanhToan_.Click += new System.EventHandler(this.btnThanhToan__Click);
            // 
            // txtTien
            // 
            this.txtTien.Location = new System.Drawing.Point(132, 28);
            this.txtTien.Name = "txtTien";
            this.txtTien.Size = new System.Drawing.Size(140, 20);
            this.txtTien.TabIndex = 1;
            this.txtTien.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtTien_KeyPress);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(3, 31);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(106, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Số Tiền Thanh Toán";
            // 
            // btnThanhToan
            // 
            this.btnThanhToan.Location = new System.Drawing.Point(251, 391);
            this.btnThanhToan.Name = "btnThanhToan";
            this.btnThanhToan.Size = new System.Drawing.Size(85, 23);
            this.btnThanhToan.TabIndex = 7;
            this.btnThanhToan.Text = "Thanh Toán";
            this.btnThanhToan.UseVisualStyleBackColor = true;
            this.btnThanhToan.Click += new System.EventHandler(this.btnThanhToan_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.Location = new System.Drawing.Point(372, 391);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(52, 23);
            this.btnXoa.TabIndex = 8;
            this.btnXoa.Text = "Xoá";
            this.btnXoa.UseVisualStyleBackColor = true;
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 283);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(35, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Ngày:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 309);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(23, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "Ca:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 346);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(41, 13);
            this.label5.TabIndex = 11;
            this.label5.Text = "Phòng:";
            // 
            // cbbCa
            // 
            this.cbbCa.FormattingEnabled = true;
            this.cbbCa.Location = new System.Drawing.Point(90, 306);
            this.cbbCa.Name = "cbbCa";
            this.cbbCa.Size = new System.Drawing.Size(174, 21);
            this.cbbCa.TabIndex = 12;
            // 
            // cbbPhong
            // 
            this.cbbPhong.FormattingEnabled = true;
            this.cbbPhong.Location = new System.Drawing.Point(90, 338);
            this.cbbPhong.Name = "cbbPhong";
            this.cbbPhong.Size = new System.Drawing.Size(174, 21);
            this.cbbPhong.TabIndex = 13;
            // 
            // btnSua
            // 
            this.btnSua.Location = new System.Drawing.Point(126, 391);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(87, 23);
            this.btnSua.TabIndex = 15;
            this.btnSua.Text = "Sửa";
            this.btnSua.UseVisualStyleBackColor = true;
            this.btnSua.Click += new System.EventHandler(this.btnSua_Click);
            // 
            // dataGridView_
            // 
            this.dataGridView_.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView_.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView_.Location = new System.Drawing.Point(-1, 3);
            this.dataGridView_.Name = "dataGridView_";
            this.dataGridView_.Size = new System.Drawing.Size(666, 241);
            this.dataGridView_.TabIndex = 16;
            this.dataGridView_.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView__CellClick);
            // 
            // panelTimKiem
            // 
            this.panelTimKiem.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.panelTimKiem.Controls.Add(this.btnHuyTimKiem);
            this.panelTimKiem.Controls.Add(this.maskedTextBoxNgayTimKiem);
            this.panelTimKiem.Controls.Add(this.label6);
            this.panelTimKiem.Controls.Add(this.btnTimKiemPhanCong);
            this.panelTimKiem.Controls.Add(this.txtTenCanBo_TimKiem);
            this.panelTimKiem.Controls.Add(this.label7);
            this.panelTimKiem.Location = new System.Drawing.Point(341, 252);
            this.panelTimKiem.Name = "panelTimKiem";
            this.panelTimKiem.Size = new System.Drawing.Size(324, 99);
            this.panelTimKiem.TabIndex = 7;
            // 
            // maskedTextBoxNgayTimKiem
            // 
            this.maskedTextBoxNgayTimKiem.Location = new System.Drawing.Point(132, 41);
            this.maskedTextBoxNgayTimKiem.Mask = "00/00/0000";
            this.maskedTextBoxNgayTimKiem.Name = "maskedTextBoxNgayTimKiem";
            this.maskedTextBoxNgayTimKiem.Size = new System.Drawing.Size(100, 20);
            this.maskedTextBoxNgayTimKiem.TabIndex = 17;
            this.maskedTextBoxNgayTimKiem.ValidatingType = typeof(System.DateTime);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(3, 39);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(35, 13);
            this.label6.TabIndex = 6;
            this.label6.Text = "Ngày:";
            // 
            // btnTimKiemPhanCong
            // 
            this.btnTimKiemPhanCong.Location = new System.Drawing.Point(132, 67);
            this.btnTimKiemPhanCong.Name = "btnTimKiemPhanCong";
            this.btnTimKiemPhanCong.Size = new System.Drawing.Size(91, 23);
            this.btnTimKiemPhanCong.TabIndex = 5;
            this.btnTimKiemPhanCong.Text = "Tìm Kiếm";
            this.btnTimKiemPhanCong.UseVisualStyleBackColor = true;
            this.btnTimKiemPhanCong.Click += new System.EventHandler(this.btnTimKiemPhanCong_Click);
            // 
            // txtTenCanBo_TimKiem
            // 
            this.txtTenCanBo_TimKiem.Location = new System.Drawing.Point(132, 15);
            this.txtTenCanBo_TimKiem.Name = "txtTenCanBo_TimKiem";
            this.txtTenCanBo_TimKiem.Size = new System.Drawing.Size(140, 20);
            this.txtTenCanBo_TimKiem.TabIndex = 1;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(3, 15);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(67, 13);
            this.label7.TabIndex = 0;
            this.label7.Text = "Tên Cán Bộ:";
            // 
            // maskedTextBoxNgay
            // 
            this.maskedTextBoxNgay.Location = new System.Drawing.Point(90, 278);
            this.maskedTextBoxNgay.Mask = "00/00/0000";
            this.maskedTextBoxNgay.Name = "maskedTextBoxNgay";
            this.maskedTextBoxNgay.Size = new System.Drawing.Size(100, 20);
            this.maskedTextBoxNgay.TabIndex = 14;
            this.maskedTextBoxNgay.ValidatingType = typeof(System.DateTime);
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.Location = new System.Drawing.Point(463, 391);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(101, 23);
            this.btnTimKiem.TabIndex = 17;
            this.btnTimKiem.Text = "Tìm Kiếm";
            this.btnTimKiem.UseVisualStyleBackColor = true;
            this.btnTimKiem.Click += new System.EventHandler(this.btnTimKiem_Click);
            // 
            // btnHuyTimKiem
            // 
            this.btnHuyTimKiem.Location = new System.Drawing.Point(241, 67);
            this.btnHuyTimKiem.Name = "btnHuyTimKiem";
            this.btnHuyTimKiem.Size = new System.Drawing.Size(72, 23);
            this.btnHuyTimKiem.TabIndex = 18;
            this.btnHuyTimKiem.Text = "Huỷ";
            this.btnHuyTimKiem.UseVisualStyleBackColor = true;
            this.btnHuyTimKiem.Click += new System.EventHandler(this.btnHuyTimKiem_Click);
            // 
            // DanhSachPhanCong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(666, 457);
            this.Controls.Add(this.btnTimKiem);
            this.Controls.Add(this.panelTimKiem);
            this.Controls.Add(this.dataGridView_);
            this.Controls.Add(this.btnSua);
            this.Controls.Add(this.maskedTextBoxNgay);
            this.Controls.Add(this.cbbPhong);
            this.Controls.Add(this.cbbCa);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnXoa);
            this.Controls.Add(this.btnThanhToan);
            this.Controls.Add(this.panelThanhToan);
            this.Controls.Add(this.btnThem);
            this.Controls.Add(this.comboBoxCanBo);
            this.Controls.Add(this.label1);
            this.Name = "DanhSachPhanCong";
            this.Text = "Danh Sách Phân Công Cán Bộ - Giảng Viên";
            this.Load += new System.EventHandler(this.DanhSachGiangVienCuaPhong_Load);
            this.panelThanhToan.ResumeLayout(false);
            this.panelThanhToan.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_)).EndInit();
            this.panelTimKiem.ResumeLayout(false);
            this.panelTimKiem.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBoxCanBo;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Panel panelThanhToan;
        private System.Windows.Forms.Label labelTenCanBo;
        private System.Windows.Forms.Button btnThanhToan_;
        private System.Windows.Forms.TextBox txtTien;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnThanhToan;
        private System.Windows.Forms.Button btnXoa;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbbCa;
        private System.Windows.Forms.ComboBox cbbPhong;
        private System.Windows.Forms.Button btnSua;
        private System.Windows.Forms.DataGridView dataGridView_;
        private System.Windows.Forms.Panel panelTimKiem;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxNgayTimKiem;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnTimKiemPhanCong;
        private System.Windows.Forms.TextBox txtTenCanBo_TimKiem;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxNgay;
        private System.Windows.Forms.Button btnTimKiem;
        private System.Windows.Forms.Button btnHuyTimKiem;
    }
}