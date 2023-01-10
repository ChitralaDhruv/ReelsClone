//
//  FlowsVC.swift
//  Reel
//
//  Created by Chitrala Dhruv on 09/01/23.
//

import UIKit

struct VideoModel {
    let caption: String
    let username: String
    let videoFileName: String
    let videoFileFormat: String
}


class FlowsVC: UIViewController, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    private var data = [VideoModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            let model = VideoModel(caption: "Through goes Hamilton", username: "Jenny1892", videoFileName: "video", videoFileFormat: "mp4")
            data.append(model)
        }
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(collectionView)
        
        setUpAutoLayout()
       
        
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.register(flowsCell.self, forCellWithReuseIdentifier: "flowsCell")
        
        return collection
    }()
    
    @objc public func didTapOptions(){
        let rootVC = optionsBottomVC()
        if let sheet = rootVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(rootVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flowsCell", for: indexPath) as! flowsCell
        let model = data[indexPath.row]
        
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    private func setUpAutoLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -85).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
}
