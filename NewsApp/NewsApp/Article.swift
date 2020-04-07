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
    var date: String?
    
    init?(author: String?, title: String?,
          artDescription: String?, urlToArticle: String?,
          imageURL: String?, date: String?) {
        self.title = title
        self.author = author
        self.artDescription = artDescription
        self.urlToArticle = urlToArticle
        self.imageURL = imageURL
        self.date = date
    }
}

