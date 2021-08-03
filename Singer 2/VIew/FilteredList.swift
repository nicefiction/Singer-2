// ListView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct FilteredList: View {
   
   // MARK: - PROPERTIES
   
   var fetchRequest: FetchRequest<Singer>
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var singers: FetchedResults<Singer> {
      
      fetchRequest.wrappedValue
   }
   
   
   var body: some View {
      
      List {
         ForEach(singers,
                 id: \.self) { (singer: Singer) in
            Text("\(singer.wrappedLastName) \(singer.wrappedFirstName)")
         }
      }
   }
   
   
   
   // MARK: - METHODS
   
   init(filter: String,
        predicate: Predicate) {
      
      self.fetchRequest = FetchRequest(entity: Singer.entity(),
                                       sortDescriptors: [NSSortDescriptor(key: "firstName", ascending: false)],
                                       // predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
                                       predicate: NSPredicate(format: "lastName \(predicate) %@", filter))
   }
}





// MARK: PREVIEWS

struct ListView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      FilteredList(filter: "S",
                   predicate: Predicate.beginsWith)
   }
}
