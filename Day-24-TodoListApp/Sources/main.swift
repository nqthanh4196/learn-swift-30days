// ============================================
// Day 24 - TodoListApp
// Topic: Lists & Navigation
// ============================================
import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
    var priority: Priority
    
    enum Priority: String, CaseIterable {
        case low = "🟢"
        case medium = "🟡"
        case high = "🔴"
    }
}

struct TodoListApp: View {
    @State private var todos: [Todo] = [
        Todo(title: "Learn SwiftUI", priority: .high),
        Todo(title: "Build Todo App", priority: .medium),
        Todo(title: "Read documentation", priority: .low),
    ]
    @State private var newTodoTitle = ""
    @State private var searchText = ""
    
    var filteredTodos: [Todo] {
        if searchText.isEmpty { return todos }
        return todos.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List {
                // Add new todo
                HStack {
                    TextField("New todo...", text: $newTodoTitle)
                    Button("Add") {
                        guard !newTodoTitle.isEmpty else { return }
                        todos.append(Todo(title: newTodoTitle, priority: .medium))
                        newTodoTitle = ""
                    }
                    .disabled(newTodoTitle.isEmpty)
                }
                
                // Todo list
                ForEach(filteredTodos) { todo in
                    NavigationLink {
                        TodoDetailView(todo: todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(todo.isCompleted ? .green : .gray)
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                            Spacer()
                            Text(todo.priority.rawValue)
                        }
                    }
                }
                .onDelete { indexSet in todos.remove(atOffsets: indexSet) }
                .onMove { from, to in todos.move(fromOffsets: from, toOffset: to) }
            }
            .navigationTitle("📝 Todos (\(todos.filter { !$0.isCompleted }.count))")
            .searchable(text: $searchText, prompt: "Search todos")
            .toolbar { EditButton() }
        }
    }
}

struct TodoDetailView: View {
    let todo: Todo
    var body: some View {
        VStack(spacing: 20) {
            Text(todo.priority.rawValue).font(.system(size: 60))
            Text(todo.title).font(.title)
            Text(todo.isCompleted ? "✅ Completed" : "⏳ Pending")
        }
        .navigationTitle("Detail")
    }
}

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup { TodoListApp() }
    }
}
