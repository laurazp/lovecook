
import UIKit

class RecipesViewController: UIViewController {

    var viewModel = RecipesViewModel()
    var recipeId: String = ""
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    @IBOutlet weak var recipeAreaLabel: UILabel!
    @IBOutlet weak var recipeInstructionsLabel: UILabel!
    @IBOutlet weak var recipeTagsLabel: UILabel!
    @IBOutlet weak var ingredientsCardView: UIView!
    @IBOutlet weak var instructionsCardView: UIView!
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    @IBOutlet weak var ingredientsHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Vamos a llamar a viewModel viewDidLoad")
        viewModel.viewDidLoad()
        setupLabels()
    }
    
    private func setupLabels() {
        recipeCategoryLabel.text = "Category: "
        recipeAreaLabel.text = "Area: "
        recipeImageView.backgroundColor = UIColor.customOrange()
    }
    
    func configureView(with detail: Recipe) {
        configure(with: detail)
    }
    
    private func configure(with detail: Recipe) {
        //TODO: Set cardviews height to labels inside height
        ingredientsHeightConstraint.constant = recipeIngredientsLabel.frame.height
        
        
        print("configuring...")
        let imageUrl = URL(string: detail.strMealThumb)!
        recipeImageView.load(url: imageUrl)
        recipeTitleLabel.text = detail.strMeal
        print("Configuring cell: title = \(detail.strMeal)")
        recipeCategoryLabel.text = "Category: " + String(describing: detail.strCategory)
        recipeAreaLabel.text = "Area: " + String(describing: detail.strArea ?? "")
        let ingredientsText = configureIngredientsText(detail: detail)
        recipeIngredientsLabel.text = ingredientsText
        recipeInstructionsLabel.text = detail.strInstructions
        if detail.strTags != nil {
            recipeTagsLabel.text = "Tags: " + String(describing: detail.strTags ?? "")
        } else {
            recipeTagsLabel.text = ""
        }
    }
    
    private func configureIngredientsText(detail: Recipe) -> String {
        return (detail.strIngredient1 ?? "") + "\n" + (detail.strIngredient2 ?? "") + "\n" + (detail.strIngredient3 ?? "") + "\n" + (detail.strIngredient4 ?? "") + "\n" + (detail.strIngredient5 ?? "") + "\n" + (detail.strIngredient6 ?? "") + "\n" + (detail.strIngredient7 ?? "") + "\n" + (detail.strIngredient8 ?? "") + "\n" + (detail.strIngredient9 ?? "") + "\n" + (detail.strIngredient10 ?? "") + "\n" + (detail.strIngredient11 ?? "") + "\n" + (detail.strIngredient12 ?? "") + "\n" + (detail.strIngredient13 ?? "") + "\n" + (detail.strIngredient14 ?? "") + "\n" + (detail.strIngredient15 ?? "") + "\n" + (detail.strIngredient16 ?? "") + "\n" + (detail.strIngredient17 ?? "") + "\n" + (detail.strIngredient18 ?? "") + "\n" + (detail.strIngredient19 ?? "") + "\n" + (detail.strIngredient20 ?? "")
    }
}
