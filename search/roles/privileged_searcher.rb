module PrivilegedSearcher
  def search(index:, query:)
    case query
    when '*'
      return $ELASTICSEARCH[index]
    else
      return $ELASTICSEARCH[index][query]
    end
  end
end
