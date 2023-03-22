// (c) Meta Platforms, Inc. and affiliates. Confidential and proprietary.

import Foundation
import Lexical

open class InlineImagePlugin: Plugin {
  public init() {}

  weak var editor: Editor?

  public func setUp(editor: Editor) {
    self.editor = editor

    do {
      try editor.registerNode(nodeType: NodeType.image, constructor: { decoder in try ImageNode(from: decoder) })
    } catch {
      editor.log(.other, .error, "\(error)")
    }
  }

  public func tearDown() {}

  public func createImageNode(url: String, size: CGSize, sourceID: String?) -> ImageNode {
    ImageNode(url: url, size: size, sourceID: sourceID ?? "")
  }

  public func isImageNode(_ node: Node?) -> Bool {
    node is ImageNode
  }
}
