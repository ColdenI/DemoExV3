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

namespace DemoExV3.realtor
{
    public partial class OrderAddForm : Form
    {
        public OrderAddForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (
                string.IsNullOrEmpty(textBox_addres.Text) ||
                string.IsNullOrEmpty(textBox_lname.Text) ||
                string.IsNullOrEmpty(textBox_fname.Text) ||
                comboBox_pay_method.SelectedIndex == -1 
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
                    query.CommandText = "INSERT INTO `person` (`firstname`, `lastname`, `middlename`, `personrole`) VALUES (@firstname, @lastname, @middlename, @personrole);";
                    query.Parameters.AddWithValue("@firstname", textBox_fname.Text);
                    query.Parameters.AddWithValue("@lastname", textBox_lname.Text);
                    query.Parameters.AddWithValue("@middlename", textBox_patronymic.Text);
                    query.Parameters.AddWithValue("@personrole", "Клиент");
                    query.ExecuteNonQuery();

                    query.CommandText = "INSERT INTO `order` (`orderstatus`, `paymentstatus`, `paymentmethod`, `datecreation`, `addres`) VALUES ('создан', 'принят', @paymentmethod, now(), @addres);";
                    query.Parameters.AddWithValue("@paymentmethod", comboBox_pay_method.Items[comboBox_pay_method.SelectedIndex].ToString());
                    query.Parameters.AddWithValue("@addres", textBox_addres.Text);
                    query.ExecuteNonQuery();

                    query.CommandText = "INSERT INTO `orderpersonlist` (`personrid`, `orderid`) VALUES (@personrid, @orderid);";
                    query.Parameters.AddWithValue("@personrid", Person.GetPersonByFLM(textBox_lname.Text, textBox_fname.Text, textBox_patronymic.Text).id);
                    query.Parameters.AddWithValue("@orderid", GetIDLasrOrder());
                    query.ExecuteNonQuery();
                }
            }
            MessageBox.Show("Успешно!");
            this.Close();


        }

        private int GetIDLasrOrder()
        {
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT max(`orderid`) FROM `order`;";

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            return (int)reader.GetInt32(0);
                        }
                    }
                }
            }
            return -1;
        }
    }
}
