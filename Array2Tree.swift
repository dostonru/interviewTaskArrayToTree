//  Array2Tree.swift
//  Created by Doston Rustamov on 19/01/22.
import Foundation

// Time complexity is O(n) where n is number of nodes (in our case Categories)
// I added constuctor for Category class to initialize values which will be
// passed into function makeTree. But instead we can use struct which comes
// with default initalizer(constructor)

class Category {
    
    var id: Int!
    var parentId: Int?
    var childs: [Category]?
    
    init(id: Int, parentId: Int) {
        self.id = id
        self.parentId = parentId
    }
}

func makeTree(list: [Category]) -> [Category] {
    var hashMap = [Int:Int]()
    var tree = [Category]()
    for (i, node) in list.enumerated() {
        // MARK: Mapping all id's into hash map
        hashMap[node.id] = i
        
        // MARK: We can also initialize childs in the main class | Я не стал изменять начальное условие
        node.childs = []
    }
    
    // MARK: ALGORITHM
    for node in list {
        if node.parentId != list[0].parentId {
            guard let parent = hashMap[node.parentId!] else { fatalError() }
            list[parent].childs?.append(node)
        }
        else { tree.append(node) }
    }
    return tree
}

// MARK: Given test case
var list = [
    Category(id: 1, parentId: 0),
    Category(id: 2, parentId: 1),
    Category(id: 3, parentId: 1),
    Category(id: 4, parentId: 2)
]
