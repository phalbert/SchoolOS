using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SchoolOSWebPortalBgService
{
    public class Program
    {
        public static void Main(string[] args)
        {
            while (true)
            {
                Processor proc = new Processor();
                //proc.ProcessUploadedStudents();
                proc.ProcessUploadedBulkStudentPaymentsFiles();
                proc.ProcessStudentPayments();
                Thread.Sleep(new TimeSpan(0, 0, 5));
            }
        }
    }
}
