//  ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @State private var lastNameFilter: String = "A"
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         Text("Filtered by \(lastNameFilter)")
            .fontWeight(.semibold)
         FilteredList(filter: lastNameFilter,
                      predicate: Predicate.beginsWith)
         Group {
            Button("Create Singers") {
               let taylor: Singer = Singer(context: self.moc)
               taylor.firstName = "Taylor"
               taylor.lastName = "Swift"
               
               let ed: Singer = Singer(context: self.moc)
               ed.firstName = "Ed"
               ed.lastName = "Sheeran"
               
               let adele: Singer = Singer(context: self.moc)
               adele.firstName = "Adele"
               adele.lastName = "Adkins"
               
               if self.moc.hasChanges {
                  try? self.moc.save()
               }
            }
            .padding()
            Button("Filter A") {
               self.lastNameFilter = "A"
            }
            .padding()
            Button("Filter S") {
               self.lastNameFilter = "S"
            }
            .padding()
         }
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
