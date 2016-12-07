require 'contracts'
require 'dry-struct'

module LibraryApiClient
  module Models
    class Book < Dry::Struct
      include Contracts::Core

      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :sm_classic_id, Types::Int.optional

      class << self
        Contract Integer => Book
        def by_classic_id(id)
          LibraryApiClient.container.relation(:books).by_classic_id(id).map_with(:books).one
        end
      end
    end
  end
end
