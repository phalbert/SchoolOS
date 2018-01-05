using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ChannelControls
{
    //https://stephenhaunts.com/2013/06/06/validating-card-numbers-with-the-luhn-check-algorithm/
    //http://www.academia.edu/7861854/Validation_of_Credit_Card_Numbers_Using_the_C_Programming_Language
    public static class CardValidator
    {
        public static bool IsValidCardNumber(int cardNumber)
        {
            return IsValidCardNumber(cardNumber.ToString());
        }

        public static bool IsValidCardNumber(string cardNumber)
        {
            cardNumber = cardNumber.Replace(" ", "");

            //FIRST STEP: Double each digit starting from the right
            int[] doubledDigits = new int[cardNumber.Length / 2];
            int k = 0;
            for (int i = cardNumber.Length - 2; i >= 0; i -= 2)
            {
                int digit = int.Parse(cardNumber[i].ToString());
                doubledDigits[k] = digit * 2;
                k++;
            }

            //SECOND STEP: Add up separate digits
            int total = 0;
            foreach (int i in doubledDigits)
            {
                string number = i.ToString();
                for (int j = 0; j < number.Length; j++)
                {
                    total += int.Parse(number[j].ToString());
                }
            }

            //THIRD STEP: Add up other digits
            int total2 = 0;
            for (int i = cardNumber.Length - 1; i >= 0; i -= 2)
            {
                int digit = int.Parse(cardNumber[i].ToString());
                total2 += digit;
            }

            //FOURTH STEP: Total
            int final = total + total2;

            //Well formed number will divide evenly by 10 to give modulus of 0
            return final % 10 == 0;
        }
    }
}
