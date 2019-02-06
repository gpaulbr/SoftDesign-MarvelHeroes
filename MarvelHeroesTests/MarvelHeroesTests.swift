//
//  MarvelHeroesTests.swift
//  MarvelHeroesTests
//
//  Created by Gabriel Paul on 04/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class MarvelHeroesTests: XCTestCase {
    
    var hero: Hero!
    var apiClient: APIClient!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let url = URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b.jpg")
        
        let comics = [Comic(name: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1"),
                      Comic(name: "A Year of Marvels (Trade Paperback)"),
                      Comic(name: "A Year of Marvels: April Infinite Comic (2016) #1"),
                      Comic(name: "A+X (2012) #4")]
        let comicResults = ComicResults(available: 4, items: comics, returned: 4)
        self.hero = Hero(id: 1, name: "Spider-Man", description: "Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.", thumbnail: Image(url: url!), comics: comicResults)
        
        apiClient = APIClient(publicKey: "e81a62777a0b00f8e8b85887fd58d16a", privateKey: "3f1235b807e85e11e9f8a5043440d4753ce037ec")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHeroDetailsViewModel() {
        let heroDetailsViewModel = HeroDetailsViewModel(hero)
        
        XCTAssertEqual(heroDetailsViewModel.name, "Spider-Man")
        XCTAssertEqual(heroDetailsViewModel.description, hero.description!)
        XCTAssertEqual(heroDetailsViewModel.comicTitle(for: IndexPath(row: 3, section: 0)), hero.comics!.items[3].name!)
        
        XCTAssertEqual(heroDetailsViewModel.numberOfRows, hero.comics!.items.count)
        XCTAssertEqual(heroDetailsViewModel.imageUrl, URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b.jpg"))
    }
    
    func testHeroesListViewModel() {
        let heroesListViewModel = HeroesListViewModel(apiClient)
        let indexPath = IndexPath(row: 0, section: 0)
        let expectFirstReturn = self.expectation(description: "Expects first return of viewModel getMoreHeroes")
        let expectSecondReturn = XCTestExpectation(description: "Expects second return of viewModel getMoreHeroes")

        XCTAssertEqual(heroesListViewModel.title, "Marvel Heroes")
        XCTAssertLessThanOrEqual(heroesListViewModel.numberOfRows, 20)
    
        heroesListViewModel.getMoreHeroes() { () in
            
            XCTAssertNotNil(heroesListViewModel.heroCellViewModel(for: indexPath))
            XCTAssertNotNil(heroesListViewModel.hero(for: indexPath))
            XCTAssertLessThanOrEqual(heroesListViewModel.numberOfRows, 40)
            expectFirstReturn.fulfill()
        }
        
        heroesListViewModel.getMoreHeroes() {
            expectSecondReturn.fulfill()
            XCTAssertNotNil(heroesListViewModel.heroCellViewModel(for: indexPath))
            XCTAssertNotNil(heroesListViewModel.hero(for: indexPath))
            XCTAssertLessThanOrEqual(heroesListViewModel.numberOfRows, 60)
        }
        
        waitForExpectations(timeout: 20) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
