//
//  InteriorTopTableViewCell.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/04.
//

import UIKit

class InteriorTopTableViewCell: UITableViewCell {

    let searchView = UIButton()
    let requestView = UIButton()
    
    let addressView = UIView()
    let address = UILabel()
    let addressImage = UIImageView()
    let changeAddress = UIButton()
    let typeCollectionLayout = UICollectionViewFlowLayout() //collectionviewlayout 잡기위함
    lazy var typeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: typeCollectionLayout)
    let type = ["종합리모델링", "도배", "시트필름", "욕실/타일", "주방", "바닥재", "창호/샷시", "도어/문틀", "페인트", "커텐블라인드", "목공", "전기/조명", "설비"]
    
    static let identifier = "InteriorTopTableViewCell"
    var isClicked = false
    var addActionHandler: ((Int) -> Void)?
    let largeImageView = UIImageView()
    let frequencyBackgroundView = UIView()
    let frequencyLabel = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isSelected: Bool {
        didSet {
            searchView.addTarget(self, action: #selector(searchViewTaped(_:)), for: .touchUpInside)
            requestView.addTarget(self, action: #selector(requestViewTaped(_:)), for: .touchUpInside)
        }
    }
}
extension InteriorTopTableViewCell {
    @objc
    func searchViewTaped(_ sender: UITapGestureRecognizer) {
        self.searchView.backgroundColor = isSelected ? .white : .blue
    }
    @objc
    func requestViewTaped(_ sender: UITapGestureRecognizer) {
        self.requestView.backgroundColor = isSelected ? .blue : .white
    }
}

extension InteriorTopTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return type.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InteriorTypeCollectionViewCell.identifier, for: indexPath) as? InteriorTypeCollectionViewCell else { fatalError() }
        cell.typeImage.backgroundColor = .systemPink
        cell.typeImage.layer.cornerRadius = 50
        cell.typeLable.text = type[indexPath.row]
        return cell
    }
}

extension InteriorTopTableViewCell {
    final private func setUI() {
        setBasic()
        setLayout()
    }
    func setAddressView() {
        [addressView, address, addressImage, changeAddress, typeCollectionView].forEach {
            contentView.addSubview($0)
        }
        addressView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        addressImage.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(addressView).inset(5)
            $0.width.equalTo(20)
        }
        changeAddress.snp.makeConstraints {
            $0.top.trailing.bottom.equalTo(addressView).inset(5)
            $0.width.equalTo(70)
        }
        address.snp.makeConstraints {
            $0.top.bottom.equalTo(addressImage)
            $0.leading.equalTo(addressImage.snp.trailing).offset(5)
            $0.trailing.equalTo(changeAddress.snp.leading).inset(5)
        }
        typeCollectionView.snp.makeConstraints {
            $0.top.equalTo(addressView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        
        addressView.backgroundColor = UIColor.appColor(.mainColor)
        addressImage.image = UIImage(systemName: "mappin.and.ellipse")
        addressImage.backgroundColor = .clear
        changeAddress.setTitle("주소변경", for: .normal)
        changeAddress.setTitleColor(.black, for: .normal)
        changeAddress.backgroundColor = .white
        changeAddress.layer.borderWidth = 2
        changeAddress.layer.borderColor = UIColor.appColor(.lightGray).cgColor
        changeAddress.layer.cornerRadius = 5
//        address.backgroundColor = .black
        
        typeCollectionLayout.scrollDirection = .horizontal
        typeCollectionLayout.minimumInteritemSpacing = 0
        typeCollectionLayout.minimumLineSpacing = 0
        typeCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        typeCollectionLayout.itemSize = CGSize(width: 140, height: 140)

        typeCollectionView.register(InteriorTypeCollectionViewCell.self, forCellWithReuseIdentifier: "InteriorTypeCollectionViewCell")
        typeCollectionView.dataSource = self
        typeCollectionView.backgroundColor = .white
        typeCollectionView.showsHorizontalScrollIndicator = false
    }
    
    final private func setBasic() {
        
        if searchView.backgroundColor == .white {
            requestView.backgroundColor = .blue
        } else if searchView.backgroundColor == .blue {
            requestView.backgroundColor = .white
        }
        searchView.setTitle("업체 찾기", for: .normal)
        searchView.tag = 1
        requestView.setTitle("간편상담신청", for: .normal)
        requestView.tag = 2
    }
    final private func setLayout() {
        [searchView, requestView].forEach {
            contentView.addSubview($0)
        }
        searchView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(contentView.snp.centerX)
        }
        requestView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(contentView.snp.centerX)
        }
    }
    
}


//func setImageView() {
//    contentView.addSubview(largeImageView)
//    largeImageView.snp.makeConstraints {
//        $0.top.leading.trailing.bottom.equalToSuperview().inset(10)
//    }
//    largeImageView.backgroundColor = .red
//}
//func setFrequency() {
//    contentView.addSubview(frequencyBackgroundView)
//    frequencyBackgroundView.snp.makeConstraints {
//        $0.top.leading.trailing.bottom.equalToSuperview().inset(10)
//    }
//    contentView.addSubview(frequencyLabel)
//    frequencyLabel.snp.makeConstraints {
//        $0.leading.top.trailing.equalTo(frequencyBackgroundView).inset(20)
//        $0.height.equalTo(30)
//
//    }
//    frequencyBackgroundView.backgroundColor = .black
//    frequencyLabel.backgroundColor = .white
//}
