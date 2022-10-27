//
//  NewsInteractor.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 27.10.2022.
//

final class NewsInteractor: NewsBuisnessLogic {
    private let presenter: NewsPresentationLogic
    private let worker: NewsWorkerLogic

    init(
        presenter: NewsPresentationLogic,
        worker: NewsWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func loadNews(_ request: Model.GetNews.Request) {
        worker.getNews(request) { [weak self] result in
            self?.presenter.presentNews(Model.GetNews.Response(news: result))
        }
    }
}

