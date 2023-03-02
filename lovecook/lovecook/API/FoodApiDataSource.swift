
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
    
    /*
     Filter by Category
     www.themealdb.com/api/json/v1/1/filter.php?c=Seafood
     */
}
