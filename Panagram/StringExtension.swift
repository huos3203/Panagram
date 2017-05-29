//
//  StringExtension.swift
//  Panagram
//
//  Created by pengyucheng on 16/6/15.
//  Copyright © 2016年 recomend. All rights reserved.
//

import Foundation

extension String{
    
    func isAnagramOfString(_ s:String) -> Bool {
        //1. Ignore capitalization and whitespace for both strings.
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = s.lowercased().replacingOccurrences(of: " ", with: "")
        
        //2. Check that both strings contain the same characters, and that all characters appear the same number of times.
        return lowerSelf.characters.sorted() == lowerOther.characters.sorted()
    }
    
    func isPalindrome() -> Bool {
        //1. Remove capitalization and whitespace.
        let f = self.lowercased().replacingOccurrences(of: " ", with: "")
        //2. Create a second string with the reversed characters.
        let s = String(f.characters.reversed())
        //3. If they are equal, it is a palindrome.
        return f == s
    }
}
