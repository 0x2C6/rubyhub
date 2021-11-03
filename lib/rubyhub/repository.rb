# Repository entity
#
# @since 0.1.0
class RubyHub::Repository < Dry::Struct
  include Dry.Types()

  # Strict types defined for attrs
  attribute :name,  Strict::String
  attribute :owner, Strict::String
  attribute :url,   Strict::String
end
