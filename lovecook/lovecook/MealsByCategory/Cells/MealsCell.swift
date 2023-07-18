
import UIKit

class MealsCell: UITableViewCell {

    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var favoritesButton: UIButton!
    
    var favoritesButtonSelectedAction : (() -> ())?
    var favoritesButtonDeselectedAction : (() -> ())?
    var indexPath: IndexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureFavoritesButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
              contentView.frame = contentView.frame.inset(by: margins)
              contentView.layer.cornerRadius = 10
    }
    
    private func configureFavoritesButton() {
        favoritesButton.setImage(UIImage(systemName: "heart"), for: [])
        favoritesButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.selected)
        favoritesButton.addTarget(self, action: #selector(favoriteButtonTapped), for: UIControl.Event.touchUpInside)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        if favoritesButton.isSelected == true {
            favoritesButton.isSelected = false
            favoritesButtonDeselectedAction?()
          } else {
              favoritesButton.isSelected = true
              favoritesButtonSelectedAction?()
          }
    }
}
