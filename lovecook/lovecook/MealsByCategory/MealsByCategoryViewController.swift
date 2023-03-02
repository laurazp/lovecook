
import UIKit

class MealsByCategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MealsByCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = "CATEGORY"
        viewModel.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
    }
    
//    private func setupTable() {
//        tableView.register(UINib(nibName: "EarthquakeEventCell", bundle: nil), forCellReuseIdentifier: "EarthquakeEventCell")
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 90
//        viewModel.configureSearchBar(tableView: tableView, navigationItem: navigationItem)
//        definesPresentationContext = true
//    }
    
    // MARK: - View Model Output
    func updateView() {
        tableView.reloadData()
    }
    
    func configureView(with detail: Category) {
        configure(with: detail)
    }
    
    private func configure(with detail: Category) {
        // Assigning data to variables
        categoryTitleLabel.text = detail.strCategory
        print("Title label text = \(detail.strCategory)")
        let imageUrl = URL(string: detail.strCategoryThumb)!
        categoryImageView.load(url: imageUrl)
    }
    
//    func configureCell(cell: EarthquakeEventCell, indexPath: IndexPath) {
//        let feature = viewModel.getFeature(at: indexPath.row)
//        let magSubstring = feature.properties.title?.prefix(8).prefix(6).suffix(4)
//        let magString = magSubstring.map(String.init)
//        cell.magLabel.text = magString
//        let magnitudeColor = viewModel.getColor(forMagnitude: feature.properties.mag ?? 0)
//        cell.magLabel.textColor = magnitudeColor
//    }
}

// MARK: - Table view data source

extension MealsByCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
