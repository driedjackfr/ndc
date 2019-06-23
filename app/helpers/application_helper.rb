module ApplicationHelper
  def logged_in?
    current_admin != nil
  end

  def javascript_pack(pack)
    content_for :javascript_pack do
      javascript_pack_tag pack
    end
  end

  def stylesheet_pack(pack)
    content_for :stylesheet_pack do
      stylesheet_pack_tag pack
    end
  end

  def full_pack(pack)
    javascript_pack pack
    stylesheet_pack pack
  end
end
