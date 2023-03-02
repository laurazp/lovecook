
import UIKit

class MealsByCategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MealsByCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.viewDidLoad()
        setupTable()
    }
    
    private func setupView() {
        descriptionLabel.text = "CATEGORY"
    }
    
    private func setupTable() {
        tableView.register(UINib(nibName: "MealsCell", bundle: nil), forCellReuseIdentifier: "MealsCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 90
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
    
    /*
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let storyboard = UIStoryboard(name: "EarthquakeDetailStoryboard", bundle: nil)
         if let viewController = storyboard.instantiateViewController(withIdentifier: "EarthquakeDetailViewController") as? EarthquakeDetailViewController {
             //viewController.title = "Detail"
             viewController.viewModel.viewDelegate = viewController
             let feature = viewModel.getFeature(at: indexPath.row)
             // Passing data to EarthquakeDetailViewController
             let properties = feature.properties
             let geometry = feature.geometry
             let date = Date(timeIntervalSince1970: TimeInterval(properties.time ?? 0) / 1000)
             
             let titleSplit = properties.title?.components(separatedBy: " of ")
             viewController.title = titleSplit?.last
             
             let selectedEarthquakeDetail = EarthquakeDetail(title: " ",
                                                             place: properties.place,
                                                             time: date,
                                                             tsunami: properties.tsunami ?? 0,
                                                             coords: geometry.coordinates,
                                                             magnitude: properties.mag)
             
             let backItem = UIBarButtonItem()
             backItem.title = "Back"
             navigationItem.backBarButtonItem = backItem
             
             viewController.viewModel.earthquakeDetail = selectedEarthquakeDetail
             navigationController?.pushViewController(viewController, animated: true) // Navegacion
             //present(viewController, animated: true) // Modal (pantalla de abajo a arriba)
         }
     */
}
