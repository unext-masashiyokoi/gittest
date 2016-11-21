module ApplicationHelper
  def hbr(str)
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end

  def rm_html_tag(str)
    str.sub!(/<[^<>]*>/,"") while /<[^<>]*>/ =~ str
    str
  end

def lazy_image_tag(source, options={})
  options['data-original'] = source
  if options[:class].blank?
    options[:class] = "lazy"
  else
    options[:class] = "lazy #{options[:class]}"
  end

  image_tag('https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Eclipse_2010_Hao_1.JPG/480px-Eclipse_2010_Hao_1.JPG', options)
end

end
