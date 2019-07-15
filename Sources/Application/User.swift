import Foundation

struct User: Codable {
    var name: String
    var joker: Int
    var score: Score?
}

struct Score: Codable {
    var date: Date
    var value: Int
}
