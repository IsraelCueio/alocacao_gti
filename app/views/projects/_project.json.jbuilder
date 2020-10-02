json.extract! project, :id, :name, :descriptions, :type, :complexity, :internal, :state, :created_at, :updated_at
json.url project_url(project, format: :json)
