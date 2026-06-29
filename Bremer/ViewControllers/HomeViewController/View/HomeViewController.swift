//
//  HomeViewController.swift
//  Bremer
//
//  Created by ihab saad on 02/02/2026.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {

    
    // MARK: - OutLets
    @IBOutlet weak private var tableCollectionView: UICollectionView!
    @IBOutlet weak private var newItemCollectionView: UICollectionView!
    
    @IBOutlet weak private var CardViewNewItem: UIView!
    // MARK: - Properties

    let viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpCollectionView()
        bindViewModel()
        viewModel.fetchAllData()
    }
    
    func setUpUI(){
        CardViewNewItem.layer.cornerRadius = 30
        CardViewNewItem.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        CardViewNewItem.clipsToBounds = true
    }
    
    private func setUpCollectionView(){
        // Table CollectionView
        tableCollectionView.delegate = self
        tableCollectionView.dataSource = self
        tableCollectionView.register(UINib(nibName: String(describing: TablesCollectionViewCell.self),
                     
                                           bundle: nil),
                                     forCellWithReuseIdentifier: String(describing: TablesCollectionViewCell.self))
        // New Item CollectionView
        newItemCollectionView.delegate = self
        newItemCollectionView.dataSource = self
        newItemCollectionView.register(UINib(nibName: String(describing: NewItemCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: NewItemCollectionViewCell.self))
        
        
    }
    private func bindViewModel() {
        
        viewModel.tablesState.subscribe(onNext: { [weak self] state in
            
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch state {
                    
                case .loading:
                    print("ShowLoading")
                case .success:
                    self.tableCollectionView.reloadData()
                case .failure(message: let message):
                    print(message)
                }
            }
        
        }).disposed(by: disposeBag)
        
        viewModel.foodsState.subscribe(onNext: { [weak self] state in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch state {
                    
                case .loading:
                    print("ShowLoading")
                case .success:
                    self.newItemCollectionView.reloadData()
                case .failure(message: let message):
                    print(message)
                }
            }
            
            
        }).disposed(by: disposeBag)
        
       
    }
}


// MARK: - CollectionView Handling
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tableCollectionView {
            return viewModel.tables.count
        } else {
            return viewModel.foods.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == tableCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TablesCollectionViewCell.self), for: indexPath) as! TablesCollectionViewCell
            cell.configure(with: viewModel.tables[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NewItemCollectionViewCell.self), for: indexPath) as! NewItemCollectionViewCell
            cell.configure(item: viewModel.foods[indexPath.item])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let table =  viewModel.tables[indexPath.item]
        let bookingSheetViewController  = BookingSheetViewController()
        bookingSheetViewController.selectedTableNumber = table.tableNumber
        if let sheet = bookingSheetViewController.sheetPresentationController {
            sheet.detents = [.medium()]
                    sheet.prefersGrabberVisible = true
                }
        present(bookingSheetViewController, animated: true)
        
    }
}

// MARK: - FlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == tableCollectionView {

            let numberOfItemsPerRow: CGFloat = 3
            let spacing: CGFloat = 5
            let leftInset: CGFloat = 2
            let rightInset: CGFloat = 2
            
            let totalSpacing =
            leftInset +
            rightInset +
            ((numberOfItemsPerRow - 1) * spacing)

            let width =
            (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow

            return CGSize(width: width, height: width)
            
        } else {

            let width = (collectionView.bounds.width - 40) / 3
            
            return CGSize(width: width, height: width * 1.4)
        }
    }
  
}
