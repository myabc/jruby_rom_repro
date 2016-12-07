module LibraryApiClient
  #module Mappers
    class BookMapper < ROM::Mapper
      relation :books
      symbolize_keys true
      model LibraryApiClient::Models::Book

      attribute :id
      attribute :title
      attribute :premium
      attribute :sm_classic_id
    end
  #end
end
