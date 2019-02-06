//
//  HeroDetailsCoordinator.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 06/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import UIKit

class HeroDetailsCoordinator: Coordinator {
    
    fileprivate let presenter: UINavigationController
    var childrenCoordinators: [Coordinator]
    
    fileprivate let hero: Hero
    fileprivate var heroDetailsViewController: HeroDetailsViewController?
    
    init(presenter: UINavigationController, hero: Hero) {
        self.presenter = presenter
        self.hero = hero
        self.childrenCoordinators = []
    }
    
    func start() {
        let heroDetailsViewController = HeroDetailsViewController.instantiate()
        let heroDetailsViewModel = HeroDetailsViewModel(hero)
        heroDetailsViewController.viewModel = heroDetailsViewModel
        
        self.heroDetailsViewController = heroDetailsViewController
        presenter.pushViewController(heroDetailsViewController, animated: true)
    }
}
