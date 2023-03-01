
import Foundation

typealias GetMealsResult = ([Meal]) -> ()

struct GetMealsUseCase {
    private let dataSource = FoodApiDataSource()
    
    func getMeals(url: URL, completion: @escaping GetMealsResult) {
        //dataSource.getMealsData(url: url, completion: completion)
    }
}
