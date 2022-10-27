//
//  NewsViewController.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 25.10.2022.
//

import UIKit

final class NewsListViewController: UIViewController,
                                    NewsDisplayLogic {
    
    private let interactor: NewsBuisnessLogic
    private let decoder: JSONDecoder = JSONDecoder()
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private var isLoading = false
    private var news: Model.News = Model.News (status: "", totalResults: 0, articles: [] )
    
    // MARK: - Lifecycle
    init(interactor: NewsBuisnessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setupUI()
        interactor.loadNews(Model.GetNews.Request())
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
    
    private func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func displayNews(_ viewModel: Model.GetNews.ViewModel) {
        news = viewModel.news
        reloadData()
    }
}



extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        if isLoading {
        //
        //        } else {
        //            let viewModel = news.news?[indexPath.row]
        //            if let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath) as? NewsCell {
        //                newsCell.configure(article: viewModel)
        //                return newsCell
        //            }
        //        }
        //        return UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell
        cell?.newsTitleLabel.text = news.articles?[indexPath.row].title ?? ""
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoading {
            return 0
        } else {
            return news.articles?.count ?? 0
        }
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isLoading {
            let articleViewController = ArticleViewController()
            articleViewController.configure(with: news.articles?[indexPath.row])
            navigationController?.pushViewController(articleViewController, animated: true)
        }
    }
}
