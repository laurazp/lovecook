
import Foundation

struct MealsByCategoryListViewModel {
    let meals: [Meal]?

    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.meals?.count ?? 0
    }
    
    func categoryAtIndex(_ index: Int) -> MealsByCategoryViewModel {
        let meal = self.meals?[index] ?? Meal(strMeal: "Error", strMealThumb: "Error", idMeal: "Error")
        return MealsByCategoryViewModel(meal)
    }
}

struct MealsByCategoryViewModel {
    private let meal: Meal
    
    var title: String {
        return self.meal.strMeal
    }
    
    var image: String {
        return self.meal.strMealThumb
    }
    
    var id: String {
        return self.meal.idMeal
    }
    
    init(_ meal: Meal) {
        self.meal = meal
    }
}
