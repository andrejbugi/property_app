module PropertiesHelper
  def property_thumbnail(property, width = 300, height = 200)
    img = property.photo.present? ? property.photo.thumb.url : 'placeholder.jpg'
    image_tag img, width: width, height: height, class: 'property-thumb'
  end

  def property_thumbnail_url(property)
    property.photo.present? ? property.photo.thumb.url : 'placeholder.jpg'
  end

  def property_photo_url(property)
    property.photo.present? ? property.photo.url : asset_url('placeholder.jpg')
  end

  def equal_with_current_account?(property)
    property.account_id == current_account.id
  end
end
