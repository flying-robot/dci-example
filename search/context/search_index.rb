class SearchIndex
  def search(actor:, index:, query:)
    assign_roles(actor: actor)
    executor.search(index: index, query: query)
  end

  private

  attr_reader :executor

  def assign_roles(actor:)
    @executor = SearchExecutor.new
    case actor.id
    when 1
      @executor.extend(PrivilegedSearcher)
    else
      @executor.extend(UnprivilegedSearcher)
    end
  end
end
