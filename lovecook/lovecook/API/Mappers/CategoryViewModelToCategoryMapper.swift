
import Foundation

struct CategoryViewModelToCategoryMapper {
    func mapToCategory(categoryViewModel : CategoriesViewModel) -> Category {
        let categoryTitle = categoryViewModel.title
        let categoryImageUrl = categoryViewModel.image
        let category = Category(strCategory: categoryTitle, strCategoryThumb: categoryImageUrl)
        return category
    }
}
