
import Foundation
import UIKit

final class MealsByCategoryViewModel {
    weak var viewDelegate: MealsByCategoryViewController?
    var category: Category?
    private var mealsData = [Meal]()
    
    private let getMealsUseCase = GetMealsUseCase()
    
    func viewDidLoad() {
        if let category = category {
            viewDelegate?.configureView(with: category)
            getMealsByCategory(category: category.strCategory)
        }
    }
    
    private func getMealsByCategory(category: String) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)")!
        getMealsUseCase.getMealsFilteredByCategory(url: url) { meals in
            self.mealsData = meals ?? [Meal]()
            self.viewDelegate?.updateView()
        }
    }
    
    func getMeal(at index: Int) -> Meal {
        mealsData[index]
    }
    
    func numberOfItems() -> Int {
        mealsData.count
    }
}
