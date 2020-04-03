//
//  ViewController.swift
//  NewsApp
//
//  Created by Вероника on 4/3/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var articles:[Article] = []
    var selectedArticle: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArticleDetails" {
            let viewController = segue.destination as? ArticleDetailsViewController
            if let article = selectedArticle {
                viewController?.article = article
            }
        }
    }
    
    func fetchArticles (completion: @escaping ([Article]) -> Void) {
        
       let URLRequest =  "https://newsapi.org/v2/everything?q=bitcoin&apiKey=5c05f157e6fe41bd8d27314546cd607c"
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "articleCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ArticleCell else { return UITableViewCell()}
        cell.articleTitle.text = "Hello"
        cell.articleDate.text = "Good day"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        selectedArticle = article
        performSegue(withIdentifier: "ArticleDetails", sender: nil)
    }
}
