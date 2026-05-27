// ============================================
// Day 27 - NotesApp
// Topic: Core Data Basics
// ============================================
import SwiftUI
import CoreData

// MARK: - Core Data Stack (simplified)
// In a real app, this would be in a .xcdatamodeld file
// Here we show the SwiftUI integration pattern

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var createdAt: Date = Date()
    var isPinned: Bool = false
}

// MARK: - ViewModel (simulating Core Data)
class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = [
        Note(title: "Welcome", content: "This is your first note!", isPinned: true),
        Note(title: "Shopping", content: "Milk, Eggs, Bread"),
        Note(title: "Ideas", content: "Build a weather app"),
    ]
    
    func add(title: String, content: String) {
        let note = Note(title: title, content: content)
        notes.insert(note, at: 0)
    }
    
    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    func togglePin(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].isPinned.toggle()
        }
    }
    
    var sortedNotes: [Note] {
        notes.sorted { ($0.isPinned ? 0 : 1) < ($1.isPinned ? 0 : 1) }
    }
}

// MARK: - Views
struct NotesApp: View {
    @StateObject private var vm = NotesViewModel()
    @State private var showingAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.sortedNotes) { note in
                    NavigationLink {
                        NoteDetailView(note: note)
                    } label: {
                        HStack {
                            if note.isPinned { Image(systemName: "pin.fill").foregroundColor(.orange) }
                            VStack(alignment: .leading) {
                                Text(note.title).font(.headline)
                                Text(note.content).font(.caption).lineLimit(1).foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete(perform: vm.delete)
            }
            .navigationTitle("📝 Notes (\(vm.notes.count))")
            .toolbar {
                Button(action: { showingAdd = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAdd) {
                AddNoteView(vm: vm)
            }
        }
    }
}

struct NoteDetailView: View {
    let note: Note
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(note.title).font(.title).bold()
            Text(note.content).font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle(note.title)
    }
}

struct AddNoteView: View {
    @ObservedObject var vm: NotesViewModel
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextEditor(text: $content).frame(height: 200)
            }
            .navigationTitle("New Note")
            .toolbar {
                Button("Save") {
                    vm.add(title: title, content: content)
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
    }
}

@main
struct NotesAppMain: App {
    var body: some Scene {
        WindowGroup { NotesApp() }
    }
}
