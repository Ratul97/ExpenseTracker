//
//  TransactionStackView.swift
//  ExpenseTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 16/12/25.
//

import UIKit

class TransactionStackView: UIView {

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "$3000"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(imageName: String, title: String, textColor: UIColor) {
        super.init(frame: .zero)
        arrowImageView.image = UIImage(systemName: imageName)
        titleLabel.text = title
        amountLabel.textColor = textColor
        configureStackView()
    }

    private func configureStackView() {
        arrowImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        titleStackView.addArrangedSubview(arrowImageView)
        titleStackView.addArrangedSubview(titleLabel)

        topStackView.addArrangedSubview(titleStackView)
        topStackView.addArrangedSubview(amountLabel)
        
        addSubview(topStackView)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func updateAmount(_ text: String) {
        amountLabel.text = "text"
    }
}
