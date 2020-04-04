//
//  ArticleDetailsViewController.swift
//  NewsApp
//
//  Created by Вероника on 4/3/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleDescription: UITextView!
    @IBOutlet weak var articleDate: UILabel!
    
    var article: Article?
    var articles:[Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticles()
    }
    
    func loadArticles () {
        DataManager.shared.loadArticles { [weak self] articleItems in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.articles = articleItems
            }
        }
    }
}
