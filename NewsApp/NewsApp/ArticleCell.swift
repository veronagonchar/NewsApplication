//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Вероника on 4/3/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    
    var article: Article?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func update(with article: Article) {
        self.article = article
        articleTitle.text = article.title
        articleDate.text = article.date
    }
    
//    func didStartActivitiIndicatorLoading() {
//        activityIndicator?.startAnimating()
//    }
//
//    func didFinishActivitiIndicatorLoading() {
//        activityIndicator.stopAnimating()
//        activityIndicator.isHidden = true
//    }
}
