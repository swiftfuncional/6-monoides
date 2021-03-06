public enum Result<S, E> {
	case Success(_: S)
	case Failure(_: E)

	public func map<T>(_ transform: (S) -> T) -> Result<T, E> {
		switch self {
		case let .Failure(reason):
			return .Failure(reason)
		case let .Success(value):
			return .Success(transform(value))
		}
	}
}
