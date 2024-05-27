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
    public partial class AllShiftsForm : Form
    {
        public AllShiftsForm()
        {
            InitializeComponent();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            new admin.ShiftForm().ShowDialog();
            DrawTableShifts();

        }

        private void DrawTableShifts()
        {
            dgv.Rows.Clear();
            dgv.Columns.Clear();
            dgv.BringToFront();
            dgv.Dock = DockStyle.Fill;
            dgv.RowsDefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            dgv.Columns.Add("id", "id"); dgv.Columns["id"].Visible = false;
            dgv.Columns.Add("shift_ds", "Дата начала");
            dgv.Columns.Add("shift_de", "Дата конца");
            dgv.Columns.Add("lname", "Имя");
            dgv.Columns.Add("fname", "Фамилия");
            dgv.Columns.Add("md", "Отчество");
            dgv.Columns.Add("positions_id", "Должность");

            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }

                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `userlist`";

                    using (var reader = query.ExecuteReader())
                    {
                        int counter = 0;
                        while (reader.Read())
                        {
                            Shift shift = Shift.GetShiftID(reader.GetInt32(2));
                            User user = User.GetUserByID(reader.GetInt32(1));
                            Person person = Person.GetPersonByID(user.person_id);
                            Userrole userrole = Userrole.GetUserroleByID(user.userrole_id);

                            if (!(shift.datestart < DateTime.Now && shift.dateend > DateTime.Now)) continue;

                            dgv.Rows.Add();
                            dgv.Rows[counter].Cells[0].Value = reader.GetInt32(0);
                            dgv.Rows[counter].Cells[1].Value = shift.datestart.ToString();
                            dgv.Rows[counter].Cells[2].Value = shift.dateend.ToString();
                            dgv.Rows[counter].Cells[3].Value = person.lname;
                            dgv.Rows[counter].Cells[4].Value = person.fname;
                            dgv.Rows[counter].Cells[5].Value = person.middlename;
                            dgv.Rows[counter].Cells[6].Value = userrole.namerole;

                            counter++;
                        }
                    }
                }
            }
        }

        private void AllShiftsForm_Load(object sender, EventArgs e)
        {
            DrawTableShifts();
        }
    }
}
