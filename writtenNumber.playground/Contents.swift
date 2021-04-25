//===========================================================================================================//
// Name:            Catherine Trujillo
// Date:            09/09/2020
// Course:          CSC 246-800
//
// Description:     Print the number of letters in the numbers 1 - 1000 (inclusive). Do not count spaces or
//                  or hyphens. The three digit numbers will use the word "and" i.e. "One hundred and one."
//                  Create a class called "WrittenNumbers" to implement the solution.
//
// ANSWER:          There are 21124 letters in the numbers 1-1000.
//===========================================================================================================//
import UIKit
//===========================================================================================================//
// CLASS:           WrittenNumber
// PURPOSE:         This class contains the methods and data to count the number of letters in all numbers
//                  from 1 - 1000 (inclusive).
//
// DATA FIELDS:     var number: Int - Stores the current number to be analyzed
//                  var letterCounts- Stores the letter count for current number
//
// METHODS:         init() - Default Constructor
//                  func onesDigit(num: Int) -> Int
//                  func tensPlace(num: Int) -> Int
//                  func twoDigits(num: Int) -> Int
//                  func threeDigits(num: Int) -> Int
//                  func countLetters() -> Int
//===========================================================================================================//
class WrittenNumber {
//+++++++ DATA FIELDS AND CONSTRUCTORS +++++++//
    var number: Int = 0
    var letterCounts: Int = 0
    init(){}
//===========================================================================================================//
// FUNCTION:    onesDigit(num: Int) -> Int
// PURPOSE:     Returns the number of letters for numbers 1 - 9. If a different number is passed, it will
//              output an error message.
//===========================================================================================================//
    func onesDigit(num: Int) -> Int {
        var letterCount: Int = 0
        
        switch num{
        case 1, 2, 6:
            letterCount = 3
        case 4, 5, 9:
            letterCount = 4
        case 3, 7, 8:
            letterCount = 5
        default:
            print("Erroneous Input")
            letterCount = -1
        }
        return letterCount
    } // end onesDigit(num) -> Int
//===========================================================================================================//
// FUNCTION:    func tensPlace(num: Int) -> Int
// PURPOSE:     Returns the number of letters for numbers 10 - 19. If a different number is passed, it will
//              output an error message.
//===========================================================================================================//
    func tensPlace(num: Int) -> Int {
        var letterCount: Int = 0
        
        switch num{
        case 10:
            letterCount = 3
        case 11, 12:
            letterCount = 6
        case 13, 14, 18, 19:
            letterCount = 8
        case 15, 16:
            letterCount = 7
        case 17:
            letterCount = 9
        default:
            print("Erroneous Input")
            letterCount = -1
        }
        return letterCount
    } // end tensPlace(num) -> Int
//===========================================================================================================//
// FUNCTION:    func twoDigits(num: Int) -> Int
// PURPOSE:     Returns the number of letters for numbers 20 - 99. If a different number is passed, it will
//              output an error message.
//===========================================================================================================//
    func twoDigits(num: Int) -> Int{
        var letterCount: Int = 0
    
//++++++ PROCESS ++++++//
        // If number is evenly divisible by 10, return letter count for tens place only
        // else, pass the ones place to onesdigit(num: Int) -> Int and add to the tens place letter count
        if 20...39 ~= num || 80...99 ~= num {
            if num % 10 == 0{
                letterCount = 6
            } else {
                letterCount = onesDigit(num: num % 10) + 6
            }
        } else if num >= 40 && num < 70 {
            if num % 10 == 0{
                letterCount = 5
            } else {
                letterCount = onesDigit(num: num % 10) + 5
            }
        } else if 70...79 ~= num{
            if num % 10 == 0{
                letterCount = 7
            } else {
                letterCount = onesDigit(num: num % 10) + 7
            }
        } else {
            print("Erroneous Input")
            letterCount = -1
        }
        return letterCount
    } // end twoDigits(num) -> Int
//===========================================================================================================//
// FUNCTION:    func threeDigits(num: Int) -> Int
// PURPOSE:     Returns the number of letters for numbers 100 - 999. If a different number is passed, it will
//              output an error message.
//===========================================================================================================//
    func threeDigits(num: Int) -> Int{
        
        // Ensure number is three digit number
        guard 100...999 ~= num else{
            print("Erroneous input")
            return -1
        }
        var letterCount = 0
        let hundreds = num / 100            // Obtain digit for hundreds place
        let remainder = num % 100           // Remainder from above calculation
        
        // If number is evenly divisible by 100, find letter count for hundreds digit, then add to letter count for "hundred".
        // else get letter count for each digit using the remainder of division by 100
        if num % 100 == 0{
            letterCount = onesDigit(num: hundreds) + 7
        } else {
            letterCount = onesDigit(num: hundreds) + 10
            if remainder > 19{
            letterCount += twoDigits(num: remainder)
            }else if 10...19 ~= remainder{
                letterCount += tensPlace(num: remainder)
            }else{
                letterCount += onesDigit(num: remainder)
            }
        }
        return letterCount
    } //end threeDigits(num: Int) -> Int
//===========================================================================================================//
// FUNCTION:    func countLetters() -> Int
// PURPOSE:     Controls which function the number is passed to. Assigns letter count to class member
//              letterCounts. If the number is greater than 1000 or smaller than 1, an error message will be
//              displayed.
//===========================================================================================================//
    func countLetters() -> Int{
        var letterCount = 0
        
        guard self.number <= 1000 && self.number > 0 else {
            print("Number is greater than 1000, or smaller than 1. Erroneous Input.")
            return -1 }
        
        if self.number == 1000{
            letterCount += 11
        } else if 100...999 ~= self.number{
            letterCount = threeDigits(num: self.number)
        } else if 20...99 ~= self.number{
            letterCount = twoDigits(num: self.number)
        } else if 10...19 ~= self.number{
            letterCount = tensPlace(num: self.number)
        } else {
            letterCount = onesDigit(num: self.number)
        }
        self.letterCounts = letterCount
        return letterCount
    }
} // End WrittenNumber Class
//===========================================================================================================//
// FUNCTION:    main()
// PURPOSE:     Constructs an instance of WrittenNumber. Analyzes and print the letter count of numbers
//              1-1000 (Inclusive).
//===========================================================================================================//
func main() {
var totalLetters = 0
    
let numObj: WrittenNumber = WrittenNumber()

for i in 1...1000 {
     numObj.number = i
     numObj.countLetters()
     totalLetters += numObj.letterCounts
}
print("Total Letters: \(totalLetters)")
}// End main()

main()
