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
    
    public func configure(with viewModel: NewsModel) {
        titleLabel.text = viewModel.title
        articleLabel.text = viewModel.description
        
        if let data = viewModel.imageData {
            imageView.image = UIImage(data: data)
        } else if let url = viewModel.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
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
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        imageView.pin(to: view, [.left: 0, .right: 0])
        imageView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        imageView.pinHeight(to: imageView.widthAnchor, 1)
    }
    
    private func setTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .label
        view.addSubview(titleLabel)
        titleLabel.pinTop(to: imageView.bottomAnchor, 12)
        titleLabel.pin(to: view, [.left: 16, .right: 16])
        titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    }
    
    private func setArticleLabel() {
        articleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        articleLabel.numberOfLines = 0
        articleLabel.textColor = .secondaryLabel
        view.addSubview(articleLabel)
        articleLabel.pin(to: view, [.left: 16, .right: 16])
        articleLabel.pinTop(to: titleLabel.bottomAnchor, 8)
    }
}
