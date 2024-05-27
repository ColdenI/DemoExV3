using DemoExV3.lawyer;
using DemoExV3.realtor;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoExV3
{
    public partial class Auth : Form
    {
        public Auth()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try
                {
                    conn.Open();
                }
                catch
                {
                    MessageBox.Show("MySQL server disconnect");
                }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT COUNT(*) FROM `user` WHERE (password=@password AND login=@login);";
                    query.Parameters.AddWithValue("@password", textBox_password.Text);
                    query.Parameters.AddWithValue("@login", textBox_login.Text);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (reader.GetInt32(0) == 0)
                            {
                                MessageBox.Show("login or password incorrect");
                                return;
                            }
                        }
                    }
                    query.CommandText = "SELECT `userid` FROM `user` WHERE (password=@password AND login=@login);";

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ThisUser.User = TableData.User.GetUserByID(reader.GetInt32(0));

                            if (ThisUser.User.status == "уволен")//******************
                            {
                                MessageBox.Show("Вы уволены...");
                                return;
                            }

                            this.Visible = false;
                            textBox_login.Text = string.Empty;
                            textBox_password.Text = string.Empty;

                            switch (ThisUser.User.userrole_id)
                            {
                                case 1: new admin.AdminMainForm().ShowDialog(); break;
                                case 2: new RealtorMainForm().ShowDialog(); break;
                                case 3: new LawyerForm().ShowDialog(); break;
                            }

                            this.Visible = true;
                            return;
                        }
                    }
                }
            }
        }
    }
}
