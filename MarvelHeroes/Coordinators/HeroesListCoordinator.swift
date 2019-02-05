//
//  HeroesListCoordinator.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import UIKit

class HeroesListCoordinator: Coordinator {
    
    var childrenCoordinators: [Coordinator]
    
    private let presenter: UINavigationController
    private var heroesListViewController: HeroesListViewController?
    
    init (presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinators = []
    }
    
    func start() {
        let heroesListViewController = HeroesListViewController.instantiate()
        let heroesListViewModel = HeroesListViewModel()
        heroesListViewController.viewModel = heroesListViewModel
//        heroesListViewController.delegate = self
        
        self.heroesListViewController = heroesListViewController
        presenter.pushViewController(heroesListViewController, animated: false)
    }
}
