//
//  Article.swift
//  NewsApp
//
//  Created by Вероника on 4/3/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import UIKit

class Article {
    
    var author: String?
    var title: String?
    var artDescription: String?
    var urlToArticle: String?
    var imageURL: String?
    var date: Date?
    var content: String?
    
    init? (data:[AnyHashable: Any]) {
        guard
        let title = data["title"] as? String,
        let author = data["author"] as? String,
        let description = data["description"] as? String,
        let urlArticle = data["url"] as? String,
        let urlToImage = data["urlToImage"] as? String,
        let date = data["publishedAt"] as? Date,
        let content = data["content"] as? String
        
            else {return nil}
        
        self.title = title
        self.author = author
        self.artDescription = description
        self.urlToArticle = urlArticle
        self.imageURL = urlToImage
        self.date = date
        self.content = content
        
    }
}



//class NewsSource: Codable {
//let status: String?
//let totalResults: Int?
//struct Article: Codable {
//    let source: Source
//    let author: String?
//    let title: String?
//    let description: String?
//    let url: URL?
//    let urlToImage: URL?
//    let publishedAt: Date
//
//    struct Source: Codable {
//        let id: String?
//        let name: String?
//        }
//    }
//}
