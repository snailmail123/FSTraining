/**
using System;

namespace IncrementCounter
{
    class Program
    {
        static void Main(string[] args)
        {
            for (int outer = 1; outer <= 4; outer++)
            {
                for (int inner = 0; inner <= 24; inner += outer)
                {
                    if (inner > 0)
                    {
                        Console.Write(",");
                    }
                    Console.Write(inner);
                }
                Console.WriteLine();
            }
        }
    }
}
**/
