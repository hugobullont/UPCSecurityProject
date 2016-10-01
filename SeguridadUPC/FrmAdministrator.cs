using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SeguridadUPC
{
    public partial class FrmAdministrator : Form
    {
        private Login frmLogin;
        public FrmAdministrator()
        {
            InitializeComponent();
        }
        public FrmAdministrator(Login value)
        {
            InitializeComponent();
            frmLogin = value;

        }
        private void logOutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
            frmLogin.Show();
            
        }

        private void FrmAdministrator_FormClosed(object sender, FormClosedEventArgs e)
        {
            frmLogin.Show();
        }
    }
}
