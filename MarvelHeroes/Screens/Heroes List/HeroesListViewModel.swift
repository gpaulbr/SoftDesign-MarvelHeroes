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
    
    weak var UIDelegate: HeroesListViewModelUIDelegate?
    
    var numberOfRows: Int {
        return heroes.count
    }
    
    init() {
        getMoreHeroes()
    }
    
    func getMoreHeroes() {
        guard pageNumber <= pageNumberMax else { return }
        APIManager.shared.getHeroes(pageNumber: pageNumber, completion: { (heroesQuerry) in
            self.heroes.append(contentsOf: heroesQuerry)
            self.UIDelegate?.movieListViewModelDidUpdate(self)
        })
        pageNumber += 1
    }
    
    func hero(for indexPath: IndexPath) -> Hero {
        return heroes[indexPath.row]
    }
    
    func movieCellViewModel(for indexPath: IndexPath) -> HeroCellViewModel {
        let hero = heroes[indexPath.row]
        let viewModel = HeroCellViewModel.init(hero: hero)
        return viewModel
    }
}
