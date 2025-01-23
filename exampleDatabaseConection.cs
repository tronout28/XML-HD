using System;
using MySql.Data.MySqlClient;

namespace AWSConnectionExample
{
    class Program
    {
        static void Main(string[] args)
        {
            // Detail koneksi
            string server = "yourdbinstance.xxxx.region.rds.amazonaws.com";
            string database = "your_database_name";
            string username = "your_username";
            string password = "your_password";
            string port = "3306"; 

            // String koneksi
            string connectionString = $"Server={server};Port={port};Database={database};Uid={username};Pwd={password};";

            try
            {
                // Membuat koneksi
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    conn.Open(); // Membuka koneksi
                    Console.WriteLine("Koneksi berhasil ke database AWS!");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Koneksi gagal: " + ex.Message);
            }
        }
    }
}
