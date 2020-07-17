//
//  ContentView.swift
//  TodoListCoreData
//
//  Created by Shivam Rishi on 17/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TodoItem.getAllTodoItems()) var todoItems:FetchedResults<TodoItem>
    
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView
            {
                List {
                    Section(header: Text("What's New")) {
                        HStack
                            {
                                TextField("New Item", text: self.$newTodoItem)
                                Button(action: {
                                    
                                    let todoItem:TodoItem = TodoItem(context: self.managedObjectContext)
                                    todoItem.title = self.newTodoItem
                                    todoItem.createdAt = Date()
                                    
                                    do {
                                        try self.managedObjectContext.save()
                                    }catch {
                                        print(error)
                                    }
                                    
                                    self.newTodoItem = ""
                                    
                                })
                                {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                        .imageScale(.large)
                                }
                                
                        }
                    }.font(.headline)
                    
                    Section(header: Text("List")) {
                        ForEach(self.todoItems) { todoItem in
                            todoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                            
                        }.onDelete { (indexSet) in
                            let deleteItem = self.todoItems[indexSet.first!]
                            self.managedObjectContext.delete(deleteItem)
                            
                            do {
                                try self.managedObjectContext.save()
                            }catch {
                                print(error)
                            }
                        }
                    }
                    
                    
                    
                    
                    
                }
                .navigationBarTitle("TodoList")
                .navigationBarItems(trailing: EditButton())
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
