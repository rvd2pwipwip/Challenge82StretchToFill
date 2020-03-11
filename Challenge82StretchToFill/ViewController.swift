//
//  ViewController.swift
//  Challenge82StretchToFill
//
//  Created by Herve Desrosiers on 2020-03-11.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum ViewMetrics {
        static let fontSize: CGFloat = 24.0
        static let spacing: CGFloat = 8.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(stackView)
        let margin = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: margin.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: margin.bottomAnchor),
        ])
    }
    
    @objc private func shareAction(_ sender: UIButton) {
        print("share")
    }

    private let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Sun"))
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .orange
        return iv
    }()
    
    private let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(NSLocalizedString("Share", comment: "Share"), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: ViewMetrics.fontSize)
        btn.addTarget(self, action: #selector(shareAction(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageView, button])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = ViewMetrics.spacing
        sv.axis = .vertical
        return sv
    }()

}

