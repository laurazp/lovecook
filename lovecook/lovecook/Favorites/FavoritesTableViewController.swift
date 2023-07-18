
import UIKit
import CoreData

class FavoritesTableViewController: UITableViewController, UISearchResultsUpdating {
    
    let viewModel = FavoritesViewModel()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        navigationItem.configureNavigationItem(navigationItem: navigationItem)
        setupTable()
        viewModel.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.viewDidLoad()
    }
    
    private func setupTable() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customLightGreen()]
        //SearchBar
        viewModel.configureSearchBar(tableView: tableView, navigationItem: navigationItem)
    }
    
    func configureCell(cell: FavoritesCell, indexPath: IndexPath) {
        let recipe = viewModel.getMeal(at: indexPath.row)
        let imageUrl = URL(string: recipe.strMealThumb)!
        cell.recipeImageView.load(url: imageUrl)
        cell.titleLabel.text = recipe.strMeal
    }
    
    //MARK: - View Model Output
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //TODO: ¿¿¿¿----------------------?????
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCell else { return UITableViewCell() }
        
        

        
        //Action when favoritesButton is tapped
//        cell.favoritesButtonSelectedAction = { [unowned self] in
//            let favoriteRecipe = viewModel.getMeal(at: indexPath.row)
//            //TODO: add recipe to favorites
//            viewModel.addMealToFavorites(favoriteMeal: favoriteRecipe)
//            
//            let alert = UIAlertController(title: "Favorite added!", message: "\(favoriteRecipe.strMeal) added to Favorites", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
//        }
//        
//        cell.favoritesButtonDeselectedAction = { [unowned self] in
//            let favoriteRecipe = viewModel.getMeal(at: indexPath.row)
//            //TODO: delete recipe from favorites
//            
//            let alert = UIAlertController(title: "Favorite deleted", message: "\(favoriteRecipe.strMeal) deleted from Favorites", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
//        }
        
        configureCell(cell: cell, indexPath: indexPath)
        cell.indexPath = indexPath
        //cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "RecipesStoryboard", bundle: nil)
//        if let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesViewController") as? RecipesViewController {
//
//            viewController.viewModel.viewDelegate = viewController
//
//            let meal = viewModel.getMeal(at: indexPath.row)
//            print("Meal Id:")
//            print(meal.idMeal)
//            viewController.viewModel.recipeId = meal.idMeal
//            //viewController.viewModel.setRecipe(recipeId: meal.idMeal)
//            viewController.recipeId = meal.idMeal
//
//            let backItem = UIBarButtonItem()
//            backItem.title = "Back"
//            backItem.tintColor = UIColor.customLightGreen()
//            navigationItem.backBarButtonItem = backItem
//            //TODO: is this ok???
//            tableView.deselectRow(at: indexPath, animated: true)
//            navigationController?.pushViewController(viewController, animated: true)
//        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
