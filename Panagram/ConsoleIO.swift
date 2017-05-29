//
//  ConsoleIO.swift
//  Panagram
//
//  Created by pengyucheng on 16/6/15.
//  Copyright © 2016年 recomend. All rights reserved.
//

import Foundation

//This defines the output method to use when writing messages
enum OutputType {
    case error
    case standard
}

//Panagram has three options: -p to detect palindromes, -a for anagrams and -h to show the usage information.
enum OptionType:String {
    case Palindrome = "p"
    case Anagram = "a"
    case Help = "h"
    case Quit = "q"
    case Unknown
    
    init(value:String){
        switch value {
        case "a":
            self = .Anagram
        case "p":
            self = .Palindrome
        case "h":
            self = .Help
        case "q":
            self = .Quit
            
        default:
            self = .Unknown
        }
    }
}

class ConsoleIO{
    
    //prints usage information to the console
    class func printUsage(){
        //Process is a small wrapper around the argc and argv arguments you may know from C-like languages
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        print("usage:")
        print("\(executableName) -a string1 string2")
        print("or")
        print("\(executableName) -p string")
        print("or")
        print("\(executableName) -h to show usage information")
        print("Type \(executableName) without an option to enter interactive mode.")
    }
    
    //accepts a String as its argument and returns a tuple of OptionType and String.
    func getOption(_ option:String) -> (option:OptionType,value:String) {
        //
        return (OptionType(value:option),option)
    }

    //This function has two parameters; the first is the actual message to print, and the second is where to write it. This defaults to .Standard.
    func writeMessage(_ message:String,to:OutputType = .standard) {
        switch to {
        case .standard:
            print("\u{001B}[;m\(message)]")
        case .error:
            fputs("\u{001B}[0;31m\(message)\n]", stderr)
        }
    }
    
    
    func getInput() -> String {
        //1. First, grab a handle to stdin.
        let keyboard = FileHandle.standardInput
        //2. read any data on the stream.
        let inputData = keyboard.availableData
        //3. Convert the data to a string.
        let strData = NSString(data: inputData,encoding: String.Encoding.utf8.rawValue)!
        //4. remove any newline characters and return the string.
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
