/**

using System.Text.RegularExpressions;
using System.Text;

namespace SentenceReverser;
class Program
{
    static void Main()
    {
        string input = "The quick brown fox jumps over the lazy dog /Yes! Really!!!/.";
        string reversedSentence = ReverseWordsInSentence(input);

        Console.WriteLine("Original Sentence:");
        Console.WriteLine(input);
        Console.WriteLine("Reversed Words Sentence:");
        Console.WriteLine(reversedSentence);
    }

    static string ReverseWordsInSentence(string sentence)
    {
        
        string pattern = @"([.,:;=()&[\]""'\\/!? ]+)";
        string[] words = Regex.Split(sentence, pattern);
        string[] filteredWords = Regex.Split(sentence, pattern);
        Array.Reverse(filteredWords);

        int wordIndex = 0;
        StringBuilder result = new StringBuilder();

        foreach (string part in words)
        {
            if (Regex.IsMatch(part, @"[.,:;=()&[\]""'\\/!? ]+"))
            {
                result.Append(part);
            }
            else if (!string.IsNullOrEmpty(part))
            {
                result.Append(filteredWords[wordIndex++]);
            }
        }

        return result.ToString();
    }
}


**/