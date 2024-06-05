//
//  DailyBoxOfficeTableViewCell.swift
//  BoxOffice
//
//  Created by 조규연 on 6/5/24.
//

import UIKit
import SnapKit

class DailyBoxOfficeTableViewCell: UITableViewCell {
    
    let rankLabel = UILabel()
    let movieTitleLabel = UILabel()
    let openDateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    func configureHierachy() {
        contentView.addSubview(rankLabel)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(openDateLabel)
    }
    
    func configureLayout() {
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        
        movieTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
        
        openDateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configureUI() {
        backgroundColor = .black
        rankLabel.backgroundColor = .white
        rankLabel.font = .boldSystemFont(ofSize: 18)
        rankLabel.textAlignment = .center
        rankLabel.textColor = .black
        
        movieTitleLabel.font = .boldSystemFont(ofSize: 18)
        movieTitleLabel.textColor = .white
        
        openDateLabel.textColor = .white
        openDateLabel.font = .systemFont(ofSize: 14)
    }
    
    func configure(data: BoxOffice) {
        rankLabel.text = data.rank
        movieTitleLabel.text = data.movieNm
        openDateLabel.text = data.openDt
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
