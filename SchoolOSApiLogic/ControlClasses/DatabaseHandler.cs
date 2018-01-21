using Microsoft.Practices.EnterpriseLibrary.Data;
using SchoolOSApiLogic.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;

namespace SchoolOSApiLogic.ControlClasses
{
    internal class DatabaseHandler
    {

        Database db;
        private DbCommand command;
        public string ConnectionString = "KasoziTestPegPaySchools";
        //public string ConnectionString = "TestPegPaySchools";
        //public string ConnectionString = "ElijahTestPegPaySchools";

        public DatabaseHandler()
        {
            try
            {
                db = DatabaseFactory.CreateDatabase(ConnectionString);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        internal DataSet ExecuteDataSet(string storedProcedureName, params object[] Parameters)
        {
            try
            {
                command = db.GetStoredProcCommand(storedProcedureName,
                                                           Parameters
                                                          );
                DataSet ds = db.ExecuteDataSet(command);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal int ExecuteNonQuery(string storedProcedureName, params object[] Parameters)
        {
            try
            {
                command = db.GetStoredProcCommand(storedProcedureName,
                                                           Parameters
                                                          );
                int rows = db.ExecuteNonQuery(command);
                return rows;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Result LogError(string Message,string StackTrace,string Identifier)
        {
            Result result = new Result();
            try
            {
                DatabaseHandler dh = new DatabaseHandler();
                int rowsAffected = dh.ExecuteNonQuery("LogError", new string[] { Identifier, StackTrace, "ALL", Message, "EXCEPTION" });
                result.StatusCode = Globals.SUCCESS_STATUS_CODE;
                result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            }
            catch (Exception ex)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "EXCPTION: " + ex.Message;
            }
            return result;
        }

        internal string InsertIntoAuditLog(AuditLog log)
        {
            try
            {
                command = db.GetStoredProcCommand("InsertIntoAuditTrail",
                                                           log.ActionType,
                                                           log.TableName,
                                                           log.BankCode,
                                                           log.ModifiedBy,
                                                           log.Action
                                                          );
                DataTable datatable = db.ExecuteDataSet(command).Tables[0];
                return datatable.Rows[0][0].ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
