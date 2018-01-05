using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Data;

namespace CoreBankingLogic.ChannelControls
{
    public class Logger
    {
        DatabaseHandler dh = new DatabaseHandler();

        public void LogSystemError(string channel, string message, string requestAgent, string utility, string merchantId)
        {
            try
            {
                object[] data = { channel, message, requestAgent, utility, merchantId };
                bool executed = dh.ExecuteNonQuery("LogFailedRequest", data);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void LogSystemExceptions(string method, string message, string requestAgent)
        {
            try
            {
                object[] data = { method, message, requestAgent };
                bool executed = dh.ExecuteNonQuery("LogError", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int LogSystemRequest(string requestAgent, string channel, string tranId, string request)
        {
            int updated = -1;
            try
            {
                object[] data = { requestAgent, channel, tranId, request };
                DataTable table = dh.GetDataTable("LogSystemRequest", data);
                if (table.Rows.Count > 0)
                {
                    string id = table.Rows[0]["recordid"].ToString();
                    Int32.TryParse(id, out updated);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return updated;
        }

        public void LogToFile(Exception exception, string message, string requestAgent)
        {
            string fileDir = @"D:\MerchantLogs";

            if (!Directory.Exists(fileDir))
            {
                Directory.CreateDirectory(fileDir);
            }

            string errorLog = @"D:\MerchantLogs\log_exceptions_" + DateTime.Today.ToString("yyyy_MM_dd") + ".txt";
            File.WriteAllText(errorLog, exception.Message + "requestSender##" + requestAgent + "=" + message);
        }
    }
}
