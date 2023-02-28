
import Foundation

final class CategoriesViewModel {
    weak var viewDelegate: CategoriesTableViewController?
    
    private let apiDataSource = FoodApiDataSource()
    private var categoriesDataList = [Category]()
    
    func viewDidLoad() {
        getCategories()
    }
    
    func getCategory(at index: Int) -> Category {
        return categoriesDataList[index]
    }
    
    func numberOfItems() -> Int {
        return categoriesDataList.count
    }
    
    private func getCategories() {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
        apiDataSource.getCategoriesData(url: url) { categories in
            self.categoriesDataList = categories
            self.viewDelegate?.updateView()
        }
    }
}
