module ChatRoomsHelper
  def chatable_path(chatable)
    case chatable
    when Blog
      blog_path(chatable)
    when Information
      information_path(chatable)
    else
      root_path
    end
  end
end
