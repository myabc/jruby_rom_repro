module LibraryApiClient
  #module Relations
    ##
    # ROM::Relation to query books adapter
    #
    class Books < ROM::Relation[:http]
      dataset :books

      ##
      # @param [Integer] id the Book sm_classic_id
      #
      # @api private
      def by_classic_id(id)
        with_path('/find_by_classic_id').with_params(book_classic_id: id.to_s)
      end
    end
  #end
end
