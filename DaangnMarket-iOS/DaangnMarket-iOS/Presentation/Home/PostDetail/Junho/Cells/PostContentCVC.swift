//
//  PostContentCVC.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/18.
//

import UIKit

import SnapKit

final class PostContentCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .gray
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.gray.cgColor
        iv.layer.cornerRadius = 24
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .carrotBlack
        lb.font = .NotoBold(size: 16)
        lb.text = "Usssj"
        lb.numberOfLines = 1
        lb.textAlignment = .center
        return lb
    }()
    
    private let guideLabel: UILabel = {
        let lb = UILabel()
        lb.text = "가격제안불가"
        lb.textColor = .carrotDarkLightGray
        lb.font = .NotoBold(size: 13)
        return lb
    }()
    
    // MARK: - View Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        profileImageView.image = UIImage()
    }
    
    // MARK: Custom Methods
    
    func setData(username: String, userImage: String) {
        nameLabel.text = username
        profileImageView.image = UIImage(named: userImage)
    }
    
    // MARK: UI & Layout
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews(profileImageView, nameLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
    }
}
