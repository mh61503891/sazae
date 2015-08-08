module ApplicationHelper
  def controller_class_name
    [controller_name, action_name].join(' ')
  end
end
