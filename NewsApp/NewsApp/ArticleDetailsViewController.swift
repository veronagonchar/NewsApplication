//
//  ArticleDetailsViewController.swift
//  NewsApp
//
//  Created by Вероника on 4/3/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleDescription: UITextView!
    @IBOutlet weak var articleDate: UILabel!
    
    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
