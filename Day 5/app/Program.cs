
namespace CenturiesConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.Write("Enter number of centuries: ");
                string input = Console.ReadLine();

                if (input == null)
                {
                    throw new ArgumentNullException("Input cannot be null");
                }

                int centuries = int.Parse(input);

                int years = centuries * 100;
                int days = (int)(years * 365.24);
                long hours = days * 24;
                long minutes = hours * 60;
                long seconds = minutes * 60;
                long milliseconds = seconds * 1000;
                long microseconds = milliseconds * 1000;
                decimal nanoseconds = microseconds * 1000m;

                Console.WriteLine($"{centuries} centuries = {years} years = {days} days = {hours} hours = {minutes} minutes = {seconds} seconds = {milliseconds} milliseconds = {microseconds} microseconds = {nanoseconds} nanoseconds");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Unexpected error: {ex.Message}");
            }
        }
    }
}
