module ApplicationHelper
  def profile_picture(account, width = 100, height = 100)
    prof_pic = account.image.present? ? account.image.thumb.url : "placeholder.jpg"
    image_tag prof_pic, width: width, height: height,class: "profile-pic img-circle"
  end
end
