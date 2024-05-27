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
using TableData;

namespace DemoExV3.admin
{
    public partial class UsersForm : Form
    {
        public UsersForm()
        {
            InitializeComponent();
        }

        private void UsersForm_Load(object sender, EventArgs e)
        {
            DrawTableUsers();
        }

        private void DrawTableUsers()
        {
            dgv.Rows.Clear();
            dgv.Columns.Clear();
            dgv.BringToFront();
            dgv.Dock = DockStyle.Fill;
            dgv.RowsDefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            dgv.Columns.Add("id", "id"); dgv.Columns["id"].Visible = false;
            dgv.Columns.Add("lname", "Имя");
            dgv.Columns.Add("fname", "Фамилия");
            dgv.Columns.Add("md", "Отчество");
            dgv.Columns.Add("positions_id", "Должность");
            dgv.Columns.Add("status", "Статус");
            dgv.Columns.Add("login", "Логин");
            dgv.Columns.Add("password", "Пароль");

            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }

                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT `userid` FROM `user`";

                    using (var reader = query.ExecuteReader())
                    {
                        int counter = 0;
                        while (reader.Read())
                        {
                            User user = User.GetUserByID(reader.GetInt32(0));
                            Person person = Person.GetPersonByID(user.person_id);
                            Userrole userrole = Userrole.GetUserroleByID(user.userrole_id);

                            dgv.Rows.Add();
                            dgv.Rows[counter].Cells[0].Value = reader.GetInt32(0);
                            dgv.Rows[counter].Cells[1].Value = person.lname;
                            dgv.Rows[counter].Cells[2].Value = person.fname;
                            dgv.Rows[counter].Cells[3].Value = person.middlename;
                            dgv.Rows[counter].Cells[4].Value = userrole.namerole;
                            dgv.Rows[counter].Cells[5].Value = user.status;
                            dgv.Rows[counter].Cells[6].Value = user.login;
                            dgv.Rows[counter].Cells[7].Value = user.password;                

                            counter++;
                        }
                    }
                }
            }
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            DrawTableUsers();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "UPDATE `user` SET `status` = 'уволен' WHERE `userid` = @id;";
                    query.Parameters.AddWithValue("@id", (int)dgv.CurrentCell.OwningRow.Cells[0].Value); // получение id из таблицы
                    query.ExecuteNonQuery();
                }
            }
            DrawTableUsers();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            new AddNewUserForm().ShowDialog();
            DrawTableUsers();
        }
    }
}
