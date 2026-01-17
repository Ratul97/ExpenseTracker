//
//  HomeCardView.swift
//  ExpenseTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 16/12/25.
//

import UIKit

class HomeCardView: UIView {

    private let gradientLayer = CAGradientLayer()

    let incomeStackView = TransactionStackView(
        imageName: "arrow.down.circle.fill",
        title: "Income",
        textColor: .systemGreen
    )

    let expenseStackView = TransactionStackView(
        imageName: "arrow.up.circle.fill",
        title: "Expense",
        textColor: .systemRed
    )

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        label.textAlignment = .left
        label.text = "Total Balance"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let totalAmountLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .extraLargeTitle)
        label.textColor = .label
        label.text = "$300.00"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let transactionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupGradient()
        setupShadow()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        layer.cornerRadius = 16
        clipsToBounds = true

        addSubview(titleLabel)
        addSubview(totalAmountLabel)

        transactionStackView.addArrangedSubview(incomeStackView)
        transactionStackView.addArrangedSubview(expenseStackView)

        addSubview(transactionStackView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            totalAmountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            totalAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            totalAmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            transactionStackView.topAnchor.constraint(equalTo: totalAmountLabel.bottomAnchor, constant: 24),
            transactionStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            transactionStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            transactionStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    private func setupGradient() {
        gradientLayer.colors = [
            UIColor.white.cgColor,
            UIColor.systemGray6.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowRadius = 12
        layer.masksToBounds = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
    }
}
