using MySql.Data.MySqlClient;
using System;
using System.Windows.Forms;
using TableData;

namespace DemoExV3.admin
{
    public partial class AddNewUserForm : Form
    {
        public AddNewUserForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (
                string.IsNullOrEmpty(textBox_login.Text) ||
                string.IsNullOrEmpty(textBox_password.Text) ||
                string.IsNullOrEmpty(textBox_lname.Text) ||
                string.IsNullOrEmpty(textBox_fname.Text) ||
                comboBox_post.SelectedIndex == -1 ||
                textBox_login.Text.Length < 8 ||
                textBox_password.Text.Length < 8
                )
            {
                MessageBox.Show("Заполните все поля!\nЛогин и пароль минимум 8 символов.");
                return;
            }

            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }

                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT COUNT(*) FROM `user` WHERE login=@login;";
                    query.Parameters.AddWithValue("@login", textBox_login.Text);
                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (reader.GetInt32(0) != 0)
                            {
                                MessageBox.Show("Логин занят!");
                                return;
                            }
                        }
                    }
                }

                using (var query = conn.CreateCommand())
                {
                    query.CommandText = "INSERT INTO `person` (`firstname`, `lastname`, `middlename`, `personrole`) VALUES (@firstname, @lastname, @middlename, @personrole);";
                    query.Parameters.AddWithValue("@firstname", textBox_fname.Text);
                    query.Parameters.AddWithValue("@lastname", textBox_lname.Text);
                    query.Parameters.AddWithValue("@middlename", textBox_patronymic.Text);
                    query.Parameters.AddWithValue("@personrole", "Пользователь");
                    query.ExecuteNonQuery();

                    query.CommandTimeout = 30;
                    query.CommandText = "INSERT INTO `user` (`login`, `password`, `status`, `userroleid`, `personid`) VALUES (@login, @password, @status, @userroleid, @personid);";
                    query.Parameters.AddWithValue("@login", textBox_login.Text);
                    query.Parameters.AddWithValue("@password", textBox_password.Text);
                    query.Parameters.AddWithValue("@status", "работает");
                    query.Parameters.AddWithValue("@userroleid", comboBox_post.SelectedIndex + 1);
                    query.Parameters.AddWithValue("@personid", Person.GetPersonByFLM(textBox_lname.Text, textBox_fname.Text, textBox_patronymic.Text).id);
                    query.ExecuteNonQuery();
                }
            }
            MessageBox.Show("Успешно!");
            this.Close();

        }
    }
}
