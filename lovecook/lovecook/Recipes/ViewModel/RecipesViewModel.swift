
import Foundation
import UIKit

class RecipesViewModel {
    weak var viewDelegate: RecipesViewController?
    var recipe: Recipe?
    var recipeResult = [Recipe]()
    var recipeId: String = ""
    
    private let getMealsUseCase = GetMealsUseCase()
    
    func viewDidLoad() {
        print("Inside viewModel's viewdidload")
        print(self.recipeId)
        
        //guard let finalRecipe = blabla else { return }
        
        getRecipe(recipeId: self.recipeId)
        
        //TODO: no seguir hasta que getRecipe haya terminado !!!!!!!
        
        print("Selected recipe is:")
        print(self.recipe)
        if let selectedRecipe = self.recipe {
            print("Recipe exists")
            self.viewDelegate?.configureView(with: selectedRecipe)
            //getRecipe(recipeId: recipe.idMeal)
        }
    }
    
    func getRecipe(recipeId: String) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)")!
        getMealsUseCase.getRecipe(url: url) { meals in
            self.recipeResult = meals ?? [Recipe]()
            self.recipe = meals?[0]
            if let existingRecipe = self.recipe {
                print("Recipe ok")
                print(self.recipe.customMirror.subjectType)
            }
        }
    }
    
    func setRecipe(recipeId: String) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)")!
        getMealsUseCase.getRecipe(url: url) { meals in
            self.recipeResult = meals ?? [Recipe]()
            self.recipe = meals?[0]
            print("Setting recipe")
        }
    }
    
    func getRecipe(at index: Int) -> Recipe {
        recipeResult[index]
    }
}
