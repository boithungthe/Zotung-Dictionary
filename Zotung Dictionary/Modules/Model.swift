//
//  Model.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/7/22.
//

import Foundation
import UIKit

var isDecended = Bool()
enum sort {
    case decending, assending, original
}
func sortDictionary(Array: [Dictionary], sortBy: sort) -> [Dictionary] {
    var stringArray = [Dictionary]()
    switch sortBy {
    case .assending:
        stringArray.append(contentsOf: DICTIONARY.sorted(by: { rhs, lhs in
            rhs.word > lhs.word
        }))
        isDecended = true
    case .decending:
        stringArray.append(contentsOf: DICTIONARY.sorted(by: { rhs, lhs in
            rhs.word < lhs.word
        }))
        isDecended = false
    case .original:
        stringArray.append(contentsOf: DICTIONARY)
    }
   return stringArray
}
func savedFavChecker(string: String) -> String{
    let data = UserDefaults.standard.value(forKey: string) as? String
    return data ?? ""
}

public class Dictionary {
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

public class mainTopic {
    var topicEnglish = String()
    var topicZotung = String()
    var detailArray = [Vocabulary]()
    
    init(topicEnglish: String, topicZotung: String, detailArray: [Vocabulary]) {
        self.topicEnglish = topicEnglish
        self.topicZotung = topicZotung
        self.detailArray = detailArray
    }
}

//Vocabularies

func mainTopicChooser(Array:[mainTopic], sortBy: sort) -> [mainTopic] {
    var stringArray = [mainTopic]()
    switch sortBy {
    case .decending:
        stringArray.append(contentsOf: Array.sorted(by: { rhs, lhs in
            rhs.topicEnglish > lhs.topicEnglish
        }))
    case .assending:
        stringArray.append(contentsOf: Array.sorted(by: { rhs, lhs in
            rhs.topicEnglish < lhs.topicEnglish
        }))
    case .original:
        stringArray.append(contentsOf: Array)
    }
    return stringArray
}

func sortVocabulary(Array: [Vocabulary], sortBy: sort) -> [Vocabulary] {
    var stringArray = [Vocabulary]()
    switch sortBy {
    case .assending:
        stringArray.append(contentsOf: Array.sorted(by: { rhs, lhs in
            rhs.english > lhs.english
        }))
        isDecended = true
    case .decending:
        stringArray.append(contentsOf: Array.sorted(by: { rhs, lhs in
            rhs.english < lhs.english
        }))
        isDecended = false
    case .original:
        stringArray.append(contentsOf: Array)
    }
   return stringArray
}

public class Vocabulary {
    var english = String()
    var translation = String()
    var zotungSpeech = String()
    
        init(english: String,translation: String, ztSpeech: String) {
        self.english = english
        self.translation = translation
        self.zotungSpeech = ztSpeech
    }
}

public func selectChoice(classArray: [Vocabulary], StringArray: [String], StringCopy: String) -> [String] {
    var arr = [String]()
    for voca in sortVocabulary(Array: classArray, sortBy: .decending) {
        arr.append(voca.translation)
    }
    return arr
}
