module HtmlHelper
  def link_to_with_icon(icon, name, options = {}, html_options = {})
    link_to(name, options, html_options.merge(class: "#{html_options[:class]} fa fa-#{icon}"))
  end

  def container(**options, &block)
    content_tag(:div, class: "max-w-7xl mx-auto px-6 md:px-12 xl:px-6 #{options[:class]}") do
      capture(&block)
    end
  end
end
