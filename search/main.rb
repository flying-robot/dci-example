require_relative 'context/search_index'
require_relative 'data/actor'
require_relative 'data/index'
require_relative 'data/search_executor'
require_relative 'roles/privileged_searcher'
require_relative 'roles/unprivileged_searcher'
require 'pry'

# Step 1. Create an index with fake documents.
$ELASTICSEARCH = Index.new
$ELASTICSEARCH[:global] = {
  'public'  => 'This is a test document that anyone can read.',
  'private' => 'This is a test document that specific people can read.',
}

# Step 2. Create a superuser actor that will perform searches on an index.
actor = Actor.new(id: 1)
ctx   = SearchIndex.new

# Step 3. Execute a privileged search.
puts ">> Privileged Search"
puts ctx.search(actor: actor, index: :global, query: '*')
puts ctx.search(actor: actor, index: :global, query: 'private')
puts

# Step 4. Create a regular actor that will perform searches.
actor = Actor.new(id: 2)

# Step 5. Execute an unprivileged search.
puts ">> Unprivileged Search"
puts ctx.search(actor: actor, index: :global, query: '*')
puts ctx.search(actor: actor, index: :global, query: 'private')
puts

# Step 6. Try to execute a search without a role.
puts ">> Skipping the Context"
executor = SearchExecutor.new
begin
  puts executor.search(index: :global, query: '*')
rescue => e
  puts e
end
puts
