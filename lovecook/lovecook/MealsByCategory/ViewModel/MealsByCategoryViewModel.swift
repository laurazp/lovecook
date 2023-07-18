
import Foundation
import UIKit
import CoreData

final class MealsByCategoryViewModel {
    weak var viewDelegate: MealsByCategoryViewController?
    var category: Category?
    private var mealsData = [Meal]()
    private let favoriteRecipeCrudUseCase = FavoriteRecipeCrudUseCase()
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
    
    func addMealToFavorites(favoriteMeal: Meal) {
        //Get recipe from API using Meal id
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(favoriteMeal.idMeal)")!
        getMealsUseCase.getRecipe(url: url) { meals in
            guard let newFavoriteMeal = meals?[0] else { return }
            //Save to CoreData
            self.favoriteRecipeCrudUseCase.addFavoriteRecipe(newFavoriteMeal)
        }
    }
    
    func deleteMealFromFavorites(favoriteMeal: Meal) {
        
    }
    
//    @IBAction func toggleFavorite(_ sender: Any) {
//        guard let favRecipe = currentBook else { return }
//        favRecipe.isFavorite = !favRecipe.isFavorite
//        try? managedObjectContext.save()
//        updateFavoriteButton()
//    }
//    
//    func updateFavoriteButton() {
//        if currentBook?.isFavorite == true {
//            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        } else {
//            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
//        }
//    }
}
