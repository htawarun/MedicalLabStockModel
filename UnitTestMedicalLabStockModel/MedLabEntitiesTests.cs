using Microsoft.VisualStudio.TestTools.UnitTesting;
using MedicalLabStockModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedicalLabStockModel.Tests
{
    [TestClass()]
    public class MedLabEntitiesTests
    {
        [TestMethod()]
        public void MedLabEntitiesTest()
        {
            using (var context = new MedLabEntities())
            {
                var L2EQuery = from st in context.Suppliers
                               where st.Name == "Bill"
                               select st;

                var student = L2EQuery.FirstOrDefault<Supplier>();
            }

            Assert.Fail();
        }
    }
}