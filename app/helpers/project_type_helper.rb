module ProjectTypeHelper
  def load_enum_select_options(keys)
    keys.map { |key| [t("enums.project_type.load.#{key}"), key] }
  end
end