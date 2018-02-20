class ExternalDbAccess < ApplicationRecord
	self.abstract_class = true
	establish_connection("development".to_sym)
end
