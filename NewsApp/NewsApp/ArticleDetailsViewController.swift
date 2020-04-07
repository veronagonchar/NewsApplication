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
    
    //MARK: - Outlets
    
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var urlToArticle: UITextView!
    
    //MARK: - Variable
    
    var article: Article?
    
    //MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNews()
        setUpImage()
        updateTextView()
    }
    
    //MARK: - Methods
    
    private func updateTextView() {
        
        let path = article?.urlToArticle ?? ""
        let text = urlToArticle.text ?? ""
        let attributedString = NSAttributedString.makeHyperLink(for: path, in: text, as: "here")
        let font = urlToArticle.font
        urlToArticle.attributedText = attributedString
        urlToArticle.font = font
    }
    
    private func setUpNews() {
        articleTitle.text = article?.title
        articleDescription.text = article?.artDescription
        articleDate.text = article?.date
        
    }
    
    private func setUpImage() {
        let url = URL(string: article?.imageURL ?? "")
        articleImage.kf.setImage(with: url)
    }
}

//MARK: - Extension NSAttributedString

extension NSAttributedString {
    
    static func makeHyperLink(for path: String, in string: String, as substring: String) -> NSAttributedString {
        
        let nsString = NSString(string: string)
        let subStringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: subStringRange)
        return attributedString
    }
}
