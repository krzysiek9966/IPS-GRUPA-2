using MahApps.Metro.Controls;
using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DBUplader
{
    /// <summary>
    /// Interaction logic for MDBCommander.xaml
    /// </summary>
    public partial class MDBCommander : MetroWindow
    {
        public MDBCommander()
        {
            InitializeComponent();
            WindowStartupLocation = WindowStartupLocation.CenterScreen;
            Execute.IsEnabled = false;
            MDBTablesComboBox.ItemsSource = MDBToCH.GetCollections();
            FillType();
        }

        private void Execute_Click(object sender, RoutedEventArgs e)
        {
            string tableName = MDBTablesComboBox.SelectedItem.ToString();
            string filter = MDBBox.Text;
            Resp.Text = "";
            Exec(tableName, filter);

        }

        private void FillType()
        {
            string[] l = { "Find", "Group" };
            Type.ItemsSource = l;
        }

        private void Exec(string table, string filter)
        {
            Stopwatch stopwatch = Stopwatch.StartNew(); //creates and start the instance of Stopwatch

            WaitScreen.Splash();

            string command = MDBBox.Text;

            var server = new MongoClient("mongodb://localhost:27017");
            var database = server.GetDatabase("test");

            var coll = database.GetCollection<BsonDocument>(table);
            //var list = coll.Find(command);

            //var list = coll.Find(new BsonDocument()).Limit(5).ToList();

            //filter = "{ price: '480'}";

            //var list = coll.Find("{},{\"name\":1}).limit(100)").ToList();


            try
            {
                int lim = int.Parse(Limit.Text);
                string typ = Type.Text;
                List<BsonDocument> list = new List<BsonDocument>();



                if (lim > 0 && typ == "Find")
                    list = coll.Find(filter).Limit(lim).ToList();
                else if (lim <= 0 && typ == "Find")
                    list = coll.Find(filter).ToList();
                else if (lim > 0 && typ == "Group")
                    list = coll.Aggregate().Group(filter).Limit(lim).ToList();
                else if (lim <= 0 && typ == "Group")
                    list = coll.Aggregate().Group(filter).ToList();

                for (int i = 0; i < list.Count; i++)
                    Resp.AppendText(list[i].ToString() + (Environment.NewLine));
                stopwatch.Stop();

                var elapsedBulkMs = stopwatch.ElapsedMilliseconds;
                Logs xd = new DBUplader.Logs();

                xd.AddLog("--------------------------------------------");
                xd.AddLog("Execute MongoDB Command");
                xd.AddLog(command);
                xd.AddLog($"On table { table }");
                xd.AddLog($"Execute time : { elapsedBulkMs } ms");

                Response.Content = $"OK. { elapsedBulkMs } ms";
            }
            catch
            {
                Response.Content = "Wrong command.";
            }
            

            //var comm = new JsonCommand<BsonDocument>(command);
            //database.RunCommand(comm);

            //db.getCollection('asd').find({ })
        }

        private void setButtonVisibility()
        {
            if ((MDBTablesComboBox.SelectedIndex > -1) && (Type.SelectedIndex > -1))
            {
                Execute.IsEnabled = true;
            }
            else
            {
                Execute.IsEnabled = false;
            }
        }

        private void MDBTablesComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            setButtonVisibility();
        }

        private void Type_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            setButtonVisibility();
        }
    }
}
