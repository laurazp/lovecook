
import Foundation

typealias GetMealsResult = ([Meal]?) -> ()
typealias GetRecipeResult = ([Recipe]?) -> ()

struct GetMealsUseCase {
    private let dataSource = FoodApiDataSource()
    
    func getRecipe(url: URL, completion: @escaping GetRecipeResult) {
        print(url)
        dataSource.getRecipeById(url: url, completion: completion)
    }
    
    func getMealsFilteredByCategory(url: URL, completion: @escaping GetMealsResult) {
        dataSource.filterByCategory(url: url, completion: completion)
    }
}
