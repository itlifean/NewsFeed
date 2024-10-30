import Foundation

class NewsViewModel {
    private var apiService = APIService()
    private(set) var newsArticles: [NewsArticle] = []
    private var currentPage = 1
    
    var reloadTableView: (() -> Void)?
    
    func fetchNews() {
        apiService.fetchNews(page: currentPage) { [weak self] result in
            switch result {
            case .success(let articles):
                self?.newsArticles.append(contentsOf: articles)
                self?.currentPage += 1
                self?.reloadTableView?()
            case .failure(let error):
                print("Error fetching news: \(error)")
            }
        }
    }
}
