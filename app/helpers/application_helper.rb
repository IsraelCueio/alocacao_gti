module ApplicationHelper
  def human_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end

  def show_if_manager_position(positions)
    positions.each do | position |
       if position.manager
        return "- #{position.name}"
       end
    end
    return ''
  end
end
