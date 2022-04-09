module UnprivilegedSearcher
  def search(index:, query:)
    case query
    when '*'
      return $ELASTICSEARCH[index].except('private')
    else
      return $ELASTICSEARCH[index][query] unless query == 'private'
    end
  end
end
