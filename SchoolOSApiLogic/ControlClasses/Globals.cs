using SchoolOSApiLogic.Entities;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;


public static class Globals
{
    public const string SUCCESS_STATUS_CODE = "0";
    public const string SUCCESS_STATUS_DESC = "SUCCESS";
    public const string FAILURE_STATUS_CODE = "100";
    public const string HIDE_FAILURE_STATUS_CODE = "105";
    public const string PENDING_STATUS_CODE = "1000";
    public const string DEFAULT_PICTURE_ID = "Default";

    public static string NOT_AVAILABLE_STRING = "N/A";

    public static Result CheckForNulls(object obj, string nullableProperties)
    {
        Result result = new Result();

        //nullable properties will be passed in one string separated by a | symbol
        string[] nullables = nullableProperties.Split('|');
        List<string> propertiesThatAreAllowedToBeNull = new List<string>();
        propertiesThatAreAllowedToBeNull.AddRange(nullables);

        //get properties of the object using reflection
        FieldInfo[] oldFields = obj.GetType().GetFields(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.DeclaredOnly);
        foreach (FieldInfo objProperties in oldFields)
        {
            string propertyName = objProperties.Name;
            string propertyValue = objProperties.GetValue(obj) as string;

            //skip check if property can be null
            if (propertiesThatAreAllowedToBeNull.Contains(propertyName))
            {
                continue;
            }

            //check if a property which cant be null is empty
            if (string.IsNullOrEmpty(propertyValue))
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = $"PLEASE SUPPLY A VALUE IN FIELD [{propertyName}]";
                return result;
            }
        }

        result.StatusCode = Globals.SUCCESS_STATUS_CODE;
        result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
        return result;
    }
}

