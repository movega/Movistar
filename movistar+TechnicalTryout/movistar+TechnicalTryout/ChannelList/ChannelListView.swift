//
//  ChannelListView.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 9/5/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ChannelListView: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChannelListCell.self, forCellReuseIdentifier: ChannelListCell.identifier)
        return tableView
    }()
    
    var viewModel = ChannelListViewModel()
    let disposeBag = DisposeBag()
    var channels: [Channel]?
    var currentTime: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.Strings.ChannelList.title
        
        tableView.delegate = self
        tableView.dataSource = self
        configureUI()
        
        self.viewModel.channelList.asObservable().subscribe(onNext:{
            [weak self] response in
            guard let self, let response else { return }
           DispatchQueue.main.async {
               self.channels = response.channels
               self.currentTime = response.currentTime
               self.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
        
        self.viewModel.getChannelList()
        
    }
    
    private func configureUI() {
        tableView.backgroundColor = Constants.Colors.background
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}

extension ChannelListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let channels else { return 0 }
        return channels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChannelListCell.identifier, for: indexPath) as! ChannelListCell
        if let channel = channels?[indexPath.row], let currentTime  {
            cell.viewModel = ChannelListCellViewModel(channel: channel, currentTime: currentTime)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let channel = channels?[indexPath.row] else { return }
        
        if channel.liveProgram.isAccessible() {
            let channelDetailView = InfoDetailView(viewModel: InfoDetailViewModel(channelName: channel.name, channelLogo: channel.logo))
            Router.shared.navigateToView(viewController: channelDetailView, from: self, animated: true)
        } else {
            Router.shared.showError(message: Constants.Errors.unknownError.rawValue, from: self)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
