module ApplicationHelper

  # Sets the page title and outputs title if container is passed in.
  # eg. <%= title('Hello World', :h2) %> will return the following:
  # <h2>Hello World</h2> as well as setting the page title.
  def title(str, container = nil)
    @page_title = str
    content_tag(container, str) if container
  end

  # Outputs the corresponding flash message if any are set
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, html_escape(flash[msg.to_sym]), :class => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end
  def ie?
    m = /MSIE\s+([0-9, \.]+)/.match(request.user_agent)
    unless m.nil?
      !!m[1].to_f
    end
  end
end
