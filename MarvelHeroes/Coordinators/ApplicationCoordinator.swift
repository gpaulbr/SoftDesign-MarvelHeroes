
//  ApplicationCoordinator.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    public var childrenCoordinators: [Coordinator]
    private let window: UIWindow
    private let rootViewController: UINavigationController
    //model
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        self.childrenCoordinators = []
        
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        rootViewController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        rootViewController.navigationBar.shadowImage = UIImage()
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationBar.isTranslucent = true
        rootViewController.view.backgroundColor = .clear
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        showMovieList()
        UITextField.appearance().keyboardAppearance = .light
    }
    
    private func showMovieList() {
        let heroesListCoordinator = HeroesListCoordinator(presenter: rootViewController)
        addChild(coordinator: heroesListCoordinator)
        heroesListCoordinator.start()
    }
}
