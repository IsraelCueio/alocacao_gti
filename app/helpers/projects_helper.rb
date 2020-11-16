module ProjectsHelper
  def complexity_enum_select_options(keys)
    keys.map { |key| [t("enums.project.complexity.#{key}"), key] }
  end
  
  def state_enum_select_options(keys)
    keys.map { |key| [t("enums.project.state.#{key}"), key] }
  end
end
