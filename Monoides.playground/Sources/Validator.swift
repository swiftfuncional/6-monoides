public typealias Validator<T, E> = (T) -> Result<T, E>

public func &&<T, E>(
	_ firstValidator: @escaping Validator<T, E>,
	_ secondValidator: @escaping Validator<T, E>) -> Validator<T, E> {

	return { t in
		let result = firstValidator(t)

		switch result {
		case let .Failure(reason):
			return .Failure(reason)
		case let .Success(t1):
			return secondValidator(t1)
		}
	}
}

public func validate<T, E>(_ reason: E, _ condition: @escaping (T) -> Bool) -> Validator<T, E> {
	return { condition($0) ? .Success($0) : .Failure(reason) }
}
