json.array!(@story_components) do |story_component|
  json.extract! story_component, :author_id, :component_type, :body
  json.url story_component_url(story_component, format: :json)
end
