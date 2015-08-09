module ApplicationHelper
  def controller_class_name
    [controller_name, action_name].join(' ')
  end

  def br(string)
    string = h(string) unless string.html_safe?
    string.gsub(/(\r\n?)|(\n)/, "<br />\r\n").html_safe
  end
end
