module ApplicationHelper

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end

  def placeholder w, h = nil
    h ||= w
    image_tag "http://placehold.it/#{w}x#{h}", class: 'placeholder'
  end

  # def tree hash, prefix = nil
  #   html = "<ul class='tree'>"
  #   hash.keys.each do |key|
  #     # css = "style='border-left-color: #{(@course == key ? '#FEF200' : '#ccc')}'"
  #     css = "class='course-link #{'highlight' if @course and @course.highlight?(key.id)}'"
  #     cls = 'something' unless current_user.enrolled_in? key
  #     html += "<li #{css}><strong>#{link_to_unless_current(key,[prefix,key],class: cls)}</strong><span class='subtitle'>#{key.subtitle}</span>"
  #     # <i>#{key.description}</i>
  #     html += "#{tree(hash[key],prefix)}</li>"
  #   end
  #   html += "</ul>"
  #   return html.html_safe
  # end

  def tree hash, prefix = nil
    html = "<ul class='tree'>"
    hash.keys.each do |key|
      # css = "style='border-left-color: #{(@course == key ? '#FEF200' : '#ccc')}'"
      css = "class='course-link #{'highlight' if @course and @course.highlight?(key.id)}'"
      cls = 'something' unless current_user.enrolled_in? key
      html += "<li #{css}><strong>#{link_to_unless_current(key,[prefix,key],class: cls)}</strong><span class='subtitle'>#{key.subtitle}</span>"
      # <i>#{key.description}</i>
      html += "#{tree(hash[key],prefix)}</li>"
    end
    html += "</ul>"
    return html.html_safe
  end

end
