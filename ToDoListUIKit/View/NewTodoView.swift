//
//  NewTodoView.swift
//  ToDoListUIKit
//
//  Created by admin on 21/11/2024.
//

import UIKit

 class NewTodoView: UIView {
    let titleTF = UITextField()
    private let commentLabel = UILabel()
    let descriptionTF = UITextView()
    private let dateLabel = UILabel()
    let datePicer = UIDatePicker()
    init() {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    func setViews() {
        self.backgroundColor = UIColor.color(light: .white, dark: .black)
        titleTF.placeholder = "Задача"
        titleTF.textColor = UIColor.color(light: .black, dark: .white)
        titleTF.backgroundColor = .systemBackground
        titleTF.layer.borderWidth = 1
        titleTF.layer.borderColor = UIColor.placeholderText.cgColor
        titleTF.layer.cornerRadius = 10
        titleTF.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        titleTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleTF.setLeftPaddingPoints(10)
        titleTF.setRightPaddingPoints(10)
        
        commentLabel.text = "Комментарий"
        commentLabel.textColor = .placeholderText
        
        descriptionTF.isEditable = true
        descriptionTF.layer.borderWidth = 1
        descriptionTF.layer.borderColor = UIColor.placeholderText.cgColor
        descriptionTF.layer.cornerRadius = 10
        descriptionTF.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1).isActive = true
        descriptionTF.textColor = UIColor.color(light: .black, dark: .white)
        dateLabel.text = "Дата"
        dateLabel.textColor = .placeholderText
        
        datePicer.preferredDatePickerStyle = .wheels
        datePicer.datePickerMode = .date
        datePicer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        datePicer.minimumDate = .now
        
    }
    
    func setConstraints() {
        let stackView = UIStackView(arrangedSubviews: [
            titleTF,
            commentLabel,
            descriptionTF,
            dateLabel,
            datePicer
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


