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
                int SuppliersCount = context.Suppliers.Count();
                Assert.AreEqual(3, SuppliersCount);

                int BoxesCount = context.Boxes.Count();
                int ManuCount = context.Manufacturers.Count();


                var L2EQuery = from st in context.Suppliers
                               where st.Name == "Supplier1"
                               select st;

                var supplier = L2EQuery.FirstOrDefault<Supplier>();

                Assert.AreEqual("Supplier1", supplier.Name);

                var L2EQuery2 = from st in context.Suppliers
                                where st.Name.StartsWith("Supplier")
                                select st;

                int count = L2EQuery2.Count();
                Assert.AreEqual(3, count);

            }

            //Assert.Fail();
            
        }
    }
}