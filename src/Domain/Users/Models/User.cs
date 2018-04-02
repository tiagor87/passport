using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace Domain.Users.Models
{
    public class User
    {
        private string password;
        public User() {
        }
        public User(string userName, string password, string email) {
            this.IsActive = true;
            this.UserName = userName;
            this.Password = password;
            this.Email = email;
        }
        
        public long Id { get; set; }
        public bool IsActive { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password {
            get {
                return this.password;
            }
            
            set {
                this.password = User.Criptography(value);
            }
        }
        public EnumGender Gender { get; set; }
        public DateTime? Birthday { get; set; }
        public string GivenName { get; set; }
        public string SurName { get; set; }
        public string Name { get; set; }
        public string PostalCode { get; set; }
        public string State { get; set; }
        public string StreetAddress { get; set; }
        public string Thumbprint { get; set; }

        public static string Criptography(string input)
        {
            var md5Hash = MD5.Create();

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }
    }
}