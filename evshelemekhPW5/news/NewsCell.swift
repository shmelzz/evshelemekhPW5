//
//  NewsCell.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 25.10.2022.
//

import UIKit

final class NewsCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsCell"
    
    private let newsImageView = UIImageView()
    private let newsTitleLabel = UILabel()
    private let newsArticleLabel = UILabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Setup Views
    private func setupView() {
        setupImageView()
        setupTitleLabel()
        setupArticleLabel()
    }
    
    private func setupImageView() {
       
    }
    
    private func setupTitleLabel() {
       
    }
    
    private func setupArticleLabel() {
       
    }
}
