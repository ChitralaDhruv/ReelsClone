//
//  ViewController.swift
//  Reel
//
//  Created by Chitrala Dhruv on 10/01/23.
//

import UIKit

class ViewController: UIViewController {
    var number: Int = 0
    func updateNumber(_ number: Int) {
        self.number = number
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = #colorLiteral(red: 0.07505694777, green: 0.1268905699, blue: 0.1643333137, alpha: 1)
        
        label.text = "This is ViewController \(number)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private let label: UILabel =  {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()

}
