using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class UploadedFile:Request
    {
        public string ID = "";
        public string OperationCode = "";
        public string FileContents = "";
        public string FileName = "";
        public string Email = "";
        public string Channel = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(OperationCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A OPERATION CODE";
                return false;
            }
            if (string.IsNullOrEmpty(FileContents))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A FILE WITH DATA";
                return false;
            }
            if (string.IsNullOrEmpty(FileName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A FILE NAME";
                return false;
            }

            return base.IsValid();
        }
    }
}
