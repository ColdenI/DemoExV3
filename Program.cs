using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoExV3
{
    internal static class Program
    {

        public static MySqlConnectionStringBuilder SQLBuilder;

        /// <summary>
        /// Главная точка входа для приложения.
        /// </summary>
        [STAThread]
        static void Main()
        {
            SQLBuilder = new MySqlConnectionStringBuilder
            {
                Server = "localhost",
                Database = "demo_ex_v3",
                UserID = "root",
                Password = "password",
                SslMode = MySqlSslMode.Required,
            };

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Auth());
        }
    }
}
