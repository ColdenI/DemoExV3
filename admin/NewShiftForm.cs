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
    public partial class ShiftForm : Form
    {

        List<User> users = new List<User>();
        List<User> userInShift = new List<User>();

        public ShiftForm()
        {
            InitializeComponent();
        }

        private void ShiftForm_Load(object sender, EventArgs e)
        {
            dateTimePicker1.MinDate = DateTime.Now;
            dateTimePicker2.MinDate = DateTime.Now;
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = "yyyy-MM-dd hh:mm:ss ";
            dateTimePicker2.Format = DateTimePickerFormat.Custom;
            dateTimePicker2.CustomFormat = "yyyy-MM-dd hh:mm:ss ";

            listBox1.Items.Clear();
            users.Clear();

            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }

                List<Userlist> list = new List<Userlist>();

                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT `userid` FROM `user` WHERE `status` <> 'уволен'";

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            User i = User.GetUserByID(reader.GetInt32(0));
                            Person pers = Person.GetPersonByID(i.person_id);
                            users.Add(i);
                            listBox1.Items.Add($"{pers.fname} {pers.lname} {pers.middlename} - {Userrole.GetUserroleByID(i.userrole_id).namerole}");                                                   
                        }
                    }
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }

                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "INSERT INTO `shift` (`datestart`, `dateend`) VALUES (@date_s, @date_e);";
                    query.Parameters.AddWithValue("@date_s", dateTimePicker1.Value.ToString("yyyy-MM-dd HH:mm:ss"));
                    query.Parameters.AddWithValue("@date_e", dateTimePicker2.Value.ToString("yyyy-MM-dd HH:mm:ss"));
                    query.ExecuteNonQuery();

                    int sh_id = getLastValue();
                    foreach(User item in userInShift)
                    {
                        query.CommandText = $"INSERT INTO `userlist` (`userid`, `shiftid`) VALUES ('{item.id}', '{sh_id}');";
                        query.ExecuteNonQuery();
                    }
                }
            }
            this.Close();
        }

        public int getLastValue()
        {
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                conn.Open();
                using (var query = conn.CreateCommand())
                {
                    query.CommandText = $"SELECT max(`shiftid`) FROM `shift`";
                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            return reader.GetInt32(0);
                        }
                    }
                }
            }
            return 0;
        }

        private void listBox1_DoubleClick(object sender, EventArgs e)
        {
            if (listBox1.SelectedIndex == -1) return;
            User i = users[listBox1.SelectedIndex];
            Person pers = Person.GetPersonByID(i.person_id);
            userInShift.Add(i);       
            listBox2.Items.Add($"{pers.fname} {pers.lname} {pers.middlename} - {Userrole.GetUserroleByID(i.userrole_id).namerole}");

            users.RemoveAt(listBox1.SelectedIndex);
            listBox1.Items.RemoveAt(listBox1.SelectedIndex);
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBox2.SelectedIndex == -1) return;
            User i = userInShift[listBox2.SelectedIndex];
            Person pers = Person.GetPersonByID(i.person_id);
            users.Add(i);
            listBox1.Items.Add($"{pers.fname} {pers.lname} {pers.middlename} - {Userrole.GetUserroleByID(i.userrole_id).namerole}");

            userInShift.RemoveAt(listBox2.SelectedIndex);
            listBox2.Items.RemoveAt(listBox2.SelectedIndex);
        }
    }
}
