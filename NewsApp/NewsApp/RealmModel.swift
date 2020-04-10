//
//  RealmModel.swift
//  NewsApp
//
//  Created by Вероника on 4/6/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ArticleRealmModel: Object {
    
    @objc dynamic var author = ""
    @objc dynamic var title = ""
    @objc dynamic var artDescription = ""
    @objc dynamic var urlToArticle = ""
    @objc dynamic var imageURL = ""
    @objc dynamic var date = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
 
  // Helper to convert ArticleModel to ArticleRealmModel
    
    class func toArticleRealmModel(article: Article) -> ArticleRealmModel {
        let item = ArticleRealmModel()
        item.title = article.title ?? ""
        
        if let artDescription = article.artDescription,
            let author = article.author,
            let urlToArticle = article.urlToArticle,
            let imageURL = article.imageURL,
            let date = article.date
        {
            item.artDescription = artDescription
            item.author = author
            item.urlToArticle = urlToArticle
            item.imageURL = imageURL
            item.date = date
        }
        
        return item
    }
    
}
