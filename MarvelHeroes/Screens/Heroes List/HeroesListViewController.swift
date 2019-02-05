//
//  HeroesListViewController.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    @IBOutlet weak var heroesTableView: UITableView!
    
    var viewModel: HeroesListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroesTableView.delegate = self
        heroesTableView.dataSource = self
        
        self.navigationItem.title = viewModel.title
    }

}

extension HeroesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(
                withIdentifier: HeroTableViewCell.identifier,
                for: indexPath) as? HeroTableViewCell else {
                    return UITableViewCell()
        }
        
        let heroCellViewModel = self.viewModel.heroesListTableViewModel(for: indexPath)
        
        cell.configure(with: movieCellViewModel)
        return cell
    }
}

extension HeroesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        delegate?.heroesList(self, didClick: viewModel.hero(for: indexPath))
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row + 1) == tableView.numberOfRows(inSection: 0) {
            viewModel.getMoreHeroes()
        }
    }
}

extension HeroesListViewController: StoryboardInstantiable {
    static var viewControllerID: String {
        return "HeroesListViewController"
    }
    
    static var storyboardIdentifier: String {
        return "HeroesList"
    }
}
