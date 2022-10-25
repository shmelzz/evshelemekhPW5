//
//  ArticleViewController.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 25.10.2022.
//

import UIKit

final class ArticleViewController: UIViewController {
    
    private var imageView = UIImageView()
    private var titleLabel = UILabel()
    private var articleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        setupNavbar()
        setImageView()
        setTitleLabel()
        setArticleLabel()
    }
    
    private func setupNavbar() {
        navigationItem.title = "Article"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        navigationItem.leftBarButtonItem?.tintColor = .label
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setImageView() {
        
    }
    
    private func setTitleLabel() {
        
    }
    
    private func setArticleLabel() {
        
    }
}
