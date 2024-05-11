//
//  ErrorView.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 11/5/24.
//

import Foundation
import UIKit

class ErrorView: UIView {
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.text
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Constants.Colors.text
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        backgroundColor = .red
        layer.cornerRadius = 10.0
        
        addSubview(messageLabel)
        addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        
        setConstraints()
        setTimer()
    }
    
    private func setTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.dismiss()
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 45),
            
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func dismiss() {
        removeFromSuperview()
    }
}
