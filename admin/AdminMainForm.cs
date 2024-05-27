using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoExV3.admin
{
    public partial class AdminMainForm : Form
    {
        public AdminMainForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            new admin.UsersForm().ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            new admin.ViewAllOrderForm().ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            new admin.AllShiftsForm().ShowDialog();
        }
    }
}
