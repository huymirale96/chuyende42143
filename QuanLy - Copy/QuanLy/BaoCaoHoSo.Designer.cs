namespace QuanLy
{
    partial class BaoCaoHoSo
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
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.maskedTextBoxTuNgay = new System.Windows.Forms.MaskedTextBox();
            this.maskedTextBoxDenNgay = new System.Windows.Forms.MaskedTextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.labelTien = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(63, 435);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(51, 13);
            this.label2.TabIndex = 10;
            this.label2.Text = "Từ Ngày:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(285, 440);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(55, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Đến Ngày";
            // 
            // maskedTextBoxTuNgay
            // 
            this.maskedTextBoxTuNgay.Location = new System.Drawing.Point(120, 432);
            this.maskedTextBoxTuNgay.Mask = "00/00/0000";
            this.maskedTextBoxTuNgay.Name = "maskedTextBoxTuNgay";
            this.maskedTextBoxTuNgay.Size = new System.Drawing.Size(139, 20);
            this.maskedTextBoxTuNgay.TabIndex = 13;
            this.maskedTextBoxTuNgay.ValidatingType = typeof(System.DateTime);
            // 
            // maskedTextBoxDenNgay
            // 
            this.maskedTextBoxDenNgay.Location = new System.Drawing.Point(355, 432);
            this.maskedTextBoxDenNgay.Mask = "00/00/0000";
            this.maskedTextBoxDenNgay.Name = "maskedTextBoxDenNgay";
            this.maskedTextBoxDenNgay.Size = new System.Drawing.Size(139, 20);
            this.maskedTextBoxDenNgay.TabIndex = 14;
            this.maskedTextBoxDenNgay.ValidatingType = typeof(System.DateTime);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(533, 430);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(114, 23);
            this.button1.TabIndex = 15;
            this.button1.Text = "Báo Cáo";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(2, -2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(916, 380);
            this.dataGridView1.TabIndex = 16;
            // 
            // labelTien
            // 
            this.labelTien.AutoSize = true;
            this.labelTien.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelTien.Location = new System.Drawing.Point(63, 398);
            this.labelTien.Name = "labelTien";
            this.labelTien.Size = new System.Drawing.Size(115, 17);
            this.labelTien.TabIndex = 17;
            this.labelTien.Text = "Tổng Tiền Phí:";
            // 
            // BaoCaoHoSo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(915, 475);
            this.Controls.Add(this.labelTien);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.maskedTextBoxDenNgay);
            this.Controls.Add(this.maskedTextBoxTuNgay);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label3);
            this.Name = "BaoCaoHoSo";
            this.Text = "BaoCaoHoSo";
            this.Load += new System.EventHandler(this.BaoCaoHoSo_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxTuNgay;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxDenNgay;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label labelTien;
    }
}