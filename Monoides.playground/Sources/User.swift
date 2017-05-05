public struct User {
	public let name: String
	public let password: String

	public init(name: String, password: String) {
		self.name = name
		self.password = password
	}
}

public enum UserError {
	case UsernameOutOfBounds
	case PasswordTooShort
}
