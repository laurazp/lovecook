
import Foundation


class FoodApiDataSource {
    
    func getCategoriesData(url: URL, completion: @escaping ([Category]?)-> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to convert \(error)")
                //TODO: Show error message in TableView ??
                completion(nil)
            } else if let data = data {
                let categoriesResponse = try?  JSONDecoder().decode(CategoriesResponse.self, from: data)
                if let categoriesResponse = categoriesResponse {
                    completion(categoriesResponse.categories)
                }
            }
        }.resume()
    }
    
    func filterByCategory(url: URL, completion: @escaping ([Meal]?)-> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to convert \(error)")
                //TODO: Show error message in TableView ??
                completion(nil)
            } else if let data = data {
                let mealsResponse = try?  JSONDecoder().decode(MealResponse.self, from: data)
                if let mealsResponse = mealsResponse {
                    completion(mealsResponse.meals)
                }
            }
        }.resume()
    }
    
    func getRecipeById(url: URL, completion: @escaping ([Recipe]?)-> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                    let jsonDecoder = JSONDecoder()
                    if let error = error {
                        print(error)
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                        return
                    }
                    guard let data = data else {
                        print("data was nil")
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                        return
                    }
                    do {
                        let recipeResponse = try jsonDecoder.decode(RecipeResponse.self, from: data)
                        print("Decoding ok")
                        DispatchQueue.main.async {
                            completion(recipeResponse.meals)
                        }
                    } catch {
                        print(error)
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                    }
                }.resume()
    }
}
