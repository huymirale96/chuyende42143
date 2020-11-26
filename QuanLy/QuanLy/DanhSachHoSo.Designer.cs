namespace QuanLy
{
    partial class DanhSachHoSo
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
            this.label1 = new System.Windows.Forms.Label();
            this.txtMa = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.rdbDaNhan = new System.Windows.Forms.RadioButton();
            this.rdbDaTra = new System.Windows.Forms.RadioButton();
            this.btnXacNhan = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(-2, -1);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(936, 323);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(102, 352);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Mã Hồ Sơ:";
            // 
            // txtMa
            // 
            this.txtMa.Location = new System.Drawing.Point(176, 349);
            this.txtMa.Name = "txtMa";
            this.txtMa.Size = new System.Drawing.Size(100, 20);
            this.txtMa.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(315, 346);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "Tìm Kiếm";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(573, 342);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 4;
            this.button2.Text = "Xem Chi Tiết";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // rdbDaNhan
            // 
            this.rdbDaNhan.AutoSize = true;
            this.rdbDaNhan.Location = new System.Drawing.Point(16, 15);
            this.rdbDaNhan.Name = "rdbDaNhan";
            this.rdbDaNhan.Size = new System.Drawing.Size(101, 17);
            this.rdbDaNhan.TabIndex = 5;
            this.rdbDaNhan.TabStop = true;
            this.rdbDaNhan.Text = "Đã Nhận Hồ Sơ";
            this.rdbDaNhan.UseVisualStyleBackColor = true;
            // 
            // rdbDaTra
            // 
            this.rdbDaTra.AutoSize = true;
            this.rdbDaTra.Location = new System.Drawing.Point(123, 15);
            this.rdbDaTra.Name = "rdbDaTra";
            this.rdbDaTra.Size = new System.Drawing.Size(153, 17);
            this.rdbDaTra.TabIndex = 6;
            this.rdbDaTra.TabStop = true;
            this.rdbDaTra.Text = "Đã Trả Hồ Sơ Và Thu Tiền";
            this.rdbDaTra.UseVisualStyleBackColor = true;
            // 
            // btnXacNhan
            // 
            this.btnXacNhan.Location = new System.Drawing.Point(339, 9);
            this.btnXacNhan.Name = "btnXacNhan";
            this.btnXacNhan.Size = new System.Drawing.Size(195, 23);
            this.btnXacNhan.TabIndex = 7;
            this.btnXacNhan.Text = "Xác Nhận Trả Hồ Sơ Và Thu Phí";
            this.btnXacNhan.UseVisualStyleBackColor = true;
            this.btnXacNhan.Click += new System.EventHandler(this.btnXacNhan_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.rdbDaNhan);
            this.panel1.Controls.Add(this.btnXacNhan);
            this.panel1.Controls.Add(this.rdbDaTra);
            this.panel1.Location = new System.Drawing.Point(111, 375);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(537, 35);
            this.panel1.TabIndex = 8;
            // 
            // DanhSachHoSo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(936, 414);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txtMa);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "DanhSachHoSo";
            this.Text = "DanhSachHoSo";
            this.Load += new System.EventHandler(this.DanhSachHoSo_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMa;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.RadioButton rdbDaNhan;
        private System.Windows.Forms.RadioButton rdbDaTra;
        private System.Windows.Forms.Button btnXacNhan;
        private System.Windows.Forms.Panel panel1;
    }
}