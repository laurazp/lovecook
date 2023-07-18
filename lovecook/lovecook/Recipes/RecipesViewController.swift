
import UIKit
import CoreData

class RecipesViewController: UIViewController {

    var viewModel = RecipesViewModel()
    private let getMealsUseCase = GetMealsUseCase()
    var recipeId: String = ""
    //@IBOutlet weak var favoriteButton: UIButton!
    var favoritesButtonSelectedAction : (() -> ())?
    var favoritesButtonDeselectedAction : (() -> ())?
    
    @IBOutlet weak var recipesStackView: UIStackView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    @IBOutlet weak var recipeAreaLabel: UILabel!
    @IBOutlet weak var recipeInstructionsLabel: UILabel!
    @IBOutlet weak var recipeTagsLabel: UILabel!
    @IBOutlet weak var ingredientsCardView: UIView!
    @IBOutlet weak var instructionsCardView: UIView!
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    @IBOutlet weak var detailsStackView: UIStackView!
    @IBOutlet weak var recipesScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let contentRect: CGRect = recipesScrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        recipesScrollView.contentSize = contentRect.size
        detailsStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        detailsStackView.isLayoutMarginsRelativeArrangement = true
        recipesStackView.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        recipesStackView.isLayoutMarginsRelativeArrangement = true
        ingredientsCardView.layer.cornerRadius = 20
        ingredientsCardView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        instructionsCardView.layer.cornerRadius = 20
        instructionsCardView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        setupLabelsHeightInsideCardViews()
        setupAddFavoritesButton()
    }
    
    private func setupAddFavoritesButton() {
//        let isFavorite = recipe.isFavorite ?? false
//        let buttonImage = isFavorite ? UIImage(named: "heart.fill") : UIImage(named: "heart")
//        favoriteButton.setImage(buttonImage, for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: #selector(favoriteButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemBlue
                
        //favoritesButton.setImage(UIImage(systemName: "heart"), for: [])
        //favoritesButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.selected)
        //favoritesButton.addTarget(self, action: #selector(favoriteButtonTapped), for: UIControl.Event.touchUpInside)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        if navigationItem.rightBarButtonItem?.isSelected == true {
            navigationItem.rightBarButtonItem?.isSelected = false
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
            favoritesButtonDeselectedAction?()
            if let selectedRecipe = viewModel.recipe {
                //getRecipeAndPutIntoFavs(recipe: selectedRecipe)
            }
          } else {
              navigationItem.rightBarButtonItem?.isSelected = true
              navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
              favoritesButtonSelectedAction?()
          }
    }
    
//    func getRecipeAndPutIntoFavs(recipe: Recipe) {
//        var favoriteMeal: Recipe
//        //Call API
//        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipe.idMeal)")!
//        //Get recipe from API using Meal id
//        getMealsUseCase.getRecipe(url: url) { meals in
//            favoriteMeal = (meals?[0])!
//        }
//        //Save recipe to CoreData as FavoriteRecipe
////        favoriteRecipeCrudUseCase.addFavoriteRecipe(favoriteMeal) {_ in
////            //Update user's Favorites list
////            print("Meal added to Favorites")
////        }
//        //Save
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let newItem = NSEntityDescription.insertNewObject(forEntityName: "FavoriteRecipe", into: context) as! FavoriteRecipe
//        newItem.idMeal = favoriteMeal.idMeal
//        newItem.strMeal = favoriteMeal.strMeal
//        //newItem.isFavorite = favoriteMeal.isFavorite
//        try! context.save()
//    }
    
    private func setupLabelsHeightInsideCardViews() {
        recipeIngredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        recipeIngredientsLabel.setContentHuggingPriority(.required, for: .vertical)
        recipeIngredientsLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        recipeInstructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        recipeInstructionsLabel.setContentHuggingPriority(.required, for: .vertical)
        recipeInstructionsLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    func configureView(with detail: Recipe) {
        configure(with: detail)
    }
    
    private func configure(with detail: Recipe) {
        let imageUrl = URL(string: detail.strMealThumb)!
        recipeImageView.load(url: imageUrl)
        recipeTitleLabel.text = detail.strMeal
        recipeTitleLabel.textColor = UIColor.darkGray
        recipeCategoryLabel.text = "Category: " + String(describing: detail.strCategory)
        recipeAreaLabel.text = "Area: " + String(describing: detail.strArea ?? "")
        let ingredientsText = configureIngredientsAndMeasurementsText(detail: detail)
        recipeIngredientsLabel.attributedText = ingredientsText
        recipeInstructionsLabel.text = "\(detail.strInstructions)\n"
        if detail.strTags != nil {
            recipeTagsLabel.text = "Tags:  " + String(describing: detail.strTags ?? "")
        } else {
            recipeTagsLabel.text = "Tags:  nil"
        }
    }
    
    private func configureIngredientsAndMeasurementsText(detail: Recipe) -> NSMutableAttributedString {
        let ingredientsAttributedString = NSMutableAttributedString(string: "")
        let boldAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
        let normalAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)]
        var isOdd: Bool = true

        let allIngredientsAndMeasurementsArray = [detail.strIngredient1, detail.strMeasure1, detail.strIngredient2, detail.strMeasure2, detail.strIngredient3, detail.strMeasure3, detail.strIngredient4, detail.strMeasure4, detail.strIngredient5, detail.strMeasure5, detail.strIngredient6, detail.strMeasure6, detail.strIngredient7, detail.strMeasure7, detail.strIngredient8, detail.strMeasure8, detail.strIngredient9, detail.strMeasure9, detail.strIngredient10, detail.strMeasure10, detail.strIngredient11, detail.strMeasure11, detail.strIngredient12, detail.strMeasure12, detail.strIngredient13, detail.strMeasure13, detail.strIngredient14, detail.strMeasure14, detail.strIngredient15, detail.strMeasure15, detail.strIngredient16, detail.strMeasure16, detail.strIngredient17, detail.strMeasure17, detail.strIngredient18, detail.strMeasure18, detail.strIngredient19, detail.strMeasure19, detail.strIngredient20, detail.strMeasure20]
        
        for ingredient in allIngredientsAndMeasurementsArray {
            if ingredient != nil {
                if ingredient != "" && ingredient != " " {
                    if isOdd {
                        let boldIngredient = NSMutableAttributedString(string: "\(String(describing: ingredient!)) ", attributes: boldAttributes)
                        ingredientsAttributedString.append(boldIngredient)
                        isOdd = false
                    } else {
                        let measurement = NSMutableAttributedString(string: "- \(ingredient!)\n", attributes: normalAttributes)
                        ingredientsAttributedString.append(measurement)
                        isOdd = true
                    }
                }
            }
        }
        return ingredientsAttributedString
    }
    
//    @IBAction func toggleFavorite(_ sender: Any) {
//            guard let product = product else { return }
//
//            // Toggle the favorite status
//            product.isFavorite = !product.isFavorite
//
//            // Update the button image
//            let buttonImage = product.isFavorite ? UIImage(named: "favorite_on") : UIImage(named: "favorite_off")
//            favoriteButton.setImage(buttonImage, for: .normal)
//
//            // Save changes to CoreData
//            do {
//                try CoreDataStack.shared.context.save()
//            } catch {
//                print("Error saving context: \(error)")
//            }
//        }
}
