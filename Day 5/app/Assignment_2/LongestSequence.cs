/**
namespace LongestSequence;

class Program
{
    static void Main()
    {
        int[] numbers1 = { 2, 1, 1, 2, 3, 3, 2, 2, 2, 1, 2, 2, 2 };
        int[] numbers2 = { 1, 1, 1, 2, 3, 1, 3, 3, 1, 1, 1 };
        int[] numbers3 = { 4, 4, 4, 4, 4, 4, 4, 4 };
        int[] numbers4 = { 0, 1, 1, 5, 2, 2, 6, 3, 3, 1, 1 };

        FindLongestSequence(numbers1);
        FindLongestSequence(numbers2);
        FindLongestSequence(numbers3);
        FindLongestSequence(numbers4);
    }

    static void FindLongestSequence(int[] numbers)
    {
        int longestSeqStart = 0;
        int longestSeqLength = 1;

        int currentSeqStart = 0;
        int currentSeqLength = 1;

        for (int i = 1; i < numbers.Length; i++)
        {
            if (numbers[i] == numbers[currentSeqStart])
            {
                currentSeqLength++;
            }
            else
            {
                if (currentSeqLength > longestSeqLength)
                {
                    longestSeqStart = currentSeqStart;
                    longestSeqLength = currentSeqLength;
                }
                currentSeqStart = i;
                currentSeqLength = 1;
            }
        }

        if (currentSeqLength > longestSeqLength)
        {
            longestSeqStart = currentSeqStart;
            longestSeqLength = currentSeqLength;
        }

        Console.WriteLine("Longest sequence:");
        for (int i = longestSeqStart; i < longestSeqStart + longestSeqLength; i++)
        {
            Console.WriteLine(numbers[i] + " ");
        }
    }
}
**/