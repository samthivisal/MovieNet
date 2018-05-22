using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.CommandWpf;

namespace MovieNetFront
{
    public class MainViewModel : ViewModelBase
    {
        public MainViewModel()
        {
            Name = "Bonjour MVVM";
            MyCommand = new RelayCommand(MyCommandExecute, MyCommandCanExecute);
        }

        private string _name;

        public string Name
        {
            get { return _name; }
            set {
                _name = value;
                RaisePropertyChanged();
            }
        }

        public RelayCommand MyCommand { get; }

        void MyCommandExecute()
        {
            Name = "Hello moi, tu as cliqué!";
        }

        bool MyCommandCanExecute()
        {
            return true;
        }
    }
}
