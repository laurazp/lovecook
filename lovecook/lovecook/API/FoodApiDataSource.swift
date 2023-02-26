
import Foundation

class FoodApiDataSource {
    
    func getCategoriesData(completion: @escaping ([Category])-> ()) {
        
        let url = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                print("Something went wrong...")
                return
            }
            
            // Have data
            var result: CategoriesResponse?
            do {
                result = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result!.categories)
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
        })
        task.resume()
    }
}
