//
//  Coordinator.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childrenCoordinators: [Coordinator] { get set }
    func start()
    func addChild(coordinator: Coordinator)
    func releaseChild(coordinator: Coordinator)
}

protocol CoordinatorDelegate: class {
    func shouldDeinitCoordinator(_ coordinator: Coordinator)
}

extension Coordinator {
    
    func addChild(coordinator: Coordinator) {
        childrenCoordinators.append(coordinator)
    }
    
    func releaseChild(coordinator: Coordinator) {
        childrenCoordinators.removeAll()
    }
}
