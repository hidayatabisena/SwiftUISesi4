//
//  Article.swift
//  SwiftUISesi4
//
//  Created by Hidayat Abisena on 29/11/22.
//

import Foundation

struct Article: Identifiable {
    var id: UUID = UUID()
    var title: String
    var imageURL: String
    var isFavorite: Bool
}

let dummyArticles = [
    Article(title: "Donate to House of Peradaban", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669546621/iSwift/sesi4/charity1_qnnrci.jpg", isFavorite: false),
    
    Article(title: "Donate to House of Humanity", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548108/iSwift/sesi4/charity2_mbnc3n.jpg", isFavorite: false),
    
    Article(title: "Charity for Social", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548590/iSwift/sesi4/charity3_aojsh9.jpg", isFavorite: false),
    
    Article(title: "Let be their facility", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548516/iSwift/sesi4/charity4_nruipt.jpg", isFavorite: false),
    
    Article(title: "Amount of happiness thet get", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548515/iSwift/sesi4/charity5_rmmquk.jpg", isFavorite: false),
    
    Article(title: "Sharing happiness with others", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548516/iSwift/sesi4/charity6_tj3wra.jpg", isFavorite: false),
    
    Article(title: "Delivering happiness for poor people in the world", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548517/iSwift/sesi4/charity7_ffaegu.jpg", isFavorite: false),
    
    Article(title: "One of all", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548516/iSwift/sesi4/charity8_alnrle.jpg", isFavorite: false),
    
    Article(title: "Nothing else matters", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548517/iSwift/sesi4/charity9_lv6myz.jpg", isFavorite: false),
    
    Article(title: "We believe in humanity", imageURL: "https://res.cloudinary.com/moyadev/image/upload/v1669548517/iSwift/sesi4/charity10_fqbpkk.jpg", isFavorite: false)
]
