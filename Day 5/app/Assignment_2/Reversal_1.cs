/**

namespace Reversal_With_Char
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter a string to reverse:");
            string input = Console.ReadLine();

            char[] charArray = input.ToCharArray();

            Array.Reverse(charArray);

            string reversedString = new string(charArray);

            Console.WriteLine(reversedString);
        }
    }
}




**/