using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SchoolOSWebPortalBgService.SchoolsAPI;

namespace SchoolOSWebPortalBgService
{
    public class PaymentsProcessor
    {
        internal Result ProcessPayment(StudentFee payment)
        {
            Result paymentResult = new Result();
            BussinessLogic bll = new BussinessLogic();

            if (payment.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                paymentResult.StatusCode = payment.StatusCode;
                paymentResult.StatusDesc = payment.StatusDesc;
                return paymentResult;
            }

            Result result = bll.SaveStudentPayment(payment);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                paymentResult.StatusCode = result.StatusCode;
                paymentResult.StatusDesc = result.StatusDesc;
                return paymentResult;
            }

            paymentResult.StatusCode = Globals.SUCCESS_STATUS_CODE;
            paymentResult.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
            return paymentResult;
        }
    }
}
