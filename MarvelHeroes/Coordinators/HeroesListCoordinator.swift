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
    private let apiClient = APIClient(publicKey: "e81a62777a0b00f8e8b85887fd58d16a", privateKey: "3f1235b807e85e11e9f8a5043440d4753ce037ec")
    
    init (presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinators = []
    }
    
    func start() {
        let heroesListViewController = HeroesListViewController.instantiate()
        let heroesListViewModel = HeroesListViewModel(self.apiClient)
        heroesListViewController.viewModel = heroesListViewModel
//        heroesListViewController.delegate = self
        
        self.heroesListViewController = heroesListViewController
        presenter.pushViewController(heroesListViewController, animated: false)
    }
}
