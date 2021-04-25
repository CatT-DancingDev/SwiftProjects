//===========================================================================================================//
// Name:            Catherine Trujillo
// Date:            09/08/2020
// Course:          CSC 246-800
//
// Description:     Read words from a given file. Assign each word a value (A = 1... Z = 26). Determine if
//                  that value is a triangle number as described in the formula t(N) = 1/2N(N+1). Output the
//                  number of triangle words in the document.
//
// ANSWER:          There are 1786 words in the file. 162 of them are Triangle words
//===========================================================================================================//
import UIKit

//===========================================================================================================//
// FUNCTION: readText(path: String) -> String
// PURPOSE:  returns a string of file contents if path is valid URL, else returns appropriate error message
//===========================================================================================================//
func readText(path: String) -> String {
// ++++ PROCESS ++++
    // If path is a valid URL, read contents from file
    if let url = URL(string: path) {
        do {
            let contents = try String(contentsOf: url)
            return(contents)
            } catch {
                return("error reading file") // Problems with file reading
            }
    } else {
        return("bad URL") // Problems with URL
    }
} // end readText(path: String) -> String

//===========================================================================================================//
// FUNCTION: wordValue(string: String) -> Int
// PURPOSE:  Converts a string to a postive integer value, returns value
//===========================================================================================================//
func wordValue(string: String) -> Int {
// ++++ VARIABLES/DATA ++++
    // Create letter value dictionary, specify usgae of Character type
    var letterValues = [Character: Int]()
    letterValues = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
    var value: Int = 0    // Stores value of word
// ++++ PROCESS ++++
    for letter in string {
        value += letterValues[letter]!
    }
    return value
} // end wordValue(string: String) -> Int

//===========================================================================================================//
// FUNCTION: main()
// PURPOSE:  Calculate the number of words from a given document that are "Triangle Words" as described in
//           Project Euler Problem #42
//===========================================================================================================//

func main(){
// ++++ VARIABLES/DATA ++++
    // Array to store Triangle Numbers
    var triangleNumbers = [Int]()
    for number in 1...1000{
        triangleNumbers.append(Int(0.5 * Double(number) * (Double(number) + 1.0)))
    }
    // Get wordList from file
    let url = "https://projecteuler.net/project/resources/p042_words.txt"   // URL for text file
    let contents = readText(path: url)                                      // String generated from file
    var cleanString = contents.replacingOccurrences(of: "\",\"", with: " ") // Remove separating characters
        cleanString = cleanString.replacingOccurrences(of: "\"", with: "")  // Remove first and last quotes
    let wordList = cleanString.components(separatedBy: " ")                 // Generate wordList
    
    // Stores number of Triangle Words
    var totalTriangleWords: Int = 0
   
// ++++ PROCESS ++++
    // Determine if words are triangle
    for word in wordList {
        let value = wordValue(string: word)     // Calculate word value
        if triangleNumbers.contains(value){     // If value in triangleNumbers
            totalTriangleWords += 1             // increment totalTriangleWords
        }
    }
// ++++ OUTPUT ++++
    print("There are \(totalTriangleWords) triangle words in this document. \nSource: \(url)")
}// end main()

main()
