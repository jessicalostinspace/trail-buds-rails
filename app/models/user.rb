class User < ActiveRecord::Base
	has_many :events, dependent: :destroy
	has_many :messages_sent, through: :sender, dependent: :destroy
	has_many :messages_received, through: :receiver, dependent: :destroy
end
