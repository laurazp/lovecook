
import Foundation
import UIKit

final class RecipesViewModel {
    weak var viewDelegate: RecipesViewController?
    var recipe: Recipe?
    var recipeResult = [Recipe]()
    
    private let getMealsUseCase = GetMealsUseCase()
    
    func viewDidLoad() {
        if let recipe = recipe {
            viewDelegate?.configureView(with: recipe)
            //getRecipe(recipeId: recipe.idMeal) ????????????? sobra????
        }
    }
    
    func getRecipe(recipeId: String) {
        let url = URL(string: "www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)")!
        getMealsUseCase.getRecipe(url: url) { meals in
            self.recipeResult = meals ?? [Recipe]()
            self.recipe = meals?[0]
        }
    }
    
    func setRecipe(recipeId: String) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)")!
        getMealsUseCase.getRecipe(url: url) { meals in
            self.recipeResult = meals ?? [Recipe]()
            self.recipe = meals?[0]
        }
    }
    
    func getRecipe(at index: Int) -> Recipe {
        recipeResult[index]
    }
}


/*
 Lookup full meal details by id
 www.themealdb.com/api/json/v1/1/lookup.php?i=52772
 */
