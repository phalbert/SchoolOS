using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects.ChannelObjects
{
    public class Defaults : Result
    {
        public string ApiUsername = "";
        public string ApiPassword = "";
        public string Channel = "";
        public string RequestAgent = "";

        internal bool IsValidRequest()
        {
            //Lets start validations
            if (string.IsNullOrEmpty(this.ApiUsername))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AN API USERNAME";
                return false;
            }
            if (string.IsNullOrEmpty(this.ApiPassword))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AN API PASSWORD";
                return false;
            }
            if (string.IsNullOrEmpty(this.Channel))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A CHANNEL";
                return false;
            }
            if (string.IsNullOrEmpty(this.RequestAgent))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A REQUEST AGENT";
                return false;
            }
            return true;
        }

    }
}
