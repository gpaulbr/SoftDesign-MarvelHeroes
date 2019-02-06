//
//  HeroesListViewModel.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

protocol HeroesListViewModelUIDelegate: class {
    func heroesListViewModelDidUpdate(_ heroesListViewModel: HeroesListViewModel)
}

class HeroesListViewModel {
    private var heroes: [Hero] = []
    private var pageNumber = 1
    private var pageNumberMax = 20
    
    var apiClient: APIClient
    
    weak var UIDelegate: HeroesListViewModelUIDelegate?
    
    var title: String { return "Marvel Heroes" }
    
    var numberOfRows: Int {
        return heroes.count
    }
    
    init(_ apiClient: APIClient) {
        self.apiClient = apiClient
        getMoreHeroes()
    }
    
    func getMoreHeroes() {
        guard pageNumber <= pageNumberMax else { return }
//        APIManager.shared.getHeroes(pageNumber: pageNumber, completion: { (heroesQuerry) in
//            self.heroes.append(contentsOf: heroesQuerry)
////            self.UIDelegate?.movieListViewModelDidUpdate(self)
//        })
        apiClient.send(GetHeroes(limit: 20, offset: pageNumber * 20)) { response in
            switch response {
            case .success(let dataContainer):
                for hero in dataContainer.results {
                    self.heroes.append(hero)
                }
                
            case .failure(let error):
                print(error)
            }
            self.pageNumber += 1
            
            DispatchQueue.main.async {
                self.UIDelegate?.heroesListViewModelDidUpdate(self)
            }
        }
    }
    
    func hero(for indexPath: IndexPath) -> Hero {
        return heroes[indexPath.row]
    }
    
    func heroCellViewModel(for indexPath: IndexPath) -> HeroCellViewModel {
        let hero = heroes[indexPath.row]
        let viewModel = HeroCellViewModel.init(hero: hero)
        return viewModel
    }
}
