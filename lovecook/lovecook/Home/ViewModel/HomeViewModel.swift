
import Foundation

class HomeViewModel {
    
    private var homeMealsData = [Meal]()
    weak var viewDelegate: HomeTableViewController?
    
    func viewDidLoad() {
        if homeMealsData.count > 0 {
            //TODO: configure view with meals array
            
        }
        
//        if let category = category {
//            viewDelegate?.configureView(with: category)
//            getMealsByCategory(category: category.strCategory)
//        }
    }
    
    private func getMealsByArea() {
        let randomArea = getRandomArea()
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(randomArea)")!
        FoodApiDataSource().getRecipesByAreaData(url: url) { recipes in
            if let recipes = recipes {
                //TODO: self.homeViewModel = HomeViewModel(categories: recipes)
                self.homeMealsData = recipes
                
                DispatchQueue.main.async {
                    self.viewDelegate?.updateView()
                }
            }
        }
    }
    
    private func getRandomArea() -> String {
        let listOfAreas = ["Canadian", "French", "Spanish", "American", "Indian", "Mexican", "Italian", "Greek", "Irish", "Chinese", "Japanese", "Portuguese", "British", "Croatian", "Dutch", "Egyptian", "Filipino", "Jamaican", "Kenyan", "Malaysian", "Moroccan", "Polish", "Russian", "Thai", "Tunisian", "Turkish", "Unknown", "Vietnamese"]
        //TODO: Get random "Area"
        let randomArea = listOfAreas.randomElement()!
        print(randomArea)
        return randomArea
    }
    
//    private func getMealsByCategory(category: String) {
//        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)")!
//        getMealsUseCase.getMealsFilteredByCategory(url: url) { meals in
//            self.mealsData = meals ?? [Meal]()
//            self.viewDelegate?.updateView()
//        }
//    }
    
    func getMeal(at index: Int) -> Meal {
        homeMealsData[index]
    }
    
    func numberOfItems() -> Int {
        homeMealsData.count
    }
}
