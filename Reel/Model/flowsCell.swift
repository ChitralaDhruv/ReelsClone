//
//  CollectionViewCell.swift
//  Reel
//
//  Created by Chitrala Dhruv on 09/01/23.
//

import UIKit
import AVFoundation

class flowsCell: UICollectionViewCell {
    
    var player: AVPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .black
        
        addSubview(caption)
        addSubview(userProfile)
        addSubview(userName)
        addSubview(stack)
        setUpAutoLayout()
    }
    
    public func configure(with model: VideoModel) {
        
        caption.text = model.caption
        userName.setTitle(model.username, for: .normal)
        
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat) else {
            print("failed")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        
        contentView.layer.addSublayer(playerView)
        
        player?.volume = 0
        player?.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let caption: UILabel =  {
        let caption = UILabel()
        caption.textColor = .white
        caption.numberOfLines = 0
        caption.font = UIFont.systemFont(ofSize: 14)
        
        return caption
    }()
    
    private let userName: UIButton =  {
        let userName = UIButton()
        userName.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return userName
    }()
    
    private let userProfile: UIButton =  {
        let userProfile = UIButton()
        userProfile.setImage(UIImage(named: "profile-photo"), for: .normal)
        
        return userProfile
    }()
    
    private let like: UIButton =  {
        let like = UIButton()
        like.setImage(UIImage(named: "heart"), for: .normal)
        like.tintColor = .white
        
        return like
    }()
    
    private let share: UIButton =  {
        let share = UIButton()
        share.setImage(UIImage(named: "square.and.arrow.up"), for: .normal)
        share.tintColor = .white
        
        return share
    }()
    
    private let save: UIButton =  {
        let save = UIButton()
        save.setImage(UIImage(named: "bookmark"), for: .normal)
        save.tintColor = .white
        
        
        return save
    }()
    
    private let options: UIButton =  {
        let options = UIButton()
        options.setImage(UIImage(named: "ellipsis"), for: .normal)
        options.addTarget(self, action: #selector(FlowsVC.didTapOptions), for: .touchUpInside)
        
        return options
    }()
    
    private lazy var stack: UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [like, share, save, options])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 20
        
        return stack
    }()
    
    //MARK: - AutoLayout
    
    private func setUpAutoLayout() {
        caption.translatesAutoresizingMaskIntoConstraints = false
        caption.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        caption.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        
        userProfile.translatesAutoresizingMaskIntoConstraints = false
        userProfile.bottomAnchor.constraint(equalTo: caption.topAnchor, constant: -12).isActive = true
        userProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.bottomAnchor.constraint(equalTo: caption.topAnchor, constant: -15).isActive = true
        userName.leadingAnchor.constraint(equalTo: userProfile.trailingAnchor, constant: 8).isActive = true
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        stack.widthAnchor.constraint(equalToConstant: 80).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}


