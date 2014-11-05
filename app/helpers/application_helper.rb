module ApplicationHelper

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end

  def placeholder w, h = nil
    h ||= w
    image_tag "http://placehold.it/#{w}x#{h}", class: 'placeholder'
  end

  def tree hash
    html = "<ul>"
    hash.keys.each do |key|
      html += "<li><h5>#{link_to(key,key)}</h5>"
      # <i>#{key.description}</i>
      html += "#{tree(hash[key])}</li>"
    end
    html += "</ul>"
    return html.html_safe
  end

end
