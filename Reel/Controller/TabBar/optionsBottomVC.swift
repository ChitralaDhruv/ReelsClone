//
//  optionsBottomVC.swift
//  Reel
//
//  Created by Chitrala Dhruv on 10/01/23.
//

import UIKit

class optionsBottomVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9611292481, green: 0.9810454249, blue: 0.9936019778, alpha: 1)
        view.addSubview(label)
        view.addSubview(notInterested)
        view.addSubview(report)
        
        setUpAutoLayout()
    }
    
    private let notInterested: UIButton =  {
        let notInterested = UIButton()
        //notInterested.setImage(UIImage(named: "eye.slash"), for: .normal)
        notInterested.setTitleColor(.black, for: .normal)
        notInterested.setTitle("  Not Interested", for: .normal)
        let image = UIImage(named: "eye.slash")!
        let newImage = image.resize(withSize: CGSize(width: 24, height: 24), contentMode: .contentAspectFill)
        
        notInterested.setImage(newImage, for: .normal)
        
        return notInterested
    }()
    
    private let report: UIButton =  {
        let report = UIButton()
        //report.setImage(UIImage(named: "exclamationmark.triangle"), for: .normal)
        report.setTitleColor(.red, for: .normal)
        report.setTitle("   Report...", for: .normal)
        let image = UIImage(named: "exclamationmark.triangle")!
        let newImage = image.resize(withSize: CGSize(width: 24, height: 24), contentMode: .contentAspectFill)
        newImage?.withTintColor(.red)
        
        report.setImage(newImage, for: .normal)
        
        return report
    }()
    
    private let label: UILabel =  {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "More Options"
        
        return label
    }()
    
    
    private func setUpAutoLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
       notInterested.translatesAutoresizingMaskIntoConstraints = false
       notInterested.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
       notInterested.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
       //notInterested.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
       notInterested.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        report.translatesAutoresizingMaskIntoConstraints = false
        report.topAnchor.constraint(equalTo: notInterested.bottomAnchor, constant: 10).isActive = true
        report.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12.5).isActive = true
        //report.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        report.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    }
}
