using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for MyEventArgs
/// </summary>
public class MyEventArgs : EventArgs
{
    public string PegPayId = "";
    public string ThirdPartyId = "";
    public string RequestID = "";

    public MyEventArgs()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}