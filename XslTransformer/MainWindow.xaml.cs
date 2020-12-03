using Microsoft.Win32;
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Xml.Xsl;

namespace XslTransformer
{
    public partial class MainWindow : Window
    {
        #region Objects

        OpenFileDialog fileDialog;

        #endregion

        #region Ctor

        public MainWindow()
        {
            InitializeComponent();

            fileDialog = new OpenFileDialog();

            InputFileToTransform.IsEnabled = false;

            InputTransformFile.IsEnabled = false;
            
            OutputPath.IsEnabled = false;
            
            SelectTransformerFile.IsEnabled = false;
            
            SelectOutputPath.IsEnabled = false;
            
            TransformButton.IsEnabled = false;
        }

        #endregion

        #region Private methods

        private void SelectToTransformFileButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog(InputFileToTransform, "XML-files (*.xml) | *.xml");
            SelectTransformerFile.IsEnabled = true;
        }

        private void SelectTransformerFile_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog(InputTransformFile, "XSLT-files (*.xslt) | *.xslt" +
                                               "|XSL-files (*.xsl)|*.xsl");
            SelectOutputPath.IsEnabled = true;
        }

        private void SelectOutputPath_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog(OutputPath, "All files (*.*) | *.*");
            TransformButton.IsEnabled = true;
        }

        private void TransformButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                XslCompiledTransform compiledTransform = new XslCompiledTransform();
                compiledTransform.Load(InputTransformFile.Text);
                compiledTransform.Transform(InputFileToTransform.Text, OutputPath.Text);

                Result.Source = new Uri(OutputPath.Text);

                Status.Foreground = Brushes.Green;
                Status.Content = "Success";

                mainWindow.Height = 650;
                mainWindow.Width = 900;
            }
            catch (Exception)
            {
                Status.Foreground = Brushes.Red;
                Status.Content = "Error";
            }
        }

        private void OpenFileDialog(TextBox textBox, String filter)
        {
            fileDialog.Filter = filter;
            fileDialog.ShowDialog();
            textBox.Text = fileDialog.FileName;
        }

        #endregion
    }
}
