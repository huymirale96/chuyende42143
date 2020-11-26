namespace QuanLyPhanCongCanBo
{
    partial class MainQuanLy
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
            this.components = new System.ComponentModel.Container();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.quảnLýCánBộToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tạoHộiĐồngMớiToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.danhSáchHộiĐồngToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.báoCáoThốngKêToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.báoCáoTheoHộiĐồngToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.quảnLýCánBộToolStripMenuItem,
            this.quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem,
            this.báoCáoThốngKêToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(936, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // quảnLýCánBộToolStripMenuItem
            // 
            this.quảnLýCánBộToolStripMenuItem.Name = "quảnLýCánBộToolStripMenuItem";
            this.quảnLýCánBộToolStripMenuItem.Size = new System.Drawing.Size(103, 20);
            this.quảnLýCánBộToolStripMenuItem.Text = "Quản Lý Cán Bộ";
            this.quảnLýCánBộToolStripMenuItem.Click += new System.EventHandler(this.quảnLýCánBộToolStripMenuItem_Click);
            // 
            // quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem
            // 
            this.quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tạoHộiĐồngMớiToolStripMenuItem,
            this.danhSáchHộiĐồngToolStripMenuItem});
            this.quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem.Name = "quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem";
            this.quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem.Size = new System.Drawing.Size(214, 20);
            this.quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem.Text = "Quản Lý Hội Đồng Coi Thi/Chấm Thi";
            // 
            // tạoHộiĐồngMớiToolStripMenuItem
            // 
            this.tạoHộiĐồngMớiToolStripMenuItem.Name = "tạoHộiĐồngMớiToolStripMenuItem";
            this.tạoHộiĐồngMớiToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.tạoHộiĐồngMớiToolStripMenuItem.Text = "Tạo Hội Đồng Mới";
            this.tạoHộiĐồngMớiToolStripMenuItem.Click += new System.EventHandler(this.tạoHộiĐồngMớiToolStripMenuItem_Click);
            // 
            // danhSáchHộiĐồngToolStripMenuItem
            // 
            this.danhSáchHộiĐồngToolStripMenuItem.Name = "danhSáchHộiĐồngToolStripMenuItem";
            this.danhSáchHộiĐồngToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.danhSáchHộiĐồngToolStripMenuItem.Text = "Danh Sách Hội Đồng";
            this.danhSáchHộiĐồngToolStripMenuItem.Click += new System.EventHandler(this.danhSáchHộiĐồngToolStripMenuItem_Click);
            // 
            // báoCáoThốngKêToolStripMenuItem
            // 
            this.báoCáoThốngKêToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem,
            this.báoCáoTheoHộiĐồngToolStripMenuItem});
            this.báoCáoThốngKêToolStripMenuItem.Name = "báoCáoThốngKêToolStripMenuItem";
            this.báoCáoThốngKêToolStripMenuItem.Size = new System.Drawing.Size(125, 20);
            this.báoCáoThốngKêToolStripMenuItem.Text = "Báo Cáo - Thống Kê";
            // 
            // báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem
            // 
            this.báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem.Name = "báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem";
            this.báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem.Size = new System.Drawing.Size(282, 22);
            this.báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem.Text = "Báo Cáo Phân Công Cán Bộ Theo Ngày";
            this.báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem.Click += new System.EventHandler(this.báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem_Click);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // báoCáoTheoHộiĐồngToolStripMenuItem
            // 
            this.báoCáoTheoHộiĐồngToolStripMenuItem.Name = "báoCáoTheoHộiĐồngToolStripMenuItem";
            this.báoCáoTheoHộiĐồngToolStripMenuItem.Size = new System.Drawing.Size(282, 22);
            this.báoCáoTheoHộiĐồngToolStripMenuItem.Text = "Báo Cáo Theo Hội Đồng";
            this.báoCáoTheoHộiĐồngToolStripMenuItem.Click += new System.EventHandler(this.báoCáoTheoHộiĐồngToolStripMenuItem_Click);
            // 
            // MainQuanLy
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(936, 562);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainQuanLy";
            this.Text = "Quản Lý Phân Công Cán Bộ Coi Thi/Chấm Thi";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem quảnLýCánBộToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem quảnLýHộiĐồngCoiThiChấmThiToolStripMenuItem;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem tạoHộiĐồngMớiToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem danhSáchHộiĐồngToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem báoCáoThốngKêToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem báoCáoPhânCôngCánBộTheoNgàyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem báoCáoTheoHộiĐồngToolStripMenuItem;
    }
}

