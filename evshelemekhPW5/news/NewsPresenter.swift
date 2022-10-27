//
//  NewsPresenter.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 27.10.2022.
//

final class NewsPresenter: NewsPresentationLogic {
    weak var viewController:NewsDisplayLogic?

    // MARK: - NewsPresentationLogic
    func presentNews(_ response: Model.GetNews.Response) {
        viewController?.displayNews(Model.GetNews.ViewModel(news: response.news))
    }
}

