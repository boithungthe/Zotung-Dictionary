//
//  DataFile.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/6/22.
//

import Foundation
import UIKit

//zotung dictionary
let DICTIONARY = [
    Dictionary(word: "Human", grammar: "Noun", meaning: "Ccungccaw", pictureURL: ""),
    Dictionary(word: "Boy", grammar: "Noun", meaning: "pise, imohpaw, ccavae taraw", pictureURL: ""),
    Dictionary(word: "Girl", grammar: "Noun", meaning: "nopi, imohnung, lia-ccanung", pictureURL: ""),
]




//Zorung speaking lesson

let MAINTOPIC = [mainTopic(topicEnglish: "Greeting", topicZotung: "Bya beih ku naw", detailArray: GREETING),
                 mainTopic(topicEnglish: "Daily Basic", topicZotung: "Nin takdyh bya ho ku naw", detailArray: DAILYBASIC),
                 mainTopic(topicEnglish: "Describing people", topicZotung: "Ccungccaw hae kung bya ho ku naw", detailArray: DESCRIBINGPEOPLE),
]

let DAILYBASIC = [
    Vocabulary(english: "How are you?", translation: "Na dang tou?", ztSpeech: "Na dan toul"),
    Vocabulary(english: "I am good, thank you. And you?", translation: "Ka dang, nang so?", ztSpeech: "kadan!, non so!"),
    Vocabulary(english: "Me too!", translation: "Kae mah.", ztSpeech: "Ke mup!"),
    Vocabulary(english: "Bye", translation: "Mang hoy te.", ztSpeech: "Monhoi tae!"),
    Vocabulary(english: "What are you doing?", translation: "Paw mou na ci?", ztSpeech: "Pawmounaji!?"),
    Vocabulary(english: "What did you say?", translation: "Paw na ci mou?", ztSpeech: "Pawnaji mou!"),
    Vocabulary(english: "Where are you going?", translation: "Tou lan mou na ccia?", ztSpeech: "Toulamouna thia?"),
    Vocabulary(english: "I am going to work", translation: "Rya hae lan nynh ka ccia", ztSpeech: "rya hel lan nyh kathiaa"),
    Vocabulary(english: "What do you do?", translation: "Paw rya mou na hae?", ztSpeech: "Paw ryal mou na heh!")
    
]

let GREETING = [
    Vocabulary(english: "Hello!", translation: "Hello!", ztSpeech: "Hallo"),
    Vocabulary(english: "Welcome!", translation: "Kae ccia due", ztSpeech: "Ke thia dwe!"),
    Vocabulary(english: "Nice to meet you!", translation: "Atung kuh zah lungtua lan um!", ztSpeech: "a toungku zaah!, lawng twa lan om")
]

let DESCRIBINGPEOPLE = [
    Vocabulary(english: "Who is Mr. Birdsell?", translation: "Mr. Birdsell tuh a hung mou?", ztSpeech: "Mister Birdsell tuh a hum mou?")
    ]

