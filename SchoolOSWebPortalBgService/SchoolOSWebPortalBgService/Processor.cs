
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
            List<StudentFee> failedPayments = new List<StudentFee>();
            List<StudentFee> successfullPayments = new List<StudentFee>();

            StudentFee[] payments = bll.GetPaymentsFromFile(file);

            int count = 0;

            foreach (StudentFee payment in payments)
            {
                if (payment.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    bll.LogFileUploadStatus(file.ID, "FAILED", payment.StatusDesc, file.ModifiedBy, count.ToString());
                    failedPayments.Add(payment);
                    continue;
                }

                Result result = bll.SaveStudentPayment(payment);

                if (payment.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    bll.LogFileUploadStatus(file.ID, "FAILED", payment.StatusDesc, file.ModifiedBy, count.ToString());
                    failedPayments.Add(payment);
                    continue;
                }

                bll.LogFileUploadStatus(file.ID, "SUCCESS", "SUCCESS", file.ModifiedBy, count.ToString());
                successfullPayments.Add(payment);
                count++;
            }

            bll.SendResultsToTheUploader(file.Email, successfullPayments, failedPayments);
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

            int count = 0;
            foreach (Student std in all)
            {
                //error when reading the student from file
                if (std.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    bll.LogFileUploadStatus(file.ID, "FAILED", std.StatusDesc, std.ModifiedBy, count.ToString());
                    continue;
                }

                //save student in SchoolOS
                Service schoolAPI = new Service();
                Result result = schoolAPI.SaveStudent(std);
                Console.WriteLine($"Save Student Finished. Status [{result.StatusDesc}]");

                //failed to save student
                if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    bll.LogFileUploadStatus(file.ID, "FAILED", result.StatusDesc, std.ModifiedBy, count.ToString());
                    continue;
                }

                //student saved successfully
                bll.LogFileUploadStatus(file.ID, "SUCCESS", result.StatusDesc, std.ModifiedBy, count.ToString());
                count++;
            }
        }

        public void ProcessStudentPayments()
        {
            try
            {
                StudentFee[] studentPayments = bll.GetUnprocessedStudentPayments();

                int count = 1;
                foreach (StudentFee payment in studentPayments)
                {
                    List<StudentFee> failedPayments = new List<StudentFee>();
                    List<StudentFee> successfullPayments = new List<StudentFee>();

                    Console.WriteLine($"Processing Transaction [{payment.TranID}] to Class [{payment.ClassCode}] and Student [{payment.StudentID}]");
                    CbApi.TransactionRequest[] transactions = bll.GetTransactionRequests(payment);
                    foreach (CbApi.TransactionRequest tr in transactions)
                    {
                        CbApi.Service cbAPI = new CbApi.Service();
                        CbApi.Result result = cbAPI.Transact(tr);

                        Console.WriteLine($"CB Finished. Transaction [{tr.BankTranId}] to {tr.ToAccount}. Status [{result.StatusDesc}]");

                        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
                        {
                            bll.SavePaymentLog(tr.BankTranId, payment.FeeID, payment.StudentID, "FAILED", result.StatusDesc, payment.ModifiedBy);
                            failedPayments.Add(payment);
                            continue;
                        }

                        bll.SavePaymentLog(tr.BankTranId, payment.FeeID, payment.StudentID, "FAILED", result.StatusDesc, payment.ModifiedBy);
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
