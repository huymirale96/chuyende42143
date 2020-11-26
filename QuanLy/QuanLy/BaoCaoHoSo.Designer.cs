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
            this.crystalReportViewer1 = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.maskedTextBoxTuNgay = new System.Windows.Forms.MaskedTextBox();
            this.maskedTextBoxDenNgay = new System.Windows.Forms.MaskedTextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // crystalReportViewer1
            // 
            this.crystalReportViewer1.ActiveViewIndex = -1;
            this.crystalReportViewer1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crystalReportViewer1.Cursor = System.Windows.Forms.Cursors.Default;
            this.crystalReportViewer1.Location = new System.Drawing.Point(12, 12);
            this.crystalReportViewer1.Name = "crystalReportViewer1";
            this.crystalReportViewer1.Size = new System.Drawing.Size(860, 337);
            this.crystalReportViewer1.TabIndex = 8;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(71, 411);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(51, 13);
            this.label2.TabIndex = 10;
            this.label2.Text = "Từ Ngày:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(293, 416);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(55, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Đến Ngày";
            // 
            // maskedTextBoxTuNgay
            // 
            this.maskedTextBoxTuNgay.Location = new System.Drawing.Point(128, 408);
            this.maskedTextBoxTuNgay.Mask = "00/00/0000";
            this.maskedTextBoxTuNgay.Name = "maskedTextBoxTuNgay";
            this.maskedTextBoxTuNgay.Size = new System.Drawing.Size(139, 20);
            this.maskedTextBoxTuNgay.TabIndex = 13;
            this.maskedTextBoxTuNgay.ValidatingType = typeof(System.DateTime);
            // 
            // maskedTextBoxDenNgay
            // 
            this.maskedTextBoxDenNgay.Location = new System.Drawing.Point(363, 408);
            this.maskedTextBoxDenNgay.Mask = "00/00/0000";
            this.maskedTextBoxDenNgay.Name = "maskedTextBoxDenNgay";
            this.maskedTextBoxDenNgay.Size = new System.Drawing.Size(139, 20);
            this.maskedTextBoxDenNgay.TabIndex = 14;
            this.maskedTextBoxDenNgay.ValidatingType = typeof(System.DateTime);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(541, 406);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(114, 23);
            this.button1.TabIndex = 15;
            this.button1.Text = "Báo Cáo";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // BaoCaoHoSo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(875, 475);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.crystalReportViewer1);
            this.Controls.Add(this.maskedTextBoxDenNgay);
            this.Controls.Add(this.maskedTextBoxTuNgay);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label3);
            this.Name = "BaoCaoHoSo";
            this.Text = "BaoCaoHoSo";
            this.Load += new System.EventHandler(this.BaoCaoHoSo_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxTuNgay;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxDenNgay;
        private System.Windows.Forms.Button button1;
    }
}