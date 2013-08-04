module PostHelper
  class Sanitizer < HTML::WhiteListSanitizer
    self.allowed_tags -= %w(img a)
  end

  def post_img_html(post)
    if post.banner.present? # override
      post.banner
    elsif post.img.present?
      content_tag :img, post.img
    else
      html = post_content_html(post)
      doc = Nokogiri::HTML.fragment(html)
      doc.css('img').first.attribute('src').value
    end
  end

  def post_summary_html(post)
    if post.summary.present?
      content_tag :p, post.summary
    else
      html = Sanitizer.new.sanitize(post_content_html(post))
      # puts html
      doc = Nokogiri::HTML.fragment(html)
      # puts doc
      para = doc.search('p').detect { |p| p.text.present? }
      # puts para
      para.try(:to_html).try(:html_safe)
    end
  end

  def post_content_html(post)
    x = RDiscount.new(render(:inline => post.content)).to_html.html_safe
    # puts x
    x
  end
end