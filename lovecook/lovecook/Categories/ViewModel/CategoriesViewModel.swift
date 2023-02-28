
import Foundation

struct CategoriesListViewModel {
    let categories: [Category]?

    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.categories?.count ?? 0
    }
    
    func categoryAtIndex(_ index: Int) -> CategoriesViewModel {
        let category = self.categories?[index] ?? Category(strCategory: "Error", strCategoryThumb: "Error")
        return CategoriesViewModel(category)
    }
}

struct CategoriesViewModel {
    private let category: Category
    
    var title: String {
        return self.category.strCategory
    }
    
    var image: String {
        return self.category.strCategoryThumb
    }
    
    init(_ category: Category) {
        self.category = category
    }
}



//final class CategoriesViewModel {
//    weak var viewDelegate: CategoriesTableViewController?
//
//    private let apiDataSource = FoodApiDataSource()
//    var categoriesDataList: [Category] = []
//
//    func viewDidLoad() {
//        getCategories()
//    }
//
//    func getCategory(at index: Int) -> Category {
//        //getCategories()
//        print(index)
//        return self.categoriesDataList[index] //Thread 1: Fatal error: Index out of range
//    }
//
//    func numberOfItems() -> Int {
//        return self.categoriesDataList.count
//    }
//
//    private func getCategories() {
//        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
//        apiDataSource.getCategoriesData(url: url) { categories in
////            self.categoriesDataList.removeAll()
////            self.categoriesDataList.append(contentsOf: categories)
//            self.categoriesDataList = categories!
//            self.viewDelegate?.updateView()
//        }
//    }
//}
