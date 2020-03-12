import Foundation

struct Product {
    let name : String
    let brand : String
    let price : Int
    let currency : String
    let image : String
}
extension Product : Equatable{
    static func == (lhs : Product , rhs : Product) -> Bool{
        return lhs.name == rhs.name &&
                lhs.brand == rhs.brand &&
                lhs.price == rhs.price &&
                lhs.currency == rhs.currency &&
                lhs.image == rhs.image
    }
}
