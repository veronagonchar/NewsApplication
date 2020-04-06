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

    override class func primaryKey() -> String? {
        return "title"
    }
    
}
