//
//  MainCollectionView.swift
//  PortfolioApp
//
//  Created by Алексей Щукин on 01.08.2023.
//

import UIKit

class MainCollectionView: UICollectionView {
    
// MARK: - INIT
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
            super.init(frame: frame, collectionViewLayout: layout)
            commonInit()
        }

// MARK: - Required Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

// MARK: - Customize for UICollectionView
    private func commonInit() {
        isScrollEnabled = false
    }

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }

    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
