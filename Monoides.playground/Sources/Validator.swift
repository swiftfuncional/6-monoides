public func &&<T, E>(
	_ firstValidator: @escaping (T) -> E?,
	_ secondValidator: @escaping (T) -> E?) -> (T) -> E? {

	return { t in

		if let reason = firstValidator(t) {
			return reason
		}

		if let reason = secondValidator(t) {
			return reason
		}

		return nil
	}
}
