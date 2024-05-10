//
//  ChannelListView.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 9/5/24.
//

import Foundation
import UIKit

class ChannelListView: UIViewController {
    
    // Creamos la tableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChannelListCell.self, forCellReuseIdentifier: ChannelListCell.identifier)
        return tableView
    }()
    
    var channelList: ChannelListViewModel? = ChannelListViewModel(apiService: ApiService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        configureUI()
        channelList?.getChannelList()
    }
    
    private func configureUI() {
        
        tableView.backgroundColor = .black
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
}

extension ChannelListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelList?.channels?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChannelListCell.identifier, for: indexPath) as! ChannelListCell
        cell.viewModel = ChannelListCellViewModel(channel: channelList?.channels?[indexPath.row] ?? Channel(id: 0, logo: "", name: "", live_program: LiveProgram(id: 0, title: "", end_time: "", start_time: "")), currentTime: channelList?.currentTime ?? 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let channel = channelList?.channels?[indexPath.row] else { return }
        
        if channel.live_program.isAccessible() {
            let channelDetailView = ChannelDetailView()
            navigationController?.pushViewController(channelDetailView, animated: true)
        } else {
            print("canal no accesible")
        }
        
        
    }
}
