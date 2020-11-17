module PositionsHelper
  def load_enum_select_options(keys)
    keys.map { |key| [t("enums.position.load.#{key}"), key] }
  end
end
