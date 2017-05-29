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

//Panagram有三个选项：-p检测回文，-a 组词和 -h显示使用信息。
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
    
    //在控制台上输出使用信息
    class func printUsage(){
        
        //CommandLine是工具包中的两个参数argc和argv参数
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        print("usage:")
        print("\(executableName) -a string1 string2")
        print("or")
        print("\(executableName) -p string")
        print("or")
        print("\(executableName) -h to show usage information")
        print("Type \(executableName) without an option to enter interactive mode.")
    }
    
    //接受一个字符串作为参数并返回一个元组的OptionType和字符串。
    func getOption(_ option:String) -> (option:OptionType,value:String) {
        //
        return (OptionType(value:option),option)
    }

    //这个函数有两个参数：第一个是打印的实际消息，第二个是在OutputType。默认为.standard。
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
        //3. data转字符串.
        let strData = NSString(data: inputData,encoding: String.Encoding.utf8.rawValue)!
        //4. 删除任何换行符和返回字符串。
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
