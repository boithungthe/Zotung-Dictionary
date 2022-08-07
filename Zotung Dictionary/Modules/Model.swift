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
    case decending, assending
}
func sorting(Array: [Vocabulary], sortBy: sort) -> [Vocabulary] {
    var stringArray = [Vocabulary]()
    switch sortBy {
    case .assending:
        stringArray.append(contentsOf: VOCABULARY.sorted(by: { rhs, lhs in
            rhs.word < lhs.word
        }))
        isDecended = true
    case .decending:
        stringArray.append(contentsOf: VOCABULARY.sorted(by: { rhs, lhs in
            rhs.word > lhs.word
        }))
        isDecended = false
    }
   return stringArray
}
