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

namespace DemoExV3.lawyer
{
    public partial class LawyerForm : Form
    {
        public LawyerForm()
        {
            InitializeComponent();
        }

        private void LawyerForm_Load(object sender, EventArgs e)
        {
            DrawTable();
        }

        private void DrawTable()
        {
            dgv.Rows.Clear();
            dgv.Columns.Clear();
            dgv.BringToFront();
            dgv.Dock = DockStyle.Fill;
            dgv.RowsDefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            dgv.Columns.Add("id", "id"); dgv.Columns["id"].Visible = false;
            dgv.Columns.Add("status", "Статус");
            dgv.Columns.Add("paymentstatus", "Статус оплаты");
            dgv.Columns.Add("paymentmethod", "Способ оплаты");
            dgv.Columns.Add("datecreation", "Дата");
            dgv.Columns.Add("addres", "Адрес");
            dgv.Columns.Add("customer", "Заказчик");


            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }

                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT `orderid` FROM `order`";

                    using (var reader = query.ExecuteReader())
                    {
                        int counter = 0;
                        while (reader.Read())
                        {
                            Order order = Order.GetOrderByID(reader.GetInt32(0));

                            dgv.Rows.Add();
                            dgv.Rows[counter].Cells[0].Value = reader.GetInt32(0);
                            dgv.Rows[counter].Cells[1].Value = order.orderstatus;
                            dgv.Rows[counter].Cells[2].Value = order.paymentstatus;
                            dgv.Rows[counter].Cells[3].Value = order.paymentmethod;
                            dgv.Rows[counter].Cells[4].Value = order.datecreation;
                            dgv.Rows[counter].Cells[5].Value = order.addres;
                            Person p = Person.GetPersonByID(Orderpersonlist.GetOrderByOrderID(order.id).personrid);
                            dgv.Rows[counter].Cells[6].Value = $"{p.fname} {p.lname} {p.middlename}";

                            counter++;
                        }
                    }
                }
            }
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            DrawTable();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "UPDATE `order` SET `orderstatus` = 'готовится' WHERE `orderid` = @id AND `orderstatus` <> 'готов';";
                    query.Parameters.AddWithValue("@id", (int)dgv.CurrentCell.OwningRow.Cells[0].Value); // получение id из таблицы
                    query.ExecuteNonQuery();
                }
            }
            DrawTable();
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
                    query.CommandText = "UPDATE `order` SET `orderstatus` = 'готов' WHERE `orderid` = @id;";
                    query.Parameters.AddWithValue("@id", (int)dgv.CurrentCell.OwningRow.Cells[0].Value); // получение id из таблицы
                    query.ExecuteNonQuery();
                }
            }
            DrawTable();
        }
    }
}
