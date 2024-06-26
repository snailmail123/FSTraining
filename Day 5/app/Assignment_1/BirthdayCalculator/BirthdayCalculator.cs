/**
using System;

namespace BirthdayCalculator
{
    class Program
    {
        static void Main(string[] args)
        {
            DateTime birthDate = new DateTime(1996, 10, 25); 
            DateTime currentDate = DateTime.Today;
            int daysOld = (currentDate - birthDate).Days;
            Console.WriteLine($"You are {daysOld} days old.");
        }
    }
}
**/