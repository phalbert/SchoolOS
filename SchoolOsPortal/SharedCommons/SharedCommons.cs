using System;
using System.Collections.Generic;
using System.Net.Security;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.IO;
using System.Data;
using System.Reflection;

namespace SharedCommons
{
    public static class SharedCommons
    {
        public static List<string> AllowedImageExtensions = new List<string>(new string[] { ".JPG", ".JPEG", ".PNG" });

        public static bool RemoteCertificateValidation(Object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

        //for more info checkout: https://www.jokecamp.com/blog/examples-of-creating-base64-hashes-using-hmac-sha256-in-different-languages/#csharp
        public static string GenearetHMACSha256Hash(string secretPresharedKey, string message)
        {
            ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            byte[] keyByte = encoding.GetBytes(secretPresharedKey);
            byte[] messageBytes = encoding.GetBytes(message);
            using (var hmacsha256 = new HMACSHA256(keyByte))
            {
                byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
                string base64string = Convert.ToBase64String(hashmessage);
                string HmacHash = ByteArrayToString(hashmessage);
                return HmacHash;
            }
        }

        public static string sha256(string password)
        {
            System.Security.Cryptography.SHA256Managed crypt = new System.Security.Cryptography.SHA256Managed();
            System.Text.StringBuilder hash = new System.Text.StringBuilder();
            byte[] crypto = crypt.ComputeHash(Encoding.UTF8.GetBytes(password), 0, Encoding.UTF8.GetByteCount(password));
            foreach (byte theByte in crypto)
            {
                hash.Append(theByte.ToString("x2"));
            }
            return hash.ToString();
        }

        //0785975800 256785975800
        public static bool IsValidUgPhoneNumber(string Phone)
        {
            if (string.IsNullOrEmpty(Phone))
            {
                return false;
            }
            if (Phone.Length != 10 || Phone.Length != 12)
            {
                return false;
            }
            if (Phone.StartsWith("079"))
            {
                return true;
            }
            if (Phone.StartsWith("078"))
            {
                return true;
            }
            if (Phone.StartsWith("077"))
            {
                return true;
            }
            if (Phone.StartsWith("075"))
            {
                return true;
            }
            if (Phone.StartsWith("074"))
            {
                return true;
            }
            if (Phone.StartsWith("071"))
            {
                return true;
            }
            if (Phone.StartsWith("070"))
            {
                return true;
            }

            //256
            if (Phone.StartsWith("25679"))
            {
                return true;
            }
            if (Phone.StartsWith("25678"))
            {
                return true;
            }
            if (Phone.StartsWith("25677"))
            {
                return true;
            }
            if (Phone.StartsWith("25675"))
            {
                return true;
            }
            if (Phone.StartsWith("25674"))
            {
                return true;
            }
            if (Phone.StartsWith("25671"))
            {
                return true;
            }
            if (Phone.StartsWith("25670"))
            {
                return true;
            }
            return false;
        }

        public static string PutCommaInMoneyString(string amount)
        {
            amount = string.IsNullOrEmpty(amount) ? "0" : amount;
            double amountInt = Convert.ToDouble(amount);
            return amountInt.ToString("#,##0");
        }

        public static string FormatUgPhoneNumber(string Phone)
        {
            Phone = Phone.Replace("+", string.Empty);
            if (string.IsNullOrEmpty(Phone))
            {
                return Phone;
            }
            if (Phone.StartsWith("0"))
            {
                Phone = "256" + Phone.Substring(1);
            }
            return Phone;
        }

        public static string RemoveCommasFromMoneyString(string money)
        {
            if (!string.IsNullOrEmpty(money))
            {
                money = money.Replace(",", string.Empty);
            }
            return money;
        }

        //0785975800 256785975800
        public static string GetUgPhoneNetworkCode(string Phone)
        {
            if (string.IsNullOrEmpty(Phone))
            {
                return "UNKNOWN";
            }
            if (Phone.Length != 10 && Phone.Length != 12)
            {
                return "UNKNOWN";
            }
            if (Phone.StartsWith("079"))
            {
                return "AFRICELL";
            }
            if (Phone.StartsWith("078"))
            {
                return "MTN";
            }
            if (Phone.StartsWith("077"))
            {
                return "MTN";
            }
            if (Phone.StartsWith("075"))
            {
                return "AIRTEL";
            }
            if (Phone.StartsWith("074"))
            {
                return "SMART";
            }
            if (Phone.StartsWith("071"))
            {
                return "UTL";
            }
            if (Phone.StartsWith("070"))
            {
                return "AIRTEL";
            }

            //256
            if (Phone.StartsWith("25679"))
            {
                return "AFRICELL";
            }
            if (Phone.StartsWith("25678"))
            {
                return "MTN";
            }
            if (Phone.StartsWith("25677"))
            {
                return "MTN";
            }
            if (Phone.StartsWith("25675"))
            {
                return "AIRTEL";
            }
            if (Phone.StartsWith("25674"))
            {
                return "SMART";
            }
            if (Phone.StartsWith("25671"))
            {
                return "UTL";
            }
            if (Phone.StartsWith("25670"))
            {
                return "AIRTEL";
            }
            return "UNKNOWN";
        }

        public static string GenerateUniqueId(string LeadString)
        {
            return LeadString + "-" + DateTime.Now.Ticks.ToString();
        }

        public static string GenerateMD5Hash(string input)
        {
            string Salt = "Pegasus";
            input = Salt + input;
            // Use input string to calculate MD5 hash
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            // Convert the byte array to hexadecimal string
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }
            return sb.ToString();
        }

        public static string GeneratePassword()
        {
            string Password = "T3rr1613";
            return Password;
        }

        public static string GenerateSecretKey()
        {
            string Password = "T3rr16132016";
            return Password;
        }


        public static string GeneratePin()
        {
            string Password = "13254";
            return Password;
        }

        public static bool IsNumeric(string Amount)
        {
            try
            {
                int amount = int.Parse(Amount.Split('.')[0]);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool IsNumericAndAboveZero(string Amount)
        {
            try
            {

                Int64 amount = Int64.Parse(Amount.Split('.')[0]);
                if (amount <= 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool IsValidURL(string url)
        {
            try
            {
                if (url.Contains("localhost"))
                {
                    return true;
                }
                Uri uriResult;
                bool result = Uri.TryCreate(url, UriKind.Absolute, out uriResult)
                    && (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);
                return result;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool IsValidBoolean(string p)
        {
            if (String.IsNullOrEmpty(p))
            {
                return false;
            }
            else if (p.ToUpper() == "TRUE" || p.ToUpper() == "FALSE")
            {
                return true;
            }

            return false;
        }

        public static bool IsValidEmail(string email)
        {
            try
            {
                if (email == "N/A") { return true; }
                System.Net.Mail.MailAddress addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        public static bool GetBoolFromStringDefaultsToFalse(string text)
        {
            try
            {
                return Convert.ToBoolean(text);
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static int GetIntFromStringDefaultsToZero(string text)
        {
            try
            {
                return Convert.ToInt32(text);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public static string GetDigitalSignature(string dataToSign, string PathToPrivateKey)
        {
            // path to your private key
            string pathToPrivateKey = PathToPrivateKey;

            // Password of your private key 
            string Password = "Tingate710";

            // load the private key
            X509Certificate2 cert = new X509Certificate2(pathToPrivateKey, Password, X509KeyStorageFlags.UserKeySet);
            RSACryptoServiceProvider rsa = (RSACryptoServiceProvider)cert.PrivateKey;

            // Hash the data
            SHA1Managed sha1 = new SHA1Managed();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] data = encoding.GetBytes(dataToSign);
            byte[] hash = sha1.ComputeHash(data);

            // Sign the hash
            byte[] digitalSignatureBytes = rsa.SignHash(hash, CryptoConfig.MapNameToOID("SHA1"));
            string strDigitalSignature = Convert.ToBase64String(digitalSignatureBytes);
            return strDigitalSignature;
        }

        public static string EncryptText(string text, string PathToPrivateKey)
        {
            try
            {
                string output = string.Empty;
                X509Certificate2 cert = new X509Certificate2(PathToPrivateKey, "Tingate710", X509KeyStorageFlags.UserKeySet);
                using (RSACryptoServiceProvider csp = (RSACryptoServiceProvider)cert.PublicKey.Key)
                {
                    byte[] bytesData = Encoding.UTF8.GetBytes(text);
                    byte[] bytesEncrypted = csp.Encrypt(bytesData, false);
                    output = Convert.ToBase64String(bytesEncrypted);
                }
                return output;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        

        public static string DecryptText(string encrypted, string PathToPrivateKey)
        {
            string text = string.Empty;

            X509Certificate2 cert = new X509Certificate2(PathToPrivateKey, "Tingate710", X509KeyStorageFlags.UserKeySet);
            using (RSACryptoServiceProvider csp = (RSACryptoServiceProvider)cert.PrivateKey)
            {
                byte[] bytesEncrypted = Convert.FromBase64String(encrypted);
                byte[] bytesDecrypted = csp.Decrypt(bytesEncrypted, false);
                text = Encoding.UTF8.GetString(bytesDecrypted);
            }
            return text;
        }

        public static bool VerifyDigitalSignature(string data, string digitalSignature, string pathToPublicKey)
        {
            return true;
        }

        public static string DecryptString(string encryptedText, string Key)
        {
            return Encryption.encrypt.DecryptString(encryptedText, Key);
        }

        public static string EncryptString(string plainText, string Key)
        {
            return Encryption.encrypt.EncryptString(plainText, Key);
        }

        public static string ByteArrayToString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
        }

        //public static string ExportDataTableToExcel(DataTable dt, string path)
        //{
        //    FileInfo newFile = new FileInfo(path);

        //    ExcelPackage package = new ExcelPackage();
        //    ExcelWorksheet ws = package.Workbook.Worksheets.Add("sheet1");

        //    //set heading
        //    int excelColumn = 1;
        //    foreach (DataColumn dc in dt.Columns)
        //    {
        //        ws.Cells[1, excelColumn].Value = dc.ColumnName;
        //        excelColumn++;
        //    }

        //    ws.Cells[1, 1, 1, dt.Columns.Count].Style.Font.Bold = true;

        //    int i = 2;//row position in excel sheet

        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        int dataColumn = 1;
        //        int tableColumnNumber = 0;
        //        foreach (DataColumn dc in dt.Columns)
        //        {
        //            ws.Cells[i, dataColumn].Value = dr[tableColumnNumber].ToString();
        //            dataColumn++;
        //            tableColumnNumber++;
        //        }
        //        i++;
        //    }
        //    package.SaveAs(newFile);
        //    package.Save();
        //    return path;
        //}

        //public static string ExportObjectsToExcel(Object[] baseObjArray, string path)
        //{
        //    try
        //    {
        //        FileInfo newFile = new FileInfo(path);

        //        ExcelPackage package = new ExcelPackage();
        //        ExcelWorksheet ws = package.Workbook.Worksheets.Add("sheet1");

        //        //we use reflection to 
        //        //1. get the class of object passed
        //        //2. loop thru all properties of that class

        //        FieldInfo[] fields = baseObjArray[0].GetType().GetFields();

        //        //set heading
        //        int excelColumn = 1;
        //        foreach (FieldInfo field in fields)
        //        {
        //            ws.Cells[1, excelColumn].Value = field.Name;
        //            excelColumn++;
        //        }

        //        ws.Cells[1, 1, 1, fields.Length].Style.Font.Bold = true;

        //        int i = 2;//row position in excel sheet
        //        foreach (Object baseObj in baseObjArray)
        //        {
        //            int dataColumn = 1;
        //            foreach (FieldInfo field in fields)
        //            {
        //                string fieldName = field.Name;
        //                //get value from field
        //                object obj = baseObj.GetType().GetField(fieldName).GetValue(baseObj);
        //                //add value to cell
        //                ws.Cells[i, dataColumn].Value = obj.ToString();
        //                dataColumn++;
        //            }
        //            i++;
        //        }
        //        package.SaveAs(newFile);
        //        package.Save();
        //        return path;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

    }
}
