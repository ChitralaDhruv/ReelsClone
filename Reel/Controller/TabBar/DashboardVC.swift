//
//  DashboardVC.swift
//  Reel
//
//  Created by Chitrala Dhruv on 09/01/23.
//

import UIKit

class DashboardVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var data = [VideoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            let model = VideoModel(caption: "Through goes Hamilton", username: "Jenny1892", videoFileName: "video", videoFileFormat: "mp4")
            data.append(model)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = #colorLiteral(red: 0.07505694777, green: 0.1268905699, blue: 0.1643333137, alpha: 1)
        view.addSubview(tableView)
        setUpAutoLayout()
        
        navBarSetup()

    }
    
    //MARK: - TableView
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        table.separatorColor = #colorLiteral(red: 0.2196849585, green: 0.2600505054, blue: 0.3020506501, alpha: 1)
        table.backgroundColor = #colorLiteral(red: 0.07505694777, green: 0.1268905699, blue: 0.1643333137, alpha: 1)
        return table
    }()
    
    @objc private func doNothing(){
        print("Button Pressed")
    }
    
    private func navBarSetup() {
        navigationItem.title = "Features"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.07505694777, green: 0.1268905699, blue: 0.1643333137, alpha: 1)
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "message"), style: .plain, target: self, action: #selector(doNothing))
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        let model = data[indexPath.row]
        cell.configure(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.width * (9/16)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = ViewController()
        VC.updateNumber(indexPath.row)
        present(VC, animated: true)
    }
    
    //MARK: - AutoLayout
    
    private func setUpAutoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}
