import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(newsImageView)
        contentView.addSubview(overlayView)
        overlayView.addSubview(titleLabel)
        overlayView.addSubview(authorLabel)
        overlayView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            overlayView.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor),
            overlayView.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -8),
            
            authorLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 8),
            authorLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -8),
            
            dateLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -8),
            dateLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with article: NewsArticle) {
        titleLabel.text = article.title
        authorLabel.text = article.author ?? "Unknown Author"
        dateLabel.text = formatDate(article.publishedAt)
        newsImageView.image = UIImage(named: "picture")
    }
    
    private func formatDate(_ dateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: dateString) {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            formatter.locale = Locale(identifier: "en_US")
            return formatter.string(from: date)
        }
        return dateString 
    }
}
