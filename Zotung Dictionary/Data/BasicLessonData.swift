//
//  BasicLessonData.swift
//  Zotung Dictionary
//
//  Created by Boi The on 8/12/22.
//

import Foundation



let BASICLESSON = [mainTopic(topicEnglish: "Greeting", topicZotung: "Bya beih ku naw", detailArray: GREETING),
                 mainTopic(topicEnglish: "Daily Basic", topicZotung: "Nin takdyh bya ho ku naw", detailArray: DAILYBASIC),
                 mainTopic(topicEnglish: "Describing people", topicZotung: "Ccungccaw hae kung bya ho ku naw", detailArray: DESCRIBINGPEOPLE),
                 mainTopic(topicEnglish: "Most common phrases", topicZotung: "Mang lung hua paw bya ho naw", detailArray: MOSTCOMMONPRASES)
]

let DAILYBASIC = [
    Vocabulary(english: "How are you?", translation: "Na dang tou?", ztSpeech: "Na daaang taoou"),
    Vocabulary(english: "I am good, thank you. And you?", translation: "Ka dang, nang so?", ztSpeech: "ka daaang, naang sooooow"),
    Vocabulary(english: "Me too!", translation: "Kae mah.", ztSpeech: "Kaea maaa"),
    Vocabulary(english: "Bye", translation: "Mang hoy te.", ztSpeech: "Maang hoiy te-e"),
    Vocabulary(english: "What are you doing?", translation: "Paw mou na ci?", ztSpeech: "paw mou na cyi?"),
    Vocabulary(english: "What did you say?", translation: "Paw na ci mou?", ztSpeech: "Paaw na cyiii mou?!"),
    Vocabulary(english: "Where are you going?", translation: "Tou lan mou na ccia?", ztSpeech: "Tooulaang maoou na thiiyaaaaaar"),
    Vocabulary(english: "I am going to work", translation: "Rya hae lan nynh ka ccia", ztSpeech: "ryaa haae laang nynh kathiiyaaaaaar"),
    Vocabulary(english: "What do you do?", translation: "Paw rya mou na hae?", ztSpeech: "Paaw ryaaa moou na haae!")
    
]

let GREETING = [
    Vocabulary(english: "Hello!", translation: "Hello!", ztSpeech: "Helloooo"),
    Vocabulary(english: "Welcome!", translation: "Kae ccia due", ztSpeech: "Kaaee thieayaaw duuee"),
    Vocabulary(english: "My name is Brown.", translation: "Ka min tuh Brown ka cih ku" , ztSpeech: "Ka miin tuu, Baraoown kaaciiii kuu?"),
    Vocabulary(english: "Nice to meet you!", translation: "Atung kuh zah lungtua lan um!", ztSpeech: "atoong kuuzaa, lauung tuaa laang uoom?"),
]

let DESCRIBINGPEOPLE = [
    Vocabulary(english: "Who is Mr. Birdsell?", translation: "Mr. Birdsell tuh a hung mou?", ztSpeech: "Mi staa Bardseeell tu, ar haung moou")
    ]

let MOSTCOMMONPRASES = [
    Vocabulary(english: "Be careful driving.", translation: "Mawtaw khah rae-rin ku te mung.", ztSpeech: "maaw taaw khaaar, rae ring kuu tee moooong"),
    Vocabulary(english: "What is today's date?", translation: "Atu nin suapaw paw nin mou?", ztSpeech: "aar tuuniin suuaar paaaaw paaaw niinn moou"),
    Vocabulary(english: "It is the 8th.", translation: "Suapaw nin tarya nin", ztSpeech: "Suuar paaaw niin taryaaar niiing"),
    Vocabulary(english: "Do you have any plan for today?", translation: "Atu nin paw cyi lan cite mou na tua ku?", ztSpeech: "Atuuu ninnng paaw cyilang cyiteee moou, na tuuar kuu"),
    Vocabulary(english: "I am going to the market later today, you?", translation: "Atu lan sei lang nynh ka cceih cih, nang so?", ztSpeech: "artuuuu laaanng, seeii laang nynh ka teih ciii, naanng sooooow"),
    Vocabulary(english: "I have to take care of the baby.", translation: "Imua nynh ka ngaw cih.", ztSpeech: "Iimuuaaa nynnnh kangaaaaw ciy")
]

