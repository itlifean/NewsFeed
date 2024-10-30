import UIKit

class NewsDetailViewController: UIViewController {
    var article: NewsArticle?
    
    private let hotUpdatesLabel: UILabel = {
        let label = UILabel()
        label.text = "Hot Updates"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let imageView = UIImageView()
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0 // Ensure full content is shown
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        displayData()
        setupBackButton()
    }
    
    private func setupUI() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        [hotUpdatesLabel, titleLabel, dateLabel, imageView, contentLabel, authorLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            hotUpdatesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            hotUpdatesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: hotUpdatesLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            imageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            contentLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            authorLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func displayData() {
        guard let article = article else { return }
        titleLabel.text = article.title
        dateLabel.text = formatDate(article.publishedAt)
        contentLabel.text = article.content ?? "No content available" // Display full content
        imageView.image = UIImage(named: "picture")
        if let author = article.author {
            authorLabel.text = "Published by \(author)"
        } else {
            authorLabel.text = "Published by Unknown"
        }
    }
    
    private func setupBackButton() {
        navigationItem.title = ""
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func formatDate(_ dateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: dateString) {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .none
            formatter.locale = Locale(identifier: "en_US")
            return formatter.string(from: date)
        }
        return dateString 
    }
}
