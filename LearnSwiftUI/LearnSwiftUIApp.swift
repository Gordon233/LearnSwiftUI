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
	@State private var editingId: UUID? = nil
	
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
				ForEach(todos.indices, id: \.self) { index in
					HStack {
						if editingId == todos[index].id {
							TextField("编辑任务", text: $todos[index].title)
								.textFieldStyle(.roundedBorder)
								.onSubmit {
									editingId = nil
								}
						} else {
							Text(todos[index].title)
								.strikethrough(todos[index].isCompleted)
						}
						Text(todos[index].isCompleted ? "已完成" : "未完成")
						Button(action: {
							todos[index].isCompleted.toggle()
						}) {
							Image(systemName: todos[index].isCompleted ? "checkmark.circle.fill" : "circle")
						}
						Button(action: {
							todos.remove(at: index)
						}) {
							Image(systemName: "trash")
						}
						Button(action: {
							editingId = todos[index].id
						}) {
							Image(systemName: "pencil")
						}
					}
				}
			}
		}
	}
}
