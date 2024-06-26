/**
namespace FrequencyFinder;

class Program
{
    static void Main()
    {
        int[] numbers1 = { 4, 1, 1, 4, 2, 3, 4, 4, 1, 2, 4, 9, 3 };
        int[] numbers2 = { 7, 7, 7, 0, 2, 2, 2, 0, 10, 10, 10 };

        FindMostFrequentNumber(numbers1);
        FindMostFrequentNumber(numbers2);
    }

    static void FindMostFrequentNumber(int[] numbers)
    {
        Dictionary<int, int> frequency = new Dictionary<int, int>();

        foreach (int number in numbers)
        {
            if (frequency.ContainsKey(number))
            {
                frequency[number]++;
            }
            else
            {
                frequency[number] = 1;
            }
        }

        int maxFrequency = frequency.Values.Max();
        int mostFrequentNumber = numbers.First(n => frequency[n] == maxFrequency);

        Console.WriteLine(maxFrequency);
        Console.WriteLine(mostFrequentNumber);
    }
}
**/