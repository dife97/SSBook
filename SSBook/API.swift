// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum Category: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case romance
  case adventure
  case comedy
  case horror
  case technology
  case travel
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ROMANCE": self = .romance
      case "ADVENTURE": self = .adventure
      case "COMEDY": self = .comedy
      case "HORROR": self = .horror
      case "TECHNOLOGY": self = .technology
      case "TRAVEL": self = .travel
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .romance: return "ROMANCE"
      case .adventure: return "ADVENTURE"
      case .comedy: return "COMEDY"
      case .horror: return "HORROR"
      case .technology: return "TECHNOLOGY"
      case .travel: return "TRAVEL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Category, rhs: Category) -> Bool {
    switch (lhs, rhs) {
      case (.romance, .romance): return true
      case (.adventure, .adventure): return true
      case (.comedy, .comedy): return true
      case (.horror, .horror): return true
      case (.technology, .technology): return true
      case (.travel, .travel): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Category] {
    return [
      .romance,
      .adventure,
      .comedy,
      .horror,
      .technology,
      .travel,
    ]
  }
}

public final class FavoriteBooksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FavoriteBooks {
      favoriteBooks {
        __typename
        id
        name
        author {
          __typename
          id
          name
          picture
          booksCount
          isFavorite
          books {
            __typename
            id
          }
        }
        cover
        description
        isFavorite
        category
      }
    }
    """

  public let operationName: String = "FavoriteBooks"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("favoriteBooks", type: .nonNull(.list(.nonNull(.object(FavoriteBook.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(favoriteBooks: [FavoriteBook]) {
      self.init(unsafeResultMap: ["__typename": "Query", "favoriteBooks": favoriteBooks.map { (value: FavoriteBook) -> ResultMap in value.resultMap }])
    }

    public var favoriteBooks: [FavoriteBook] {
      get {
        return (resultMap["favoriteBooks"] as! [ResultMap]).map { (value: ResultMap) -> FavoriteBook in FavoriteBook(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FavoriteBook) -> ResultMap in value.resultMap }, forKey: "favoriteBooks")
      }
    }

    public struct FavoriteBook: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Book"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
          GraphQLField("cover", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("isFavorite", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("category", type: .nonNull(.scalar(Category.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, author: Author, cover: String, description: String, isFavorite: Bool, category: Category) {
        self.init(unsafeResultMap: ["__typename": "Book", "id": id, "name": name, "author": author.resultMap, "cover": cover, "description": description, "isFavorite": isFavorite, "category": category])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var author: Author {
        get {
          return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "author")
        }
      }

      public var cover: String {
        get {
          return resultMap["cover"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cover")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var isFavorite: Bool {
        get {
          return resultMap["isFavorite"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFavorite")
        }
      }

      public var category: Category {
        get {
          return resultMap["category"]! as! Category
        }
        set {
          resultMap.updateValue(newValue, forKey: "category")
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Author"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("picture", type: .nonNull(.scalar(String.self))),
            GraphQLField("booksCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("isFavorite", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("books", type: .nonNull(.list(.nonNull(.object(Book.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, picture: String, booksCount: Int, isFavorite: Bool, books: [Book]) {
          self.init(unsafeResultMap: ["__typename": "Author", "id": id, "name": name, "picture": picture, "booksCount": booksCount, "isFavorite": isFavorite, "books": books.map { (value: Book) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var picture: String {
          get {
            return resultMap["picture"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "picture")
          }
        }

        public var booksCount: Int {
          get {
            return resultMap["booksCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "booksCount")
          }
        }

        public var isFavorite: Bool {
          get {
            return resultMap["isFavorite"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isFavorite")
          }
        }

        public var books: [Book] {
          get {
            return (resultMap["books"] as! [ResultMap]).map { (value: ResultMap) -> Book in Book(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Book) -> ResultMap in value.resultMap }, forKey: "books")
          }
        }

        public struct Book: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Book"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Book", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}
