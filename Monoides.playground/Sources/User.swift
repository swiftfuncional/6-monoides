public struct User {
	let name: String
	let password: String

	public init(name: String, password: String) {
		self.name = name
		self.password = password
	}
}

public enum UserError: Error {
	case UsernameOutOfBounds
	case PasswordTooShort
}
