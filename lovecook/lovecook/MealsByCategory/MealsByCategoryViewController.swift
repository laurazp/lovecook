
import UIKit

class MealsByCategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MealsByCategoryViewModel()
    private let categoryViewModelToCategoryMapper = CategoryViewModelToCategoryMapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.viewDidLoad()
        setupTable()
    }
    
    private func setupView() {
        descriptionLabel.text = "CATEGORY"
        //categoryImageView.backgroundColor = UIColor.customOrange()
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
    
    func configureView(with detail: Category) {
        configure(with: detail)
    }
    
    private func configure(with detail: Category) {
        categoryTitleLabel.text = detail.strCategory
        let imageUrl = URL(string: detail.strCategoryThumb)!
        categoryImageView.load(url: imageUrl)
    }
    
    func configureCell(cell: MealsCell, indexPath: IndexPath) {
        let recipe = viewModel.getMeal(at: indexPath.row)
        let imageUrl = URL(string: recipe.strMealThumb)!
        cell.mealImageView.load(url: imageUrl)
        cell.mealTitleLabel.text = recipe.strMeal
    }
}

// MARK: - Table view data source

extension MealsByCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealsCell", for: indexPath) as? MealsCell else { return UITableViewCell() }
        
        configureCell(cell: cell, indexPath: indexPath)
        cell.indexPath = indexPath
        //cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "RecipesStoryboard", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesViewController") as? RecipesViewController {
            
            viewController.viewModel.viewDelegate = viewController
            
            let meal = viewModel.getMeal(at: indexPath.row)
            print("Meal Id:")
            print(meal.idMeal)
            viewController.viewModel.recipeId = meal.idMeal
            //viewController.viewModel.setRecipe(recipeId: meal.idMeal)
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
