//
//  ViewController.swift
//  NewsApp
//
//  Created by Вероника on 4/3/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var articles:[Article] = []
    var selectedArticle: Article?
    let newsRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = newsRefreshControl
    
    }
    
    func loadArticles () {
        DataManager.shared.loadArticles { [weak self] (articles) in
            guard let self = self else {return}
            DispatchQueue.main.async { [weak self] in
                self?.articles = articles
                self?.tableView.reloadData()
            }
        }
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArticleDetails" {
            let vc = segue.destination as? ArticleDetailsViewController
            if let article = selectedArticle {
                vc?.article = article
            }
        }
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
   //     cell.update(with: articles[indexPath.row])
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
