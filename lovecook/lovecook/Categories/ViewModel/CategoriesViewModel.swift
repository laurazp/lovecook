
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
        apiDataSource.getCategoriesData { categories in
            self.categoriesDataList = categories
            self.viewDelegate?.updateView()
        }
    }
}
