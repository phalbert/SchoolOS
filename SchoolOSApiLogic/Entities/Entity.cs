using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class Entity
    {
        public string ModifiedBy = "";

        public virtual bool IsValid()
        {
            return true;
        }
    }
}
