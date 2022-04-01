using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model.ViewModel
{
    public class ReceiptDetailPrintToPfdViewModel
    {
        public ReceiptModel receiptModel { get; set; }
        public List<ReceiptDetailModel> lstReceiptDetailModel { get; set; }
    }
}
