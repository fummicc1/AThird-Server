import Foundation

struct User: Codable {
    var name: String
    var joker: Int
    var score: Score?
    var selectedCardTag: Int?
}

struct Score: Codable {
    var date: Date
    var value: Int
}
