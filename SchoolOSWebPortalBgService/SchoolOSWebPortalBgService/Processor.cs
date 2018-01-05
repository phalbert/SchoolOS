
using SchoolOSWebPortalBgService.SchoolsAPI;
using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSWebPortalBgService
{
    public class Processor
    {
        BussinessLogic bll = new BussinessLogic();
        public void ProcessUploadedBulkStudentPaymentsFiles()
        {
            try
            {
                UploadedFile[] files = bll.GetUnprocessedStudentPaymentFiles();

                foreach (UploadedFile file in files)
                {
                    ProcessStudentPaymentFile(file);
                }

            }
            catch (Exception)
            {

            }
        }

        private void ProcessStudentPaymentFile(UploadedFile file)
        {
            List<StudentFee> failedPayments = new List<StudentFee>();
            List<StudentFee> successfullPayments = new List<StudentFee>();

            StudentFee[] payments = bll.GetPaymentsFromFile(file);

            foreach (StudentFee payment in payments)
            {
                if (payment.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    failedPayments.Add(payment);
                    continue;
                }

                Result result = bll.SaveStudentPayment(payment);

                if (payment.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    failedPayments.Add(payment);
                    continue;
                }

                successfullPayments.Add(payment);
            }

            bll.UpdateFileProcessedStatus(file);
            bll.SendResultsEmail(file.Email, successfullPayments, failedPayments);
        }

        public void ProcessUploadedStudents()
        {
            try
            {

            }
            catch (Exception)
            {

            }
        }

        public void ProcessStudentPayments()
        {
            try
            {
                StudentFee[] studentPayments = bll.GetUnprocessedStudentPayments();
                foreach(StudentFee payment in studentPayments)
                {
                    List<StudentFee> failedPayments = new List<StudentFee>();
                    List<StudentFee> successfullPayments = new List<StudentFee>();

                    Console.WriteLine($"Processing Transaction [{payment.TranID}] to Class [{payment.ClassCode}] and Student [{payment.StudentID}]");
                    CbApi.TransactionRequest[] transactions = bll.GetTransactionRequests(payment);
                    foreach(CbApi.TransactionRequest tr in transactions)
                    {
                        CbApi.Service cbAPI = new CbApi.Service();
                        CbApi.Result result = cbAPI.Transact(tr);

                        Console.WriteLine($"CB Finished. Transaction [{tr.BankTranId}] to {tr.ToAccount}. Status [{result.StatusDesc}]");
                        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
                        {
                            failedPayments.Add(payment);
                            continue;
                        }

                        successfullPayments.Add(payment);
                    }

                    bll.UpdateFeesProcessedStatus(payment);
                    bll.SendResultsEmail(payment.Email, successfullPayments, failedPayments);
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void ProcessUploadedSchools()
        {
            try
            {

            }
            catch (Exception)
            {

            }
        }
    }
}
