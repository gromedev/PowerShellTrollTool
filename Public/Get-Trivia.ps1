function Get-Trivia 
{
#.AUTHOR https://gist.github.com/VV-B0Y
    param (
        [Parameter(Mandatory)]
        [ValidateSet("easy", "medium", "hard")]
        [String]
        $Difficulty,

        [Parameter(Mandatory)]
        [Int]
        $Amount
    )

    # Lets create an array to store the questions & answers in
    $Questions = @()

    # This is a HashTable to store categories and their corresponding number codes assigned by the API
    $Topics = @{
        General_Knowledge    = 9
        Books                = 10
        Film                 = 11
        Music                = 12
        Musicals_Theatres    = 13
        Television           = 14
        VideoGames           = 15
        BoardGames           = 16
        Science_Nature       = 17
        Science_Computers    = 18
        Science_Mathematics  = 19
        Mythology            = 20
        Sports               = 21
        Geography            = 22
        History              = 23
        Politics             = 24
        Art                  = 25
        Celebrities          = 26
        Animals              = 27
        Vehicles             = 28
        Comics               = 29
        Science_Gadgets      = 30
        Japanese_Anime_Manga = 31
        Cartoon_Animations   = 32
    }

    # loop through each topic and collect specified amount of questions & answers
    foreach ($Topic in $Topics.values) {
        $TriviaSplat = @{
            Uri    = 'https://opentdb.com/api.php?amount={0}&category={1}&difficulty={2}' -f $Amount, $Topic, $Difficulty.ToLower()
            Method = 'Get'
        }
        $TriviaResponse = Invoke-RestMethod @TriviaSplat

        # Now loop through each question and format / add them to the $Questions array we created earlier
        foreach ($item in $TriviaResponse.results) {
            $Question = [PSCustomObject]@{
                Category    = $item.Category
                Difficulty  = $item.Difficulty
                Question    = $item.Question
                Answer      = $item.Correct_Answer
                WrongAnswer = $item.Incorrect_answers
            }
            $Questions += $Question
        }
    }
    $Questions
}