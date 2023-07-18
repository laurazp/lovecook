
import Foundation

class FavoriteRecipeCrudUseCase {
    
    private let coreDataFavoriteRecipeRepository = CoreDataFavoriteRecipeRepository()
    
    func getFavoriteRecipe(id: Int, completionHandler: @escaping (Recipe?, Error?) -> Void) {
        //coreDataFavoriteRecipeRepository.get(id: id, completionHandler: <#T##(FavoriteRecipe?, Error?) -> Void#>)
    }
    
    func listAllFavoriteRecipes(completionHandler: @escaping ([Favorite])-> () /*completionHandler: ([Recipe]?, Error?) -> Void*/) {
        coreDataFavoriteRecipeRepository.list() { favorites in
            if favorites != nil {
                print("listAllFavoriteRecipes ok")
                completionHandler(favorites ?? [Favorite]())
             }
//               else if let error = error {
//                 print("There was an error \(error)")
//             }
        }
    }
    
    func addFavoriteRecipe(_ item: Recipe) {
        coreDataFavoriteRecipeRepository.add(item)
    }
    
    func deleteFavoriteRecipe(_ item: Recipe, completionHandler: (Error?) -> Void) {
        
    }
}
