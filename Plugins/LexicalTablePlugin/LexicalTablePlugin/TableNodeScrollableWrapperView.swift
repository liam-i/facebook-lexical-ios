// (c) Meta Platforms, Inc. and affiliates. Confidential and proprietary.

import Lexical
import UIKit

class TableNodeScrollableWrapperView: UIView {

  let scrollView: UIScrollView

  override init(frame: CGRect) {
    scrollView = UIScrollView()
    super.init(frame: frame)
    self.addSubview(scrollView)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  var tableNodeView: TableNodeView? {
    didSet {
      oldValue?.removeFromSuperview()
      if let tableNodeView = tableNodeView {
        scrollView.addSubview(tableNodeView)
      }
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    scrollView.frame = self.bounds

    guard let tableNodeView = tableNodeView else { return }

    let contentWidth = max((minimumCellWidth + lineWidth) * Double(tableNodeView.numColumns) + lineWidth, self.bounds.width)
    scrollView.contentSize = CGSize(width: contentWidth, height: self.bounds.height)
    tableNodeView.frame = CGRect(x: 0, y: 0, width: contentWidth, height: self.bounds.height)
  }
}
