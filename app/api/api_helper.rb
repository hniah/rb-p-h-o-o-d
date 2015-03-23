class ApiHelper
  def self.response(error_code=200, message='', data=nil)
    {'error_code'=>error_code,'message'=>message, 'data'=>data}
  end

  def self.filter_vendor(vendor)
    filter = {}
    filter['id'] = vendor.id
    filter['email'] = vendor.email
    filter['name'] = vendor.name
    filter['address'] = vendor.address
    filter['phone'] = vendor.phone
    filter['fax'] = vendor.fax
    filter['description'] = vendor.description
    filter['phone'] = vendor.phone

    if vendor.picture.present?
      filter['picture'] = vendor.picture.url(:thumb)
    else
      filter['picture'] = ''
    end

    filter['longitude'] = vendor.longitude
    filter['latitude'] = vendor.latitude
    return filter
  end

  def self.filter_reward_vendor(data_vendor)
    filter = {}
    filter['id'] = data_vendor.id
    filter['reward_detail'] = data_vendor.reward_detail

    if data_vendor.reward_image.present?
      filter['reward_image'] = data_vendor.reward_image
    else
      filter['reward_image'] = ''
    end
    return filter
  end
end

