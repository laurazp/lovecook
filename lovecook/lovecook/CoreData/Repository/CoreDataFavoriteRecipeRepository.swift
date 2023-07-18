
import Foundation
import CoreData
import UIKit

//enum RepositoryError: Error {
//    case notFound
//}

class CoreDataFavoriteRecipeRepository {
    
    typealias T =  Recipe
    private let apiClient = FoodApiDataSource()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func get(id: Int, completionHandler: /*@escaping*/ (Recipe?, Error?) -> Void) {
//        do {
//            apiClient.getRecipeById(url: <#T##URL#>, completion: <#T##([Recipe]?) -> ()#>)
//        } catch let error {
//            //TODO: handle error
//            
//        }
    }
    
    func list(completionHandler: @escaping ([Favorite]?) -> () /*completionHandler: ([Recipe]?, Error?) -> Void*/) {
        
        //Fetch CoreData favorites
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        do {
            let result = try context.fetch(fetchRequest)
            //TODO: Handle the fetched data in the "result" array
            for recipe in result {
                //TODO: show favorites in Favorites tableView
                print(recipe.title)
            }
            print("Favorites fetched!")
            completionHandler(result)
        } catch {
            //TODO: Handle any errors that occur during the fetch
            print("Error fetching Favorites from CoreData")
        }
    }
    
    func add(_ item: Recipe) {
//        let newItem = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context) as! Favorite
//        newItem.recipeId = item.idMeal
//        newItem.title = item.strMeal
//        newItem.isFavorite = true
        
        
        
        
        var newFavoriteRecipe = Favorite(context: context)
        newFavoriteRecipe.recipeId = item.idMeal
        newFavoriteRecipe.title = item.strMeal
        newFavoriteRecipe.isFavorite = true
        do {
            try context.save()
            print("Favorite saved to CoreData")
        } catch {
            //TODO: handle error
        }
    }
    
//    func add(_ item: Recipe, completionHandler: (Error?) -> Void) {
//        var newFavoriteRecipe = FavoriteRecipe(context: context)
//        newFavoriteRecipe.idMeal = item.idMeal
//        //TODO: newFavoriteRecipe = item
//        do {
//            try context.save()
//        } catch {
//            //TODO: handle error
//        }
//    }
    
    func delete(_ item: Recipe, completionHandler: (Error?) -> Void) {
        //TODO: context.delete(item)
        do {
            try context.save()
        } catch {
            //TODO: handle error
        }
    }
}
