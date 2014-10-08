module ApplicationHelper

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end

  def placeholder w, h = nil
    h ||= w
    image_tag "http://placehold.it/#{w}x#{h}", class: 'placeholder'
  end

end
