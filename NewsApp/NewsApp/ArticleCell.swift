//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Вероника on 4/3/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    
    //MARK: - Variables
    
    var article: Article?
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    //MARK: - Methods
    
    func update(with article: Article) {
        self.article = article
        articleTitle.text = article.title
        articleDate.text = article.date
    }
    
}
