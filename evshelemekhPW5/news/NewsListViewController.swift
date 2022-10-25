//
//  NewsViewController.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 25.10.2022.
//

import UIKit

final class NewsListViewController: UIViewController {
    private var tableView = UITableView(frame: .zero, style: .plain)
    private var isLoading = false
    private var newsModels: [NewsModel] = [
        NewsModel(title: "String", description: "String", imageURL: URL(string: "https://picsum.photos/seed/picsum/500")),
        NewsModel(title: "String", description: "String", imageURL: URL(string: "https://picsum.photos/seed/picsum/500")),
        NewsModel(title: "String", description: "String", imageURL: URL(string: "https://picsum.photos/seed/picsum/500")),
        NewsModel(title: "String", description: "String", imageURL: URL(string: "https://picsum.photos/seed/picsum/500")),
        NewsModel(title: "String", description: "String", imageURL: URL(string: "https://picsum.photos/seed/picsum/500")),
        NewsModel(title: "String", description: "String", imageURL: URL(string: "https://picsum.photos/seed/picsum/500"))
    ]
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    private func configureTableView() {
        setTableViewUI()
        setTableViewDelegate()
        setTableViewCell()
        setupNavBar()
    }
    
    private func setTableViewUI() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 120
        tableView.pinLeft(to: view)
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        tableView.pinRight(to: view)
        tableView.pinBottom(to: view)
    }
    
    private func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setTableViewCell() {
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseIdentifier)
        
    }
    
    private func setupNavBar() {
        navigationItem.title = "News"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func fetchNews() {
        
    }
}



extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoading {
            
        } else {
            let viewModel = newsModels[indexPath.row]
            if let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath) as? NewsCell {
                newsCell.configure(article: viewModel)
                return newsCell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoading {
            return 0
        } else {
            return newsModels.count
        }
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isLoading {
            let articleViewController = ArticleViewController()
            articleViewController.configure(with: newsModels[indexPath.row])
            navigationController?.pushViewController(articleViewController, animated: true)
        }
    }
}
