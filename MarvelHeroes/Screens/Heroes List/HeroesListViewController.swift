//
//  HeroesListViewController.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import UIKit

protocol HeroesListDelegate: class {
    func heroesList(_ heroesListViewController: HeroesListViewController, didClick hero: Hero)
}

class HeroesListViewController: UIViewController {
    
    @IBOutlet weak var heroesTableView: UITableView!
    
    var viewModel: HeroesListViewModel!
    weak var delegate: HeroesListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.UIDelegate = self
        
        heroesTableView.delegate = self
        heroesTableView.dataSource = self
        heroesTableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: HeroTableViewCell.identifier)
        
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
        
        let heroCellViewModel = self.viewModel.heroCellViewModel(for: indexPath)
        
        cell.configure(with: heroCellViewModel)
        return cell
    }
}

extension HeroesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.heroesList(self, didClick: viewModel.hero(for: indexPath))
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row + 1) == tableView.numberOfRows(inSection: 0) {
            viewModel.getMoreHeroes()
        }
    }
}

extension HeroesListViewController: HeroesListViewModelUIDelegate {
    func heroesListViewModelDidUpdate(_ heroesListViewModel: HeroesListViewModel) {
        heroesTableView.reloadData()
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
