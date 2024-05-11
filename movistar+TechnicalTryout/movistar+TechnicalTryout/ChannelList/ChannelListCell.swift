//
//  ChannelListCell.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 10/5/24.
//

import Foundation
import UIKit
import Kingfisher

class ChannelListCell: UITableViewCell {
    
    static let identifier = "ChannelListCell"

    var channelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    var channelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = Constants.Colors.text
        return label
    }()

    var programNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Constants.Colors.text
        return label
    }()

    var progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Constants.Colors.text
        return label
    }()
    
    var viewModel: ChannelListCellViewModel? {
        didSet{
            DispatchQueue.main.async {
                self.setCellProperties(self.viewModel)
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(channelImageView)
        contentView.addSubview(channelNameLabel)
        contentView.addSubview(programNameLabel)
        contentView.addSubview(progressBar)
        contentView.addSubview(timeLabel)
        
        contentView.backgroundColor = Constants.Colors.cell.withAlphaComponent(0.5)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) no está implementado")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            channelImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            channelImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            channelImageView.widthAnchor.constraint(equalToConstant: 100),
            channelImageView.heightAnchor.constraint(equalToConstant: 75),
            
            channelNameLabel.leadingAnchor.constraint(equalTo: channelImageView.trailingAnchor, constant: 10),
            channelNameLabel.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),

            programNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            programNameLabel.leadingAnchor.constraint(equalTo: channelImageView.trailingAnchor, constant: 10),
            programNameLabel.topAnchor.constraint(equalTo: channelNameLabel.bottomAnchor, constant: 10),
            
            progressBar.leadingAnchor.constraint(equalTo: channelImageView.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: channelImageView.trailingAnchor),
            progressBar.topAnchor.constraint(equalTo: channelImageView.bottomAnchor),
            
            timeLabel.leadingAnchor.constraint(equalTo: channelNameLabel.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: programNameLabel.bottomAnchor, constant: 10)
        ])
    }
    
    private func setCellProperties(_ viewModel: ChannelListCellViewModel?) {
        channelImageView.kf.setImage(with: URL(string: viewModel?.channel.logo ?? "")) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success: return
            case .failure: channelImageView.image = UIImage(named: "Default")
            }
        }
        channelNameLabel.text = viewModel?.channel.name
        programNameLabel.text = viewModel?.channel.liveProgram.title
        
        guard let startTime = viewModel?.channel.liveProgram.startTime,
              let endTime = viewModel?.channel.liveProgram.endTime,
              let currentTime = viewModel?.currentTime
        else {
            progressBar.isHidden = true
            return
        }
        setUpProgressBar(startTime: Double(startTime) ?? 0, endTime: Double(endTime) ?? 0, currentTime: currentTime)
        timeLabel.text = InfoHelper.shared.setUpTimeLabel(startTime: Double(startTime) ?? 0, endTime: Double(endTime) ?? 0)
    }
    
    private func setUpProgressBar(startTime: Double, endTime: Double, currentTime: Double) {
        let startDate = Date(timeIntervalSince1970: startTime / 1000)
        let endDate = Date(timeIntervalSince1970: endTime / 1000)
        let currentDate = Date(timeIntervalSince1970: currentTime / 1000)
        
        let totalTime = endDate.timeIntervalSince(startDate)
        let elapsedTime = currentDate.timeIntervalSince(startDate)
        
        let progress = Float(elapsedTime / totalTime)
        progressBar.setProgress(progress, animated: true)
    }
    
}
