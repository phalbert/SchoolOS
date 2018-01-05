﻿using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class StudentFee : Request
    {
        public string StudentID = "";
        public string ClassCode = "";
        public string FeeID = "";
        public string Email = "";
        public string Amount = "";
        public string FeeType = "";
        public string TranID = "";
        public string PaymentChannel = "";
        public string PaymentDate = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(StudentID))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A STUDENT ID";
                return false;
            }
            if (string.IsNullOrEmpty(FeeID))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A FEE ID";
                return false;
            }

            return base.IsValid();
        }
    }
}
