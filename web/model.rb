
class User < ActiveRecord::Base
	has_many :to_dos
end

class ToDo < ActiveRecord::Base
	belongs_to :user
end

