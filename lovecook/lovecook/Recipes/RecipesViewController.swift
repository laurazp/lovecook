
import UIKit

class RecipesViewController: UIViewController {

    var viewModel = RecipesViewModel()
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    @IBOutlet weak var recipeAreaLabel: UILabel!
    @IBOutlet weak var recipeInstructionsLabel: UILabel!
    @IBOutlet weak var recipeTagsLabel: UILabel!
    @IBOutlet weak var ingredientsCardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        viewModel.viewDidLoad()
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
        let imageUrl = URL(string: detail.strMealThumb)!
        recipeImageView.load(url: imageUrl)
        recipeTitleLabel.text = detail.strMeal
        recipeCategoryLabel.text = "Category: \(detail.strCategory)"
        recipeAreaLabel.text = "Area: \(detail.strArea)"
        recipeInstructionsLabel.text = detail.strInstructions
        recipeTagsLabel.text = detail.strTags
    }
}
