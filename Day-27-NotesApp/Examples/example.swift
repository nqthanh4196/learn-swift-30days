// Day 27 - Extra: Core Data fetch request pattern
import CoreData

// In real Core Data app:
// @FetchRequest(sortDescriptors: [SortDescriptor(\.createdAt, order: .reverse)])
// var notes: FetchedResults<NoteEntity>

// NSPredicate examples:
// NSPredicate(format: "title CONTAINS[cd] %@", searchText)
// NSPredicate(format: "isPinned == true")
// NSPredicate(format: "createdAt > %@", oneWeekAgo as NSDate)

// Batch operations:
// let batchDelete = NSBatchDeleteRequest(fetchRequest: fetchRequest)
// try context.execute(batchDelete)
print("Core Data patterns - see comments for real implementation")
