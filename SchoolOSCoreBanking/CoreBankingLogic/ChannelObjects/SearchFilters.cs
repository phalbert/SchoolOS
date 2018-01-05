using System;
using System.Collections.Generic;
using System.Text;
using CoreBankingLogic.ChannelControls;
using CoreBankingLogic.ExposedObjects.ChannelObjects;
using System.Globalization;

namespace CoreBankingLogic.ChannelObjects
{
    public class SearchFilters : Defaults
    {
        public string ReferenceId = "";
        public string MerchantId = "";
        public string Medium = "";
        public string EndDate = "";
        public string StartDate = "";
        public string ResultSize = "";
        public string Utility = "";
        public string UserPhone = "";

        public bool isValidUtilitySearch()
        {
            bool isValid = false;
            ChannelLogic bll = new ChannelLogic(RequestAgent, Channel);

            if (string.IsNullOrEmpty(Utility))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE PROVIDE A UYILITY CODE";
            }
            else if (string.IsNullOrEmpty(ReferenceId))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE A CUSTOMER REFERENCE";
            }
            else if (!IsValidSearchTransaction() && string.IsNullOrEmpty(MerchantId))
            {
                StatusCode = "100";
            }
            else
            {
                isValid = true;
            }
            return isValid;
        }

        public bool isValidGetStatementRequest()
        {
            bool isValid = false;
            ChannelLogic bll = new ChannelLogic(RequestAgent, Channel);

            try
            {
                if (!IsValidSearchTransaction())
                {
                    StatusCode = "100";
                }
                else if (string.IsNullOrEmpty(StartDate))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A START DATE";

                }
                else if (!bll.IsValidDate(StartDate))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A VALID START DATE";
                }
                else if (!bll.IsValidDate(EndDate))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A VALID END DATE";
                }
                else
                {
                    ConvertDates();
                    isValid = true;
                }
            }
            catch (Exception)
            {
            }
            return isValid;
        }

        private void ConvertDates()
        {
            string[] formats = { "dd/MM/yyyy" };
            DateTime sDate, eDate;

            if (DateTime.TryParseExact(StartDate, formats, new CultureInfo("en-US"), DateTimeStyles.None, out sDate))
            {
                StartDate = sDate.ToString("yyyy-MM-dd");
            }
            if (DateTime.TryParseExact(EndDate, formats, new CultureInfo("en-US"), DateTimeStyles.None, out eDate))
            {
                EndDate = eDate.ToString("yyyy-MM-dd");
            }
        }

        internal bool IsValidNotificationUpdateRequest()
        {
            bool isValid = false;

            if (!IsValidSearchTransaction())
            {
                StatusCode = "100";
            }
            else if (string.IsNullOrEmpty(ReferenceId))
            {
                StatusCode = "100";
                StatusDesc = "UPDATE LIST IS EMPTY";
            }
            else
            {
                isValid = true;
            }
            return isValid;
        }

        public bool IsValidSearchTransaction()
        {
            bool isValid = false;
            try
            {
                ChannelLogic bll = new ChannelLogic(RequestAgent, Channel);

                if (string.IsNullOrEmpty(RequestAgent))
                {
                    StatusCode = "100";
                    StatusDesc = "UNKNOWN REQUEST SOURCE";
                }
                else if (string.IsNullOrEmpty(ReferenceId))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A SEARCH REFERENCE";
                }
                else if (string.IsNullOrEmpty(MerchantId))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A MERCHANT ID";
                }
                else if (!bll.IsValidMerchant(MerchantId))
                {
                    StatusCode = "100";
                    StatusDesc = bll.StatusDesc;
                }
                else if (!bll.IsValidChannel(Channel))
                {
                    StatusCode = "100";
                    StatusDesc = "UNKNOWN CHANNEL";
                }
                else if (string.IsNullOrEmpty(ApiUsername))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A CHANNEL USERNAME";
                }
                else if (string.IsNullOrEmpty(ApiPassword))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A CHANNEL PASSWORD";
                }
                else if (!bll.IsValidChannelCredentials(ApiUsername, ApiPassword, Channel))
                {
                    StatusCode = "100";
                    StatusDesc = bll.StatusDesc;
                }
                else
                {
                    isValid = true;
                }
            }
            catch (Exception ee)
            {
                StatusCode = "100";
                StatusDesc = "INTERNAL SYSTEM FAILURE";
                throw ee;
            }
            return isValid;
        }
    }
}
