
import UIKit

class RecipesViewController: UIViewController {

    var viewModel = RecipesViewModel()
    var recipeId: String = ""
    
    @IBOutlet weak var recipesStackView: UIStackView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    @IBOutlet weak var recipeAreaLabel: UILabel!
    @IBOutlet weak var recipeInstructionsLabel: UILabel!
    @IBOutlet weak var recipeTagsLabel: UILabel!
    @IBOutlet weak var ingredientsCardView: UIView!
    @IBOutlet weak var instructionsCardView: UIView!
    @IBOutlet weak var measurementsLabel: UILabel!
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    @IBOutlet weak var detailsStackView: UIStackView!
    @IBOutlet weak var recipesScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Vamos a llamar a viewModel viewDidLoad")
        viewModel.viewDidLoad()
        setupViews()
        
        let contentRect: CGRect = recipesScrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        recipesScrollView.contentSize = contentRect.size
        
    }
    
    private func setupViews() {
        detailsStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        detailsStackView.isLayoutMarginsRelativeArrangement = true
        recipesStackView.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        recipesStackView.isLayoutMarginsRelativeArrangement = true
        ingredientsCardView.layer.cornerRadius = 20
        instructionsCardView.layer.cornerRadius = 20
        setupLabelsHeightInsideCardViews()
    }
    
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
        //TODO: Set cardviews height to labels inside height
        //ingredientsHeightConstraint.constant = recipeIngredientsLabel.frame.height
        
        
        print("configuring...")
        let imageUrl = URL(string: detail.strMealThumb)!
        recipeImageView.load(url: imageUrl)
        recipeTitleLabel.text = detail.strMeal
        print("Configuring cell: title = \(detail.strMeal)")
        recipeCategoryLabel.text = "Category: " + String(describing: detail.strCategory)
        recipeAreaLabel.text = "Area: " + String(describing: detail.strArea ?? "")
        measurementsLabel.text = configureMeasurementsText(detail: detail)
        let ingredientsText = configureIngredientsText(detail: detail)
        recipeIngredientsLabel.text = ingredientsText
        recipeInstructionsLabel.text = detail.strInstructions
        if detail.strTags != nil {
            recipeTagsLabel.text = "Tags:  " + String(describing: detail.strTags ?? "")
        } else {
            recipeTagsLabel.text = "Tags:  nil"
        }
    }
    
    private func configureIngredientsText(detail: Recipe) -> String {
        var existingIngredients: String = ""
        let allIngredientsArray = [detail.strIngredient1, detail.strIngredient2, detail.strIngredient3, detail.strIngredient4, detail.strIngredient5, detail.strIngredient6, detail.strIngredient7, detail.strIngredient8, detail.strIngredient9, detail.strIngredient10, detail.strIngredient11, detail.strIngredient12, detail.strIngredient13, detail.strIngredient14, detail.strIngredient15, detail.strIngredient16,detail.strIngredient17, detail.strIngredient18, detail.strIngredient19, detail.strIngredient20]
        
        for ingredient in allIngredientsArray {
            if ingredient != nil {
                if ingredient != "" && ingredient != " " {
                    existingIngredients += "\(ingredient!)\n"
                }
            }
        }
        return existingIngredients
    }
    
    private func configureMeasurementsText(detail: Recipe) -> String {
        var existingMeasurements: String = ""
        let allMeasurementsArray = [detail.strMeasure1, detail.strMeasure2, detail.strMeasure3, detail.strMeasure4, detail.strMeasure5, detail.strMeasure6, detail.strMeasure7, detail.strMeasure8, detail.strMeasure9, detail.strMeasure10, detail.strMeasure11, detail.strMeasure12, detail.strMeasure13, detail.strMeasure14, detail.strMeasure15, detail.strMeasure16,detail.strMeasure17, detail.strMeasure18, detail.strMeasure19, detail.strMeasure20]
        
        for measure in allMeasurementsArray {
            if measure != nil {
                if measure != "" && measure != " " {
                    existingMeasurements += "\(measure!)\n"
                }
            }
        }
        return existingMeasurements
    }
}
