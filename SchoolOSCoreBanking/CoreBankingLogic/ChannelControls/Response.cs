using System;
using System.Collections.Generic;
using System.Text;
using CoreBankingLogic.ExposedObjects;
using CoreBankingLogic.ExposedObjects.ChannelObjects;
using CoreBankingLogic.ChannelObjects;

namespace CoreBankingLogic.ChannelControls
{
    public class PostResponse : Result
    {
        public string MerchantId = "";
        public new string RequestId = "";
        public string RunningBalance = "";

        private Customer customer;
        private List<MerchantTransaction> merchantTrans;
        private List<Customer> customers;
        private List<KeyValuePair> valuePair;
        private MerchantTransaction merchantTransaction;

        public MerchantTransaction MerchantTransaction
        {
            get { return merchantTransaction; }
            set { merchantTransaction = value; }
        }

        public Customer Customer
        {
            get { return customer; }
            set { customer = value; }
        }

        public List<KeyValuePair> ValuePair
        {
            get { return valuePair; }
            set { valuePair = value; }
        }

        public List<MerchantTransaction> MerchantTrans
        {
            get { return merchantTrans; }
            set { merchantTrans = value; }
        }
    }
}
