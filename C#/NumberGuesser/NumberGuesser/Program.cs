using System;


namespace NumberGuesser
{
    class Program
    {
        static void Main(string[] args)
        {
            GetAppInfo(); // Run GetAppInfo Function

            GreetUser();
            while (true)
            {
                // Set correct number

                Random random = new Random();
                int correctNumber = random.Next(1, 10);

                // Guess variable
                int guess = 0;

                // Ask user for number
                Console.WriteLine("Guess a number from 1-10");
                while (guess != correctNumber)
                {
                    // Get users input
                    string guessInput = Console.ReadLine();

                    // Check that input is number
                    if (!int.TryParse(guessInput, out guess))
                    // Tell user that is not a number
                    {
                        PrintColorMessage(ConsoleColor.Red, "That is not a valid input.");
                        continue;
                    }

                    // Change to int and replace guess
                    guess = Int32.Parse(guessInput);

                    // Match guess
                    if (guess != correctNumber)
                    {
                        PrintColorMessage(ConsoleColor.Red, "Incorrect.");
                    }
                    if (guess == correctNumber)
                    {
                        PrintColorMessage(ConsoleColor.Green, "Correct!");
                    }
                }
                Console.WriteLine("Would you like to play again? [Y/N]");

                string answer = Console.ReadLine().ToUpper();

                if(answer == "Y")
                {
                    continue;
                }
                else if (answer == "N")
                {
                    return;
                }
                

            }
          
        }

        static void GetAppInfo()
        {
            string appName = "Number Guesser";
            string appVersion = "1.0.0";
            string appAuthor = "Ryan Du Plooy";

            // Font color cyan
            Console.ForegroundColor = ConsoleColor.Cyan;

            // Write app info
            Console.WriteLine("{0} \nVersion {1} \nCreated by {2}\n", appName, appVersion, appAuthor);

            // Reset color
            Console.ResetColor();
        }

        static void GreetUser()
        {
            // Ask name
            Console.WriteLine("What is your name?");

            // Take & print name
            string input = Console.ReadLine();
            Console.WriteLine("Hello {0}, let's play a game...", input);
        }

        static void PrintColorMessage(ConsoleColor color, string message)
        {
            Console.ForegroundColor = color;

            Console.WriteLine(message);

            Console.ResetColor();
        }
        
    }
}
