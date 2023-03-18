
import UIKit

class MealsCell: UITableViewCell {

    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var favoritesButton: UIButton!
    var favoriteSelected: Bool = true
    
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
        //TODO:
    }
    
//    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
//        favoriteSelected = !favoriteSelected
//        if favoriteSelected {
//            favoritesButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
//        } else {
//            favoritesButton.setImage(UIImage(named: "heart"), for: .normal)
//        }
//    }
}
