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
    
    func loadArticles (completion: @escaping ([Article?]) -> Void) {
        let URLRequest =  "https://newsapi.org/v1/articles?source=the-verge&apiKey=5c05f157e6fe41bd8d27314546cd607c"
        guard let url = URL(string: URLRequest) else {return}
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let _ = self,
                let data = data,
                error == nil
                else {return}
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject],
                    let articlesFromJson = json["articles"] as? [[String:String]]
                    else {return}
                
                var articles: [Article?] = []
                articlesFromJson.forEach { [weak self] articleData in
                    articles.append(self?.getArticle(for: articleData))
                }
                completion(articles)
                print(articles)
                
            } catch {
                print(error) }
        }
        dataTask.resume()        
    }
    
    private func getArticle(for json: [String:String]) -> Article? {
        let author = json["author"]
        let title = json["title"]
        let artDescription = json["description"]
        let urlToArticle = json["url"]
        let imageURL = json["urlToImage"]
        let date = json["publishedAt"]
        return Article(author: author,
                       title: title,
                       artDescription: artDescription,
                       urlToArticle: urlToArticle,
                       imageURL: imageURL,
                       date: date)
    }
}
