
import UIKit

class HomeTableViewController: UITableViewController {
    
    var viewModel = HomeViewModel()
    private var mealsData = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
        navigationItem.configureNavigationItem(navigationItem: navigationItem)
        title = "Home"
        setupViews()
        viewModel.viewDidLoad()
        setupTable()
    }
    
    private func setupViews() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customLightGreen()]
        
//        //TODO: Move this code to HomeViewModel
//        let randomArea = getRandomArea()
//        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(randomArea)")!
//        FoodApiDataSource().getRecipesByAreaData(url: url) { recipes in
//            if let recipes = recipes {
//                //TODO: self.homeViewModel = HomeViewModel(categories: recipes)
//                self.mealsData = recipes 
//                
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//        }
    }
    
    private func setupTable() {
        tableView.register(UINib(nibName: "MealsCell", bundle: nil), forCellReuseIdentifier: "MealsCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        //TODO: Add searchBar
        //viewModel.configureSearchBar(tableView: tableView, navigationItem: navigationItem)
        definesPresentationContext = true
    }
    
    // MARK: - View Model Output
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
//    private func getRandomArea() -> String {
//        let listOfAreas = ["Canadian", "French", "Spanish", "American", "Indian", "Mexican", "Italian", "Greek", "Irish", "Chinese", "Japanese", "Portuguese", "British", "Croatian", "Dutch", "Egyptian", "Filipino", "Jamaican", "Kenyan", "Malaysian", "Moroccan", "Polish", "Russian", "Thai", "Tunisian", "Turkish", "Unknown", "Vietnamese"]
//        //TODO: Get random "Area"
//        let randomArea = listOfAreas.randomElement()!
//        print(randomArea)
//        return randomArea
//    }
    
    func configureCell(cell: MealsCell, indexPath: IndexPath) {
        //let recipe = mealsData[indexPath.row]
        let recipe = viewModel.getMeal(at: indexPath.row)
        cell.mealTitleLabel.text = recipe.strMeal
        let imageUrl = URL(string: recipe.strMealThumb)!
        cell.mealImageView.load(url: imageUrl)
        
//        let recipe = viewModel.getMeal(at: indexPath.row)
//        let imageUrl = URL(string: recipe.strMealThumb)!
//        cell.mealImageView.load(url: imageUrl)
//        cell.mealTitleLabel.text = recipe.strMeal
    }
}
    // MARK: - Table view data source

extension HomeTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealsCell", for: indexPath) as? MealsCell else { return UITableViewCell() }
//
//        //Action when favoritesButton is tapped
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

        print("inside cellForRowAt")
        configureCell(cell: cell, indexPath: indexPath)
        cell.indexPath = indexPath
        //cell.delegate = self

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "RecipesStoryboard", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesViewController") as? RecipesViewController {
            
            viewController.viewModel.viewDelegate = viewController
            
            let meal = viewModel.getMeal(at: indexPath.row)
            print(meal.idMeal)
            viewController.viewModel.recipeId = meal.idMeal
            viewController.recipeId = meal.idMeal
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            backItem.tintColor = UIColor.customLightGreen()
            navigationItem.backBarButtonItem = backItem
            //TODO: is this ok???
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
