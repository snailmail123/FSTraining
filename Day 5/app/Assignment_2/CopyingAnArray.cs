/**
namespace CopyingAnArray
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] originalArray = new int[10];


            for (int i = 0; i < originalArray.Length; i++)
            {
                originalArray[i] = i + 1;
            }


            int[] copiedArray = new int[originalArray.Length];


            for (int i = 0; i < originalArray.Length; i++)
            {
                copiedArray[i] = originalArray[i];
            }


            Console.WriteLine("Original Array:");
            foreach (int item in originalArray)
            {
                Console.Write(item + " ");
            }

            Console.WriteLine("\nCopied Array:");
            foreach (int item in copiedArray)
            {
                Console.Write(item + " ");
            }
        }
    }
}

**/
