
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
            catch (Exception ex)
            {
                Console.WriteLine("Exception: {0}", ex.Message);
            }
        }

        private void ProcessStudentPaymentFile(UploadedFile file)
        {
            List<object> failedPayments = new List<object>();
            List<object> successfullPayments = new List<object>();

            StudentFee[] payments = bll.GetPaymentsFromFile(file);

            int count = 1;
            foreach (StudentFee payment in payments)
            {
                Console.WriteLine($"Processing Transaction [{payment.TranID}] to Class [{payment.ClassCode}] and Student [{payment.StudentID}]");
                PaymentsProcessor paymentsProc = new PaymentsProcessor();
                Result result = paymentsProc.ProcessPayment(payment);

                Console.WriteLine($"Processing Finished [{payment.TranID}] Status {result.StatusDesc}");
                string Status = result.StatusCode == Globals.SUCCESS_STATUS_CODE ? Globals.SUCCESS_STATUS_TEXT : "FAILED";
                bll.LogFileUploadStatus(file.ID, Status, result.StatusDesc, file.ModifiedBy, file.SchoolCode, count.ToString());

                if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    failedPayments.Add(payment);
                    continue;
                }

                successfullPayments.Add(payment);
                count++;
            }

            Result sendResult = bll.SendResultsToTheUploader(file.Email, successfullPayments, failedPayments);
            bll.UpdateFileProcessedStatus(file);
        }

        public void ProcessUploadedStudents()
        {
            try
            {
                UploadedFile[] files = bll.GetUnprocessedUploadedFiles("STUDENTS");

                foreach (UploadedFile file in files)
                {
                    ProcessStudentsFile(file);
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: {0}", ex.Message);
            }
        }

        private void ProcessStudentsFile(UploadedFile file)
        {
            //read students from the uploaded file
            Student[] all = bll.GetStudentsInUploadedFile(file);

            List<object> failedPayments = new List<object>();
            List<object> successfullPayments = new List<object>();

            int count = 1;
            foreach (Student std in all)
            {
                Result result = bll.SaveStudent(std);

                Console.WriteLine($"Save Student Finished. Status [{result.StatusDesc}]");
                string Status = result.StatusCode == Globals.SUCCESS_STATUS_CODE ? Globals.SUCCESS_STATUS_TEXT : "FAILED";
                bll.LogFileUploadStatus(file.ID, Status, result.StatusDesc, file.ModifiedBy, file.SchoolCode, count.ToString());


                //failed to save student
                if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    failedPayments.Add(std);
                    continue;
                }

                //student saved successfully
                successfullPayments.Add(std);
                count++;
            }

            Result sendResult = bll.SendResultsToTheUploader(file.Email, successfullPayments, failedPayments);
            bll.UpdateFileProcessedStatus(file);
        }

        public void ProcessStudentPayments()
        {
            try
            {
                StudentFee[] studentPayments = bll.GetUnprocessedStudentPayments();
                int count = 1;

                foreach (StudentFee payment in studentPayments)
                {
                    List<object> failedPayments = new List<object>();
                    List<object> successfullPayments = new List<object>();

                    Console.WriteLine($"Processing Transaction [{payment.TranID}] to Class [{payment.ClassCode}] and Student [{payment.StudentID}]");

                    CbApi.TransactionRequest[] transactions = bll.GetTransactionRequests(payment);

                    foreach (CbApi.TransactionRequest tr in transactions)
                    {
                        Result result = bll.SendToSchoolsCB(tr);
                        bll.SavePaymentLog(payment, result);

                        Console.WriteLine($"CB Finished. Transaction [{tr.BankTranId}] to {tr.ToAccount}. Status [{result.StatusDesc}]");

                        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
                        {
                            failedPayments.Add(payment);
                            continue;
                        }

                        successfullPayments.Add(payment);
                    }

                    bll.SendResultsToTheUploader(payment.Email, successfullPayments, failedPayments);
                    bll.UpdateFeesProcessedStatus(payment);
                    count++;
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
