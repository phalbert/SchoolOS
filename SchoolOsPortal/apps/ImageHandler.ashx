<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;
using System.Text.RegularExpressions;

public class ImageHandler : IHttpHandler
{
    Bussinesslogic bll = new Bussinesslogic();

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            string _imageId = context.Request.QueryString["id"];

            if (string.IsNullOrEmpty(_imageId))
            {
                _imageId = "Default";
            }

            string base64string = bll.GetImageById(_imageId);
            context.Response.ContentType = GetImageType(base64string);
            context.Response.BinaryWrite(GetImageBytes(base64string));
        }
        catch (Exception ex)
        {
            bll.LogError("ImageHandler", ex.StackTrace, "ALL", ex.Message, "EXCEPTION");
        }

    }

    public byte[] GetImageBytes(string data)
    {
        string base64Data = Regex.Match(data, @"data:image/(?<type>.+?),(?<data>.+)").Groups["data"].Value;
        byte[] imgBytes = Convert.FromBase64String(base64Data);
        return imgBytes;
    }

    public string GetImageType(string data)
    {
        string type = Regex.Match(data, @"data:image/(?<type>.+?),(?<data>.+)").Groups["type"].Value;
        return type;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}