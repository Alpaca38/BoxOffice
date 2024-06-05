//
//  ViewController.swift
//  BoxOffice
//
//  Created by 조규연 on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    var list: [BoxOffice] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierachy()
        configureLayout()
        configureUI()
        callRequest()
    }
    
    func configureHierachy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .black
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyBoxOfficeTableViewCell.self, forCellReuseIdentifier: DailyBoxOfficeTableViewCell.identifier)
        tableView.rowHeight = 50
    }
    
    func callRequest() {
        let url = APIURL.kobisURL
        AF.request(url).responseDecodable(of: MovieData.self) { response in
            switch response.result {
            case .success(let value):
                self.list = value.boxOfficeResult.dailyBoxOfficeList
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyBoxOfficeTableViewCell.identifier, for: indexPath) as! DailyBoxOfficeTableViewCell
        let data = list[indexPath.row]
        cell.configure(data: data)
        
        return cell
    }
    
    
}
