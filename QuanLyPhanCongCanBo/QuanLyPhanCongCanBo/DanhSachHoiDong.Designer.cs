namespace QuanLyPhanCongCanBo
{
    partial class DanhSachHoiDong
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnXemDanhSachPhong = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.maskedTextBoxTuNgay = new System.Windows.Forms.MaskedTextBox();
            this.maskedTextBoxDenNgay = new System.Windows.Forms.MaskedTextBox();
            this.radioButtonCoiThi = new System.Windows.Forms.RadioButton();
            this.radioButtonChamThi = new System.Windows.Forms.RadioButton();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.cbbChuTich = new System.Windows.Forms.ComboBox();
            this.cbbGiamSat = new System.Windows.Forms.ComboBox();
            this.cbbThuKy = new System.Windows.Forms.ComboBox();
            this.btnSua = new System.Windows.Forms.Button();
            this.btnXoa = new System.Windows.Forms.Button();
            this.btnTimKiem = new System.Windows.Forms.Button();
            this.txtTen = new System.Windows.Forms.TextBox();
            this.btnThem = new System.Windows.Forms.Button();
            this.btnTaiLai = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(1, -1);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(1055, 261);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // btnXemDanhSachPhong
            // 
            this.btnXemDanhSachPhong.Location = new System.Drawing.Point(594, 363);
            this.btnXemDanhSachPhong.Name = "btnXemDanhSachPhong";
            this.btnXemDanhSachPhong.Size = new System.Drawing.Size(221, 23);
            this.btnXemDanhSachPhong.TabIndex = 1;
            this.btnXemDanhSachPhong.Text = "Xem Danh Sách Phân Công Cán Bộ";
            this.btnXemDanhSachPhong.UseVisualStyleBackColor = true;
            this.btnXemDanhSachPhong.Click += new System.EventHandler(this.btnXemDanhSachPhong_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(41, 278);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(77, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Tên Hội Đồng:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(392, 314);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(58, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Đến Ngày:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(41, 314);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Từ Ngày:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(613, 274);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 13);
            this.label4.TabIndex = 5;
            this.label4.Text = "Chủ Tich:";
            // 
            // maskedTextBoxTuNgay
            // 
            this.maskedTextBoxTuNgay.Location = new System.Drawing.Point(124, 311);
            this.maskedTextBoxTuNgay.Mask = "00/00/0000";
            this.maskedTextBoxTuNgay.Name = "maskedTextBoxTuNgay";
            this.maskedTextBoxTuNgay.Size = new System.Drawing.Size(100, 20);
            this.maskedTextBoxTuNgay.TabIndex = 6;
            this.maskedTextBoxTuNgay.ValidatingType = typeof(System.DateTime);
            // 
            // maskedTextBoxDenNgay
            // 
            this.maskedTextBoxDenNgay.Location = new System.Drawing.Point(490, 311);
            this.maskedTextBoxDenNgay.Mask = "00/00/0000";
            this.maskedTextBoxDenNgay.Name = "maskedTextBoxDenNgay";
            this.maskedTextBoxDenNgay.Size = new System.Drawing.Size(100, 20);
            this.maskedTextBoxDenNgay.TabIndex = 7;
            this.maskedTextBoxDenNgay.ValidatingType = typeof(System.DateTime);
            // 
            // radioButtonCoiThi
            // 
            this.radioButtonCoiThi.AutoSize = true;
            this.radioButtonCoiThi.Location = new System.Drawing.Point(414, 274);
            this.radioButtonCoiThi.Name = "radioButtonCoiThi";
            this.radioButtonCoiThi.Size = new System.Drawing.Size(58, 17);
            this.radioButtonCoiThi.TabIndex = 8;
            this.radioButtonCoiThi.TabStop = true;
            this.radioButtonCoiThi.Text = "Coi Thi";
            this.radioButtonCoiThi.UseVisualStyleBackColor = true;
            // 
            // radioButtonChamThi
            // 
            this.radioButtonChamThi.AutoSize = true;
            this.radioButtonChamThi.Location = new System.Drawing.Point(502, 272);
            this.radioButtonChamThi.Name = "radioButtonChamThi";
            this.radioButtonChamThi.Size = new System.Drawing.Size(70, 17);
            this.radioButtonChamThi.TabIndex = 9;
            this.radioButtonChamThi.TabStop = true;
            this.radioButtonChamThi.Text = "Chấm Thi";
            this.radioButtonChamThi.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(613, 296);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(50, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Giám Sát";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(613, 323);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(40, 13);
            this.label6.TabIndex = 11;
            this.label6.Text = "Thư ký";
            // 
            // cbbChuTich
            // 
            this.cbbChuTich.FormattingEnabled = true;
            this.cbbChuTich.Location = new System.Drawing.Point(672, 266);
            this.cbbChuTich.Name = "cbbChuTich";
            this.cbbChuTich.Size = new System.Drawing.Size(121, 21);
            this.cbbChuTich.TabIndex = 12;
            // 
            // cbbGiamSat
            // 
            this.cbbGiamSat.FormattingEnabled = true;
            this.cbbGiamSat.Location = new System.Drawing.Point(672, 293);
            this.cbbGiamSat.Name = "cbbGiamSat";
            this.cbbGiamSat.Size = new System.Drawing.Size(121, 21);
            this.cbbGiamSat.TabIndex = 13;
            // 
            // cbbThuKy
            // 
            this.cbbThuKy.FormattingEnabled = true;
            this.cbbThuKy.Location = new System.Drawing.Point(672, 320);
            this.cbbThuKy.Name = "cbbThuKy";
            this.cbbThuKy.Size = new System.Drawing.Size(121, 21);
            this.cbbThuKy.TabIndex = 14;
            // 
            // btnSua
            // 
            this.btnSua.Location = new System.Drawing.Point(134, 363);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(100, 23);
            this.btnSua.TabIndex = 15;
            this.btnSua.Text = "Sửa";
            this.btnSua.UseVisualStyleBackColor = true;
            this.btnSua.Click += new System.EventHandler(this.btnSua_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.Location = new System.Drawing.Point(261, 363);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(100, 23);
            this.btnXoa.TabIndex = 16;
            this.btnXoa.Text = "Xoá";
            this.btnXoa.UseVisualStyleBackColor = true;
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.Location = new System.Drawing.Point(490, 363);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(74, 23);
            this.btnTimKiem.TabIndex = 17;
            this.btnTimKiem.Text = "Tìm Kiếm";
            this.btnTimKiem.UseVisualStyleBackColor = true;
            this.btnTimKiem.Click += new System.EventHandler(this.btnTimKiem_Click);
            // 
            // txtTen
            // 
            this.txtTen.Location = new System.Drawing.Point(124, 275);
            this.txtTen.Name = "txtTen";
            this.txtTen.Size = new System.Drawing.Size(264, 20);
            this.txtTen.TabIndex = 18;
            // 
            // btnThem
            // 
            this.btnThem.Location = new System.Drawing.Point(18, 363);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(100, 23);
            this.btnThem.TabIndex = 19;
            this.btnThem.Text = "Thêm";
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // btnTaiLai
            // 
            this.btnTaiLai.Location = new System.Drawing.Point(384, 363);
            this.btnTaiLai.Name = "btnTaiLai";
            this.btnTaiLai.Size = new System.Drawing.Size(78, 23);
            this.btnTaiLai.TabIndex = 20;
            this.btnTaiLai.Text = "Tải Lại";
            this.btnTaiLai.UseVisualStyleBackColor = true;
            this.btnTaiLai.Click += new System.EventHandler(this.btnTaiLai_Click);
            // 
            // DanhSachHoiDong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1056, 414);
            this.Controls.Add(this.btnTaiLai);
            this.Controls.Add(this.btnThem);
            this.Controls.Add(this.txtTen);
            this.Controls.Add(this.btnTimKiem);
            this.Controls.Add(this.btnXoa);
            this.Controls.Add(this.btnSua);
            this.Controls.Add(this.cbbThuKy);
            this.Controls.Add(this.cbbGiamSat);
            this.Controls.Add(this.cbbChuTich);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.radioButtonChamThi);
            this.Controls.Add(this.radioButtonCoiThi);
            this.Controls.Add(this.maskedTextBoxDenNgay);
            this.Controls.Add(this.maskedTextBoxTuNgay);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnXemDanhSachPhong);
            this.Controls.Add(this.dataGridView1);
            this.Name = "DanhSachHoiDong";
            this.Text = "DanhSachHoiDong";
            this.Load += new System.EventHandler(this.DanhSachHoiDong_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnXemDanhSachPhong;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxTuNgay;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxDenNgay;
        private System.Windows.Forms.RadioButton radioButtonCoiThi;
        private System.Windows.Forms.RadioButton radioButtonChamThi;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox cbbChuTich;
        private System.Windows.Forms.ComboBox cbbGiamSat;
        private System.Windows.Forms.ComboBox cbbThuKy;
        private System.Windows.Forms.Button btnSua;
        private System.Windows.Forms.Button btnXoa;
        private System.Windows.Forms.Button btnTimKiem;
        private System.Windows.Forms.TextBox txtTen;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Button btnTaiLai;
    }
}