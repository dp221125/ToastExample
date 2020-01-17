//
//  Toast.swift
//  ToastExample
//
//  Created by Seokho on 2020/01/17.
//  Copyright © 2020 Seokho. All rights reserved.
//

import UIKit

extension UIView {
    func makeToast(_ message: String) -> UIView {
        let toast = UIView()
        toast.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        toast.layer.cornerRadius = 10
        toast.layer.borderWidth = 2.0
        toast.layer.borderColor = UIColor.label.cgColor
        
        self.addSubview(toast)
        
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 16.0)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.textColor = .white
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.text = message
        
        toast.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor,
                                                constant: (self.center.y * 0.72)),
            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.widthAnchor,
                                              constant: -48),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -32)
        ])
        
        toast.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toast.widthAnchor.constraint(equalTo: titleLabel.widthAnchor,
                                         constant: 32),
            toast.heightAnchor.constraint(equalTo: titleLabel.heightAnchor,
                                          constant: 24),
            toast.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            toast.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
        
        return toast
    }
    
    func showToast(_ toast: UIView) {
        UIView.animate(withDuration: 0.5, delay: 2.0, options: [.beginFromCurrentState], animations: {
            toast.alpha = 1.0
            self.isUserInteractionEnabled = false
            UIView.animate(withDuration: 2.5) {
                toast.frame.origin.y -= 12
            }
        }) { _ in
            UIView.animate(withDuration: 0.8, delay: 1.6, options: [], animations: {
                toast.alpha = 0
                UIView.animate(withDuration: 0.8, delay: 1.6, options: [], animations: {
                    toast.frame.origin.y += 12
                })
            }) { _ in
                toast.removeFromSuperview()
                self.isUserInteractionEnabled = true
            }
        }
    }
}


