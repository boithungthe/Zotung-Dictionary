//
//  DataFile.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/6/22.
//

import Foundation
import UIKit

public class Vocabulary {
    var word = String()
    var grammar = String()
    var meaning = String()
    var pictureURL = String()
    
    init(word: String, grammar: String, meaning: String, pictureURL: String) {
        self.word = word
        self.grammar = grammar
        self.meaning = meaning
        self.pictureURL = pictureURL
    }
}

let VOCABULARY = [
    Vocabulary(word: "Human", grammar: "Noun", meaning: """
                CcungccawCcungccawCcungccawCcungccawCcungccawCcu
                ngccawCcungccawCcungccawCcungccawCcungccawCcungccaw
                Ccungccaw CcungccawCcungccawCcungccaw Ccungccaw Ccungccaw
                Ccungccaw Ccungccaw Ccungccaw
                """, pictureURL: ""),
    Vocabulary(word: "Boy", grammar: "Noun", meaning: "pise, imohpaw, ccavae taraw", pictureURL: ""),
    Vocabulary(word: "Girl", grammar: "Noun", meaning: "nopi, imohnung, lia-ccanung", pictureURL: ""),
]


