
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
    
    /*func getCategoriesData(url: URL, completion: @escaping GetCategoriesResult) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong...")
                //TODO: Show error in tableview ??
                return
            }
            
            var result: CategoriesResponse?
            do {
                result = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                if let result = result {
                    DispatchQueue.main.async {
                        print(result.categories)
                        completion(result.categories)
                    }
                }
            }
            catch {
                print("Failed to convert \(error)")
            }
            
            guard let json = result else {
                return
            }

            print(json.categories)
            DispatchQueue.main.async {
                completion(json.categories)
            }
        }).resume()
    }*/
    
    func filterByCategory(url: URL, completion: @escaping ([Meal]?)-> ()) {
        
    }
    
    /*
     Filter by Category
     www.themealdb.com/api/json/v1/1/filter.php?c=Seafood
     */
}
