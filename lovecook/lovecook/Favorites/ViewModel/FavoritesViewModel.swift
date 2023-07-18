
import Foundation
import UIKit

final class FavoritesViewModel {
    weak var viewDelegate: FavoritesTableViewController?
    private let favoriteRecipeCrudUseCase = FavoriteRecipeCrudUseCase()
    private let foodApiDataSource = FoodApiDataSource()
    private let getMealsUseCase = GetMealsUseCase()
    var favorites = [Recipe]()
    
    //SearchBar
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func viewDidLoad() {
        listFavoriteRecipes()
    }
    
    //SearchBar
    func configureSearchBar(tableView: UITableView, navigationItem: UINavigationItem) {
        searchController.searchResultsUpdater = viewDelegate
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for recipes"
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        //setupSearchBar()
    }
    
    //SearchBar TODO: Borrar si no hace falta !!!
    //    func setupSearchBar() {
    //        let searchBar = resultSearchController!.searchBar
    //        searchBar.sizeToFit()
    //        searchBar.placeholder = "Search for dates"
    //        searchBar.delegate = viewDelegate as? UISearchBarDelegate
    //    }
    
    func listFavoriteRecipes() {
        favoriteRecipeCrudUseCase.listAllFavoriteRecipes() { favoriteRecipes in
            if favoriteRecipes != nil {
                //self.favorites = favoriteRecipes ?? [Favorite]()
                
                for recipe in favoriteRecipes {
                    self.getRecipe(recipeId: String(describing: recipe.id))
                    print("Favorite converted to recipe!")
                    //self.favorites.append(favoriteMappedToRecipe)
                }
                self.viewDelegate?.updateView()
             }
//            else if let error = error {
//                 print("There was an error \(error)")
//             }
         }
        print("Favorite recipes ok")
    }
    
    func getRecipe(recipeId: String) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)")!
        getMealsUseCase.getRecipe(url: url) { meals in
            self.favorites = meals ?? [Recipe]()
            let recipe = meals?[0]
            if let existingRecipe = recipe {
                print("Recipe ok")
                self.favorites.append(existingRecipe)
            }
        }
    }
    
    func getMeal(at index: Int) -> Recipe {
        favorites[index]
    }
    
    func numberOfItems() -> Int {
        favorites.count
    }
}
