
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
        
        //self.viewDelegate?.configureView(with: existingRecipe)

//        print("Selected recipe is:")
//        print(self.recipe)
//        if let selectedRecipe = self.recipe {
//            print("Recipe exists")
//            self.viewDelegate?.configureView(with: selectedRecipe)
//            //getRecipe(recipeId: recipe.idMeal)
//        }
    }
    
    func getRecipe(recipeId: String) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)")!
        getMealsUseCase.getRecipe(url: url) { meals in
            self.recipeResult = meals ?? [Recipe]()
            self.recipe = meals?[0]
            //self.viewDelegate?.updateView()
            if let existingRecipe = self.recipe {
                print("Recipe ok")
                print(self.recipe.customMirror.subjectType)
                self.setSelectedRecipe(recipe: self.recipe!)
            }
        }
    }
    
    private func setSelectedRecipe(recipe: Recipe) {
        print("Selected recipe is:")
        print(self.recipe)
        self.viewDelegate?.configureView(with: recipe)
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
