using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Office.Interop.Excel;

namespace ImportExcel
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadExcelFile(@"C:\Users\Ghost\source\repos\ImportExcel\ImportExcel\bin\Debug\Выходы.xlsx");
        }
        private void LoadExcelFile(string filename)
        {
            var sheetName = "Лист1";
            DataTable table = new DataTable();
            using (System.Data.OleDbConnection co = new System.Data.OleDb.OleDbConnection(
                "Provider=Microsoft.ACE.OLEDB.12.0; " +
                "Data Source='" + filename + "';" +
                "Extended Properties=\"Excel 12.0;HDR=YES;IMEX=1\""))

            using (System.Data.OleDb.OleDbDataAdapter import =
            new System.Data.OleDb.OleDbDataAdapter(
            "select * from [" + sheetName + "$]", co))
                import.Fill(table);
        }
    }
}
