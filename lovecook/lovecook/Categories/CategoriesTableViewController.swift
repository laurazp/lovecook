
import Foundation
import UIKit

class CategoriesTableViewController: UITableViewController {

    private var categoriesViewModel: CategoriesListViewModel!
//    private var mealsByCategoryViewModel = MealsByCategoryViewModel()
    private let categoryViewModelToCategoryMapper = CategoryViewModelToCategoryMapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        navigationItem.configureNavigationItem(navigationItem: navigationItem)
        setupTable()
    }
    
    private func setupTable() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customLightGreen()]
        
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
        FoodApiDataSource().getCategoriesData(url: url) { categories in
            if let categories = categories {
                self.categoriesViewModel = CategoriesListViewModel(categories: categories)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoriesViewModel == nil ? 0 : self.categoriesViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoriesViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as? CategoriesCell else { fatalError("Error. No cell was found.") }
        
        let category = self.categoriesViewModel.categoryAtIndex(indexPath.row)
        cell.categoryTitleLabel.text = category.title
        //cell.categoryImage = UIImageView(image: UIImage(imageLiteralResourceName: category.image))
        let imageUrl = URL(string: category.image)!
        cell.categoryImage.load(url: imageUrl)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "MealsByCategoryStoryboard", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "MealsByCategoryViewController") as? MealsByCategoryViewController {
            
            viewController.viewModel.viewDelegate = viewController
            let category = categoriesViewModel.categoryAtIndex(indexPath.row)
            let mappedCategory = categoryViewModelToCategoryMapper.mapToCategory(categoryViewModel: category)
//            mealsByCategoryViewModel.category = mappedCategory
            viewController.viewModel.category = mappedCategory
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            backItem.tintColor = UIColor.customLightGreen()
            navigationItem.backBarButtonItem = backItem
            
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose a Category"
    }
        
    
//    let viewModel = CategoriesViewModel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Categories"
//        //setupTable()
//        viewModel.viewDidLoad()
//    }
//
//    // MARK: - View Model Output
//    func updateView() {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//        //self.tableView.reloadData()
//    }
//
//    private func setupTable() {
//        //tableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
////        categoriesTableView.delegate = self
////        categoriesTableView.dataSource = self
////        categoriesTableView.rowHeight = UITableView.automaticDimension
////        //categoriesTableView.estimatedRowHeight = 90
////        definesPresentationContext = true
//        print("Table setup done")
//    }
//
//    func configureCell(cell: CategoriesCell, indexPath: IndexPath) {
//        let category = self.viewModel.getCategory(at: indexPath.row)
//
//        print(category.strCategory)
//        //TODO: Assign title and image when cell is ready
//        cell.categoryTitleLabel.text = category.strCategory
//        //cell.categoryImage = UIImageView(image: UIImage(named: "xmark"))
//        //TODO: cell.categoryImage = UIImageView(image: UIImage(named: "xmark"))
//        //cell.image = strCategoryThumb --> es el string de una url !
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("ROWS = \(self.viewModel.numberOfItems())")
//
//        if (self.viewModel.numberOfItems() != 0) {
//            return self.viewModel.numberOfItems()
//        } else {
//            return 1
//        }
//        //return self.viewModel.numberOfItems()
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("inside cellforrowat")
//        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as? CategoriesCell else { fatalError("Error. No cell was found.") }
//
//        // TODO: Configure the cell...
//        //self.tableView.reloadData()
//        let category = self.viewModel.getCategory(at: indexPath.row)
//        cell.categoryTitleLabel.text = category.strCategory
//        //cell.categoryImage = UIImageView(image: UIImage(imageLiteralResourceName: category.strCategoryThumb))
//
////        configureCell(cell: cell, indexPath: indexPath)
//        //cell.indexPath = indexPath
//        //cell.delegate = self
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Choose a Category"
//    }
//
////    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
////    {
////        return 30
////    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //TODO: implement this
//
//
//    }

}
