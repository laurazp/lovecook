
import UIKit

class CategoriesTableViewController: UITableViewController {

    
    //@IBOutlet var categoriesTableView: UITableView!
    let viewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        //setupTable()
        viewModel.viewDidLoad()
    }
    
    // MARK: - View Model Output
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        //tableView.reloadData()
    }
    
    private func setupTable() {
        tableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
//        categoriesTableView.delegate = self
//        categoriesTableView.dataSource = self
//        categoriesTableView.rowHeight = UITableView.automaticDimension
//        //categoriesTableView.estimatedRowHeight = 90
//        definesPresentationContext = true
        print("Table setup done")
    }
    
    func configureCell(cell: CategoriesCell, indexPath: IndexPath) {
        let category = viewModel.getCategory(at: indexPath.row)
        
        print(category.strCategory)
        //TODO: Assign title and image when cell is ready
        cell.categoryTitleLabel.text = category.strCategory
        //cell.categoryImage = UIImageView(image: UIImage(named: "xmark"))
        //TODO: cell.categoryImage = UIImageView(image: UIImage(named: "xmark"))
        //cell.image = strCategoryThumb --> es el string de una url !
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside cellforrowat")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as? CategoriesCell else { return UITableViewCell() }
        // TODO: Configure the cell...
        configureCell(cell: cell, indexPath: indexPath)
        cell.indexPath = indexPath
        //cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose a Category"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: implement this
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
