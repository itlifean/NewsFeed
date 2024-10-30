import Foundation

struct NewsArticle: Codable {
    let title: String
    let author: String?
    let publishedAt: String
    let urlToImage: String?
    let content: String?
}
