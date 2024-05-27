using DemoExV3;
using Google.Protobuf.Compiler;
using MySql.Data.MySqlClient;
using Mysqlx.Crud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TableData
{
    public class User
    {
        public int id;
        public string login;
        public string password;
        public string status;
        public int userrole_id;
        public int person_id;

        public static User GetUserByID(int id)
        {
            User user = new User();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                //load positions
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `user` WHERE `userid` = @id";
                    query.Parameters.AddWithValue("@id", id);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            user.id = reader.GetInt32(0);
                            user.login = reader.GetString(1);
                            user.password = reader.GetString(2);
                            try
                            {
                                user.status = reader.GetString(3);
                            } catch { user.status = string.Empty; }
                            user.userrole_id = reader.GetInt32(4);
                            user.person_id = reader.GetInt32(5);
                        }
                    }
                }
            }
            return user;
        }
    }

    public class Person
    {
        public int id;
        public string lname;
        public string fname;
        public string middlename;
        public string personrole;

        public static Person GetPersonByID(int id)
        {
            Person person = new Person();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                //load positions
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `person` WHERE `personid` = @id";
                    query.Parameters.AddWithValue("@id", id);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            person.id = reader.GetInt32(0);
                            person.lname = reader.GetString(1);
                            person.fname = reader.GetString(2);
                            try
                            {
                                person.middlename = reader.GetString(3);
                            }catch { person.middlename = string.Empty; }
                            person.personrole = reader.GetString(4);
                        }
                    }
                }
            }
            return person;
        }
        
        public static Person GetPersonByFLM(string lname, string fname, string mname)
        {
            Person person = new Person();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                //load positions
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT `personid` FROM `person` WHERE `firstname` = @fn AND `lastname` = @ln AND `middlename` = @mn";
                    query.Parameters.AddWithValue("@ln", lname);
                    query.Parameters.AddWithValue("@fn", fname);
                    query.Parameters.AddWithValue("@mn", mname);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            person = GetPersonByID(reader.GetInt32(0));
                        }
                    }
                }
            }
            return person;
        }
    }

    public class Order
    {
        public int id;
        public string orderstatus;
        public string paymentstatus;
        public string paymentmethod;
        public DateTime datecreation;
        public string addres;

        public static Order GetOrderByID(int id)
        {
            Order order = new Order();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `order` WHERE `orderid` = @id";
                    query.Parameters.AddWithValue("@id", id);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            order.id = reader.GetInt32(0);
                            order.orderstatus = reader.GetString(1);
                            order.paymentstatus = reader.GetString(2);
                            order.paymentmethod = reader.GetString(3);
                            order.datecreation = reader.GetDateTime(4);
                            order.addres = reader.GetString(5);
                        }
                    }
                }
            }
            return order;
        }
    }

    public class Orderpersonlist
    {
        public int id;
        public int personrid;
        public int orderid;

        public static Orderpersonlist GetOrderByID(int id)
        {
            Orderpersonlist orderpersonlist = new Orderpersonlist();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `orderpersonlist` WHERE `orderuserlistid` = @id";
                    query.Parameters.AddWithValue("@id", id);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            orderpersonlist.id = reader.GetInt32(0);
                            orderpersonlist.personrid = reader.GetInt32(1);
                            orderpersonlist.orderid = reader.GetInt32(2);
                        }
                    }
                }
            }
            return orderpersonlist;
        }
        public static Orderpersonlist GetOrderByOrderID(int id)
        {
            Orderpersonlist orderpersonlist = new Orderpersonlist();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `orderpersonlist` WHERE `orderid` = @id";
                    query.Parameters.AddWithValue("@id", id);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            orderpersonlist.id = reader.GetInt32(0);
                            orderpersonlist.personrid = reader.GetInt32(1);
                            orderpersonlist.orderid = reader.GetInt32(2);
                        }
                    }
                }
            }
            return orderpersonlist;
        }
    }

    public class Shift
    {
        public int id;
        public DateTime datestart;
        public DateTime dateend;

        public static Shift GetShiftID(int id)
        {
            Shift shift = new Shift();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `shift` WHERE `shiftid` = @id";
                    query.Parameters.AddWithValue("@id", id);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            shift.id = reader.GetInt32(0);
                            shift.datestart = reader.GetDateTime(1);
                            shift.dateend = reader.GetDateTime(2);
                        }
                    }
                }
            }
            return shift;
        }

        public static Shift GetShiftNow()
        {
            Shift shift = new Shift();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `shift` WHERE `datestart` < now() AND `dateend` > now();";

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            shift.id = reader.GetInt32(0);
                            shift.datestart = reader.GetDateTime(1);
                            shift.dateend = reader.GetDateTime(2);
                        }
                    }
                }
            }
            return shift;
        }
    }

    public class Userrole
    {
        public int id;
        public string namerole;

        public static Userrole GetUserroleByID(int id) {
        
        Userrole userrole = new Userrole();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `userrole` WHERE `userroleid` = @id";
                    query.Parameters.AddWithValue("@id", id);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            userrole.id = reader.GetInt32(0);
                            userrole.namerole = reader.GetString(1);
                        }
                    }
                }
            }
            return userrole; ;
        }
    }

    public class Userlist
    {
        public int id;
        public int userid;
        public int shiftid;

        public static Userlist GetUserlistByID(int id)
        {
            Userlist userlist = new Userlist();
            using (var conn = new MySqlConnection(Program.SQLBuilder.ConnectionString))
            {
                try { conn.Open(); }
                catch { MessageBox.Show("MySQL server disconnect"); }
                using (var query = conn.CreateCommand())
                {
                    query.CommandTimeout = 30;
                    query.CommandText = "SELECT * FROM `userlist` WHERE `userlistid` = @id";
                    query.Parameters.AddWithValue("@id", id);

                    using (var reader = query.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            userlist.id = reader.GetInt32(0);
                            userlist.userid = reader.GetInt32(1);
                            userlist.shiftid = reader.GetInt32(2);
                        }
                    }
                }
            }
            return userlist;
        }
    }

}
