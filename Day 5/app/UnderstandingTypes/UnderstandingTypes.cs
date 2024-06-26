/**
using System;

namespace CenturiesConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter number of centuries: ");
            string? input = Console.ReadLine();

            if (int.TryParse(input, out int centuries))
            {
                int years = centuries * 100;
                // Assuming 1 year = 365.24 days
                int days = (int)(years * 365.24);
                long hours = days * 24;
                long minutes = hours * 60;
                long seconds = minutes * 60;
                long milliseconds = seconds * 1000;
                long microseconds = milliseconds * 1000;
                decimal nanoseconds = microseconds * 1000m;

                Console.WriteLine($"{centuries} centuries = {years} years = {days} days = {hours} hours = {minutes} minutes = {seconds} seconds = {milliseconds} milliseconds = {microseconds} microseconds = {nanoseconds} nanoseconds");
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter a valid number of centuries.");
            }
        }
    }
}

**/