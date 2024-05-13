//
//  ChannelDetailView.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 9/5/24.
//

import Foundation
import UIKit
import RxSwift

class InfoDetailView: UIViewController {
    
    var programImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var programNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        label.textColor = Constants.Colors.text
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.text = Constants.Strings.DetailView.description
        label.isHidden = true
        label.textColor = Constants.Colors.text
        return label
    }()
    
    var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = Constants.Colors.text
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Strings.DetailView.schedule
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Constants.Colors.text
        return label
    }()
    
    var timeTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Colors.text
        return label
    }()
    
    var channelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Colors.text
        return label
    }()
    
    var channelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let viewModel: InfoDetailViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: InfoDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(programImageView)
        view.addSubview(programNameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextLabel)
        view.addSubview(timeLabel)
        view.addSubview(timeTextLabel)
        view.addSubview(channelImageView)
        view.addSubview(channelNameLabel)
        
        view.backgroundColor = Constants.Colors.background
        
        setConstraints()
        
        self.viewModel.detailInfo.asObservable().subscribe(onNext:{
            [weak self] content in
            guard let self, let content, let program = content.liveProgram else { return }
           DispatchQueue.main.async {
               self.setProperties(program: program, channelName: content.channelName, channelLogo: content.channelLogo)
            }
        }).disposed(by: disposeBag)
        
        self.viewModel.errors.subscribe(
            onNext: { error in
                Router.shared.showError(message: error.localizedDescription, from: self)
            }
        ).disposed(by: disposeBag)
        
        self.viewModel.prepare()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            programImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            programImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            programImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            programImageView.heightAnchor.constraint(equalToConstant: 300),
            
            programNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            programNameLabel.topAnchor.constraint(equalTo: programImageView.bottomAnchor, constant: 15),
            
            channelImageView.topAnchor.constraint(equalTo: programNameLabel.bottomAnchor, constant: 10),
            channelImageView.leadingAnchor.constraint(equalTo: programNameLabel.leadingAnchor),
            channelImageView.heightAnchor.constraint(equalToConstant: 50),
            channelImageView.widthAnchor.constraint(equalToConstant: 50),
            
            channelNameLabel.centerYAnchor.constraint(equalTo: channelImageView.centerYAnchor),
            channelNameLabel.leadingAnchor.constraint(equalTo: channelImageView.trailingAnchor, constant: 10),
            
            timeLabel.leadingAnchor.constraint(equalTo: programNameLabel.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: channelImageView.bottomAnchor, constant: 20),
            
            timeTextLabel.leadingAnchor.constraint(equalTo: programNameLabel.leadingAnchor),
            timeTextLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: programNameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: timeTextLabel.bottomAnchor, constant: 20),
            
            descriptionTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: programNameLabel.leadingAnchor),
            descriptionTextLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10)
        ])
    }
    
    private func setProperties(program: LiveProgram, channelName: String?, channelLogo: String?) {
        programImageView.kf.setImage(with: URL(string: program.cover ?? "")) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success: return
            case .failure: programImageView.image = UIImage(named: "Default")
            }
        }
        channelImageView.kf.setImage(with: URL(string: channelLogo ?? "")) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success: return
            case .failure: channelImageView.image = UIImage(named: "Default")
            }
        }
        channelImageView.layer.borderWidth = 1
        channelImageView.layer.borderColor = UIColor(named: "black")?.cgColor
        channelImageView.layer.cornerRadius = 5
        
        channelNameLabel.text = channelName ?? ""
        programNameLabel.text = program.title
        
        timeLabel.isHidden = program.startTime.isEmpty && program.endTime.isEmpty
        timeTextLabel.text = InfoHelper.shared.setUpTimeLabel(startTime: Double(program.startTime) ?? 0, endTime: Double(program.endTime) ?? 0)
        
        descriptionTextLabel.text = program.description
        descriptionLabel.isHidden = program.description?.isEmpty ?? true
    }
    
}
