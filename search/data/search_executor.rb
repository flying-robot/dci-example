class SearchExecutor
  def search(index:, query:)
    raise StandardError, 'cannot execute a search without a role'
  end
end
