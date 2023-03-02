
import UIKit

class MealsCell: UITableViewCell {

    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    var indexPath: IndexPath = IndexPath()
    //weak var delegate: EarthquakeEventCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
