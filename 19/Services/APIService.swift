import Foundation

class APIService {
    private let apiKey = "a90b23f21e2e4631a83d13edadc69a26"
    private let baseUrl = "https://newsapi.org/v2/top-headlines?country=us&pageSize=10&apiKey="
    
    func fetchNews(page: Int, completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        let urlString = "\(baseUrl)\(apiKey)&page=\(page)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(newsResponse.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct NewsResponse: Codable {
    let articles: [NewsArticle]
}
