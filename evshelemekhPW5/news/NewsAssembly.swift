//
//  NewsAssembly.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 27.10.2022.
//

import UIKit

enum NewsAssembly {
    static func build() -> UIViewController {
        let presenter = NewsPresenter()
        let worker = NewsWorker()
        let interactor = NewsInteractor(presenter: presenter, worker: worker)
        let vc = NewsListViewController(interactor: interactor)

        presenter.viewController = vc

        return vc
    }
}
