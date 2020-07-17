//
//  todoItemView.swift
//  TodoListCoreData
//
//  Created by Shivam Rishi on 17/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI

struct todoItemView: View {
    
    var title = ""
    var createdAt = ""
    
    var body: some View {
       HStack
        {
            VStack(alignment: .leading)
                {
                    Text(title)
                        .font(.headline)
                    Text(createdAt)
                        .font(.caption)
            }
        
        }
        
        
    }
}

struct todoItemView_Previews: PreviewProvider {
    static var previews: some View {
        todoItemView(title: "HHI", createdAt: "hih")
    }
}
