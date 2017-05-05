class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) -> Result<User, UserError> {
		let user = User(name: name, password: password)

		let validator = UserValidator.Name && UserValidator.Password &&
						(UserValidator.Premium || UserValidator.Newsletter)

		return validator(user).map(db.create)
	}
}

let useCase = AddUserUseCase()

useCase.add(name: "Alex", password: "functional").map {
	print("SUCCESS: User created - \($0)")
}
