//
//  DataManager.swift
//  NewsApp
//
//  Created by Вероника on 4/4/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    
    func fetchArticles (completion: @escaping ([Article]) -> Void) {
        
       let URLRequest =  "http://newsapi.org/v2/everything?q=apple&from=2020-04-03&to=2020-04-03&sortBy=popularity&apiKey=5c05f157e6fe41bd8d27314546cd607c"
        guard let url = URL(string: URLRequest) else {return}
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self,
            let data = data,
            error == nil
                else {return}
            self.articles = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]
               if let articlesFromJson = json?["articles"] as? [[String:AnyObject]] {
                    for articlcleFromJson in articlesFromJson {
                        let article = Article()
                        if let title = articlcleFromJson["title"] as? String,
                        let author = articlcleFromJson["author"] as? String,
                        let description = articlcleFromJson["description"] as? String,
                        let urlArticle = articlcleFromJson["url"] as? String,
                        let urlToImage = articlcleFromJson["urlToImage"] as? String,
                        let date = articlcleFromJson["publishedAt"] as? Date,
                            let content = articlcleFromJson["content"] as? String {
                            article.author = author
                            article.title = title
                            article.artDescription = description
                            article.urlToArticle = urlArticle
                            article.content = content
                            article.date = date
                            article.imageURL = urlToImage
                            
                        }
                        self.articles.append(article)
                    }
                }
                completion(self.articles)
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
        dataTask.resume()
    }
    
}
