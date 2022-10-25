//
//  NewsViewController.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 25.10.2022.
//

import UIKit

final class NewsViewController: UIViewController {
    private var tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
