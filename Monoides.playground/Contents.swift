class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) throws -> User {
		//... validation logic
	}
}