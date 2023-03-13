
import Foundation
import UIKit

final class FavoritesViewModel {
    weak var viewDelegate: FavoritesTableViewController?
    //SearchBar
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    //fin ---
    
    func viewDidLoad() {
        
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
}
