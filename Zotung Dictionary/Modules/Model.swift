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
    case descending, ascending, original
}
func sortDictionary(Array: [Dictionary], sortBy: sort) -> [Dictionary] {
    var stringArray = [Dictionary]()
    switch sortBy {
    case .ascending:
        stringArray.append(contentsOf: DICTIONARY.sorted(by: { rhs, lhs in
            rhs.word > lhs.word
        }))
        isDecended = true
    case .descending:
        stringArray.append(contentsOf: DICTIONARY.sorted(by: { rhs, lhs in
            rhs.word < lhs.word
        }))
        isDecended = false
    case .original:
        stringArray.append(contentsOf: DICTIONARY)
    }
   return stringArray
}
func userDefaultsGetter(string: String) -> String{
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
public class menuTopic {
    var topicTitle = String()
    var mainTopicArray = [mainTopic]()
    
    init(topicTitle: String, mainTopicArray: [mainTopic]) {
        self.topicTitle = topicTitle
        self.mainTopicArray = mainTopicArray
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

func userDefaultsSave(value: Any, forKey: String) {
    UserDefaults.standard.setValue(value, forKey: forKey)
}

func mainTopicChooser(sortBy: sort, title: String) -> [mainTopic] {
    var stringArray = [mainTopic]()
    
    for i in TOPICMENUTITLE {
        if title == i.topicTitle || title == "Favorite List" {
            stringArray = i.mainTopicArray
            break
        }
    }
    switch sortBy {
    case .descending:
        userDefaultsSave(value: "Descending", forKey: "sortMainTopicKey")
        stringArray = stringArray.sorted(by: { rhs, lhs in
            rhs.topicEnglish > lhs.topicEnglish
        })
    case .ascending:
        userDefaultsSave(value: "Ascending", forKey: "sortMainTopicKey")
        stringArray = stringArray.sorted(by: { rhs, lhs in
            rhs.topicEnglish < lhs.topicEnglish
        })
    case .original:
        userDefaultsSave(value: "Original", forKey: "sortMainTopicKey")
    }
    return stringArray
}

func sortVocabulary(Array: [Vocabulary], sortBy: sort) -> [Vocabulary] {
    var stringArray = [Vocabulary]()
    switch sortBy {
    case .ascending:
        stringArray.append(contentsOf: Array.sorted(by: { rhs, lhs in
            rhs.english > lhs.english
        }))
        isDecended = true
    case .descending:
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
    for voca in sortVocabulary(Array: classArray, sortBy: .descending) {
        arr.append(voca.translation)
    }
    return arr
}



public func confirmationAlert(title: String, message: String, view: UIViewController, timer: Double) {
    let when = DispatchTime.now() + timer
    let confirmation = UIAlertController(title: title, message: message, preferredStyle: .alert)
    view.present(confirmation, animated: true)
    
    DispatchQueue.main.asyncAfter(deadline: when) {
        confirmation.dismiss(animated: true)
    }
}
