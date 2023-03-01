
import Foundation

 typealias GetCategoriesResult = ([Category]?) -> ()

 struct GetCategoriesUseCase {
     private let dataSource = FoodApiDataSource()
     
     func getCategories(url: URL, completion: @escaping GetCategoriesResult) {
         dataSource.getCategoriesData(url: url, completion: completion)
     }
 }
