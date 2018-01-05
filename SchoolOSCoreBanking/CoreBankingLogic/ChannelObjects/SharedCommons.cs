using System;
using System.Security.Cryptography;
using System.Text;


public static class SharedCommons
{
    public static string GeneratePassword()
    {
        string Password = "T3rr1613";
        return Password;
    }

    public static string ComputeHash(string input, HashAlgorithm algorithm)
    {
        Byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        Byte[] hashedBytes = algorithm.ComputeHash(inputBytes);
        return BitConverter.ToString(hashedBytes);
    }

    public static string HashPassword(string password)
    {
        return ComputeHash(password, HashAlgorithm.Create("MD5"));
    }

    public static decimal GetNumericValueElseZero(string anIntString)
    {
        try
        {
            return decimal.Parse(anIntString);
        }
        catch (Exception ex)
        {
            return 0;
        }
    }

    internal static bool GetBoolValueElseFalse(string v)
    {
        try
        {
            return bool.Parse(v);
        }
        catch (Exception)
        {
            return false;
        }
    }
}

