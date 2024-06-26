
/**
namespace PrintAPyramid
{
    class Program
    {
        static void Main(string[] args)
        {
            int pyramidHeight = 5;

            for (int i = 1; i <= pyramidHeight; i++)
            {
                for (int j = 1; j <= pyramidHeight - i; j++)
                {
                    Console.Write(" ");
                }

                for (int k = 1; k <= (2 * i - 1); k++)
                {
                    Console.Write("*");
                }

                Console.WriteLine();
            }
        }
    }
}
**/
