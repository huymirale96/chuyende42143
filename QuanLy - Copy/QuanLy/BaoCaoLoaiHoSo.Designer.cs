namespace QuanLy
{
    partial class BaoCaoLoaiHoSo
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
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cbbHso = new System.Windows.Forms.ComboBox();
            this.maskedTextBoxTuNgay = new System.Windows.Forms.MaskedTextBox();
            this.maskedTextBoxDenNgay = new System.Windows.Forms.MaskedTextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(60, 361);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Loại Hồ Sơ:";
            this.label1.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(60, 396);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(51, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Từ Ngày:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(244, 396);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(55, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Đến Ngày";
            // 
            // cbbHso
            // 
            this.cbbHso.FormattingEnabled = true;
            this.cbbHso.Location = new System.Drawing.Point(147, 352);
            this.cbbHso.Name = "cbbHso";
            this.cbbHso.Size = new System.Drawing.Size(272, 21);
            this.cbbHso.TabIndex = 4;
            this.cbbHso.Visible = false;
            // 
            // maskedTextBoxTuNgay
            // 
            this.maskedTextBoxTuNgay.Location = new System.Drawing.Point(117, 393);
            this.maskedTextBoxTuNgay.Mask = "00/00/0000";
            this.maskedTextBoxTuNgay.Name = "maskedTextBoxTuNgay";
            this.maskedTextBoxTuNgay.Size = new System.Drawing.Size(100, 20);
            this.maskedTextBoxTuNgay.TabIndex = 5;
            this.maskedTextBoxTuNgay.ValidatingType = typeof(System.DateTime);
            // 
            // maskedTextBoxDenNgay
            // 
            this.maskedTextBoxDenNgay.Location = new System.Drawing.Point(352, 393);
            this.maskedTextBoxDenNgay.Mask = "00/00/0000";
            this.maskedTextBoxDenNgay.Name = "maskedTextBoxDenNgay";
            this.maskedTextBoxDenNgay.Size = new System.Drawing.Size(100, 20);
            this.maskedTextBoxDenNgay.TabIndex = 6;
            this.maskedTextBoxDenNgay.ValidatingType = typeof(System.DateTime);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(511, 391);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 7;
            this.button1.Text = "Báo Cáo";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(2, 0);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(819, 335);
            this.dataGridView1.TabIndex = 8;
            // 
            // BaoCaoLoaiHoSo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(823, 440);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.maskedTextBoxDenNgay);
            this.Controls.Add(this.maskedTextBoxTuNgay);
            this.Controls.Add(this.cbbHso);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "BaoCaoLoaiHoSo";
            this.Text = "BaoCaoLoaiHoSo";
            this.Load += new System.EventHandler(this.BaoCaoLoaiHoSo_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cbbHso;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxTuNgay;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxDenNgay;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}