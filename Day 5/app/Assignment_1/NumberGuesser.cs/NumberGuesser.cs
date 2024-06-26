/**
namespace NumberGuesser
{
    class Program
    {
        static void Main(string[] args)
        {
            int correctNumber = new Random().Next(3) + 1;
            Console.WriteLine("Guess a number between 1 and 3: ");
            try
            {
                int guessedNumber = int.Parse(Console.ReadLine());
                if (guessedNumber > correctNumber)
                {
                    Console.WriteLine("You guessed too high!");
                }
                else if (guessedNumber < correctNumber)
                {
                    Console.WriteLine("You guess too low!");
                }
                else
                {
                    Console.WriteLine("You guessed the correct number!");
                }

            }
            catch (Exception)
            {
                Console.WriteLine("Not a number");
            }
        }
    }
}
**/