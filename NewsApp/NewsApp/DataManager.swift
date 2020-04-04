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
    
    
    func loadArticles (completion: @escaping ([Article]) -> Void) {
        
       let URLRequest =  "http://newsapi.org/v2/everything?q=apple&from=2020-04-03&to=2020-04-03&sortBy=popularity&apiKey=5c05f157e6fe41bd8d27314546cd607c"
        guard let url = URL(string: URLRequest) else {return}
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let _ = self,
            let data = data,
            error == nil
                else {return}
            do {
               guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject],
                let articlesFromJson = json["articles"] as? [[String:AnyObject]]
                else {return}
                
                var articles: [Article] = []
                articlesFromJson.forEach { articleData in
                    if let articleItem = Article(data: articleData) {
                        articles.append(articleItem)}
                }
                completion(articles)
                    print(articles)
                
            } catch {
                print(error) }
        }
        dataTask.resume()
        
    }
}
