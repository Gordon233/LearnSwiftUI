import SwiftUI

@main
struct LearnSwiftUIApp: App {
	var body: some Scene {
		WindowGroup {
			TodoListView()
		}
	}
}

struct TodoItem: Identifiable {
	let id = UUID()  // 自动生成唯一ID
	var title: String
	var isCompleted: Bool = false
}

struct TodoListView: View {
	@State private var todos: [TodoItem] = []
	@State private var newTodoText = ""
	
	var body: some View {
		//input field: title
		VStack {
			TextField("添加新任务", text: $newTodoText)
				.textFieldStyle(.roundedBorder)
			
			//Add button
			Button("添加") {
				if !newTodoText.isEmpty {
					todos.append(TodoItem(title: newTodoText))
					newTodoText = ""
				}
			}
			//todo list
			List {
				ForEach(todos) { todo in
					Text(todo.title)
				}
			}
		}
	}
}
