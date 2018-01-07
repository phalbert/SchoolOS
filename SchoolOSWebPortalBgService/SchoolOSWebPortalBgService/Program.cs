using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolOSWebPortalBgService
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Processor proc = new Processor();
            proc.ProcessUploadedBulkStudentPaymentsFiles();
            proc.ProcessStudentPayments();
        }
    }
}
