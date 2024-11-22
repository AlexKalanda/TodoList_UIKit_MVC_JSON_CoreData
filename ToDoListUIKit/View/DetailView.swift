//
//  DetailView.swift
//  ToDoListUIKit
//
//  Created by admin on 21/11/2024.
//

import UIKit

final class DetailView: UIView {
    var todo: Todo
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let dateLabel = UILabel()

    init(todo: Todo) {
        self.todo = todo
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    func setViews() {
        self.backgroundColor = UIColor.color(light: .white, dark: .black)
        titleLabel.textColor = UIColor.color(light: .black, dark: .white)
        descriptionLabel.textColor = UIColor.color(light: .black, dark: .white)
        dateLabel.textColor = UIColor.color(light: .black, dark: .white)
        dateLabel.alpha = 0.5
        titleLabel.font = .systemFont(ofSize: 34, weight: .bold)
        titleLabel.text = todo.todo
        titleLabel.numberOfLines = 0
        dateLabel.text = DateHelper.toString(date: todo.date ?? .init())
        dateLabel.font = .systemFont(ofSize: 12, weight: .light)
        descriptionLabel.text = todo.desc
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        descriptionLabel.numberOfLines = 0
    }
    
    func setConstraints() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, dateLabel, descriptionLabel, UIView()])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor,constant: -12),
            stackView.leftAnchor.constraint(equalTo: leftAnchor,constant: 12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
