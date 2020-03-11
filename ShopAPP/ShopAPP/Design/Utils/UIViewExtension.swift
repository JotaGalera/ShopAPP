import UIKit

extension UIImageView {
    func getData(from urlString: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
