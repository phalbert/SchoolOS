using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace CoreBankingLogic.ControlObjects
{

    public class KeyValuePair
    {
        public string Key = "";
        public string Value = "";
    } 

    public class PhoneValidator
    {
        private string okNumber = "";
        private ArrayList validNumbers, invalidNumbers;

        public bool PhoneNumbersOk(string numbers)
        {
            string[] stringSeparators = new string[] { ",", "\r\n" };
            bool phonesok = false;
            string[] phones = numbers.Split(stringSeparators, StringSplitOptions.RemoveEmptyEntries);
            validNumbers = new ArrayList();
            invalidNumbers = new ArrayList();
            foreach (string number in phones)
            {
                if (!number.Trim().Equals(""))
                {
                    if (NumberFormatIsValid(number.Trim()))
                    {
                        //Console.WriteLine(number.Trim() + "'s format is ok");
                        if (!NumberContainsLetters(okNumber.Trim()))
                        {
                            if (NetworkCodeOk(okNumber))
                            {
                                //Console.WriteLine(okNumber + " IS OK");
                                validNumbers.Add(okNumber.Trim());
                            }
                            else
                            {
                                invalidNumbers.Add(number.Trim());
                            }
                        }
                        else
                        {
                            //Console.WriteLine(okNumber + " Contains Letters");
                            invalidNumbers.Add(number.Trim());
                        }
                    }
                    else
                    {
                        //Console.WriteLine(number + " has an invalid number format");
                        invalidNumbers.Add(number.Trim());
                    }
                    if (invalidNumbers.Count > 0)
                    {
                        phonesok = false;
                    }
                    else
                    {
                        phonesok = true;
                    }
                }
            }
            return phonesok;
        }

        public bool NumberFormatIsValid(string number)
        {
            bool isValid = false;
            okNumber = "";
            if (number.Trim().StartsWith("000256") && number.Length == 15)
            {
                okNumber = number.Remove(0, 6);
                isValid = true;
            }
            else if (number.Trim().StartsWith("00256") && number.Length == 14)
            {
                okNumber = number.Remove(0, 5);
                isValid = true;
            }
            else if ((number.Trim().StartsWith("256") && number.Length == 12))
            {
                okNumber = number.Remove(0, 3);
                isValid = true;
            }
            else if ((number.Trim().StartsWith("0") && number.Length == 10))
            {
                okNumber = number.Remove(0, 1);
                isValid = true;
            }
            else if ((number.Trim().StartsWith("7") && number.Length == 9))
            {
                okNumber = number;
                isValid = true;
            }
            else if ((number.Trim().StartsWith("+") && number.Length == 13))
            {
                okNumber = number.Remove(0, 4);
                isValid = true;
            }
            else
            {
                okNumber = number;
                isValid = false;
            }
            return isValid;
        }

        public string GetNetwork(string phoneNumber)
        {
            string network = "";
            phoneNumber = FormatNumber(phoneNumber);
            string code = phoneNumber.Substring(0, 3);
            List<KeyValuePair> codes = new List<KeyValuePair>();
            codes = GetNetworkCodes();
            foreach (KeyValuePair pair in codes)
            {
                if (code == pair.Key)
                {
                    network = pair.Value.ToString();
                    break;
                }
            }
            return network;
        }

        public string FormatNumber(string number)
        {
            string phoneNumber = "";
            if (number.Trim().StartsWith("000256") && number.Length == 15)
            {
                okNumber = number.Remove(0, 6);
            }
            else if (number.Trim().StartsWith("00256") && number.Length == 14)
            {
                okNumber = number.Remove(0, 5);
            }
            else if ((number.Trim().StartsWith("256") && number.Length == 12))
            {
                okNumber = number.Remove(0, 3);
            }
            else if ((number.Trim().StartsWith("0") && number.Length == 10))
            {
                okNumber = number.Remove(0, 1);
            }
            else if ((number.Trim().StartsWith("7") && number.Length == 9))
            {
                okNumber = number;
            }
            else if ((number.Trim().StartsWith("+") && number.Length == 13))
            {
                okNumber = number.Remove(0, 4);
            }
            else
            {
                okNumber = number;
            }

            return okNumber;
        }

        public ArrayList GetInvalidNumbers()
        {
            return invalidNumbers;
        }

        public ArrayList GetValidNumbers()
        {
            return validNumbers;
        }

        private bool NumberContainsLetters(string number)
        {
            bool containsLetters = false;
            ArrayList digits = new ArrayList();
            digits.Add('0');
            digits.Add('1');
            digits.Add('2');
            digits.Add('3');
            digits.Add('4');
            digits.Add('5');
            digits.Add('6');
            digits.Add('7');
            digits.Add('8');
            digits.Add('9');
            char[] chars = number.ToCharArray();
            foreach (char c in chars)
            {
                if (!digits.Contains(c))
                {
                    containsLetters = true;
                    break;
                }
            }
            return containsLetters;
        }

        private bool NetworkCodeOk(string okNumber)
        {
            bool ok = false;
            string code = okNumber.Substring(0, 3);
            List<KeyValuePair> codes = new List<KeyValuePair>();
            codes = GetNetworkCodes();

            foreach (KeyValuePair pair in codes)
            {
                if (code == pair.Key)
                {
                    ok = true;
                    break;
                }
            }

            return ok;
        }

        private List<KeyValuePair> GetNetworkCodes()
        {
            string[] codes = { "70", "75", "77", "78", "39", "71", "74", "72", "79" };
            List<KeyValuePair> networkCodes = new List<KeyValuePair>();

            foreach (string str in codes)
            {
                for (int x = 0; x < 10; x++)
                {
                    KeyValuePair pair = new KeyValuePair();
                    pair.Key = str + "" + x;

                    if (str == "70" || str == "75")
                    {
                        pair.Value = "AIRTEL";
                    }
                    else if (str == "77" || str == "78" || str == "39")
                    {
                        pair.Value = "MTN";
                    }
                    else if (str == "79")
                    {
                        pair.Value = "AFRICEL";
                    }
                    else if (str == "71")
                    {
                        pair.Value = "UTL";
                    }
                    else if (str == "74")
                    {
                        pair.Value = "SMART";
                    }
                    else if (str == "72")
                    {
                        pair.Value = "K2";
                    }

                    networkCodes.Add(pair);
                }
            }

            return networkCodes;
        }

        public static string GetIntlFormat(string number)
        {
            string phoneNumber = "";
            if (number.Trim().StartsWith("000256") && number.Length == 15)
            {
                phoneNumber = number.Remove(0, 6);
            }
            else if (number.Trim().StartsWith("00256") && number.Length == 14)
            {
                phoneNumber = number.Remove(0, 5);
            }
            else if ((number.Trim().StartsWith("256") && number.Length == 12))
            {
                phoneNumber = number.Remove(0, 3);
            }
            else if ((number.Trim().StartsWith("0") && number.Length == 10))
            {
                phoneNumber = number.Remove(0, 1);
            }
            else if ((number.Trim().StartsWith("7") && number.Length == 9))
            {
                phoneNumber = number;
            }
            else if ((number.Trim().StartsWith("+") && number.Length == 13))
            {
                phoneNumber = number.Remove(0, 4);
            }
            else
            {
                phoneNumber = number;
            }

            phoneNumber = "256" + phoneNumber;
            return phoneNumber;
        }

    }
}
