class ApiHelper
  def self.response(error_code=200, message='', data=nil)
    {'error_code'=>error_code,'message'=>message, 'data'=>data}
  end

  def self.filter_vendor(vendor)
    filter = {}
    filter['id'] = vendor.id
    filter['email'] = vendor.email
    filter['name'] = vendor.name
    filter['phone'] = vendor.phone
    filter['fax'] = vendor.fax
    filter['description'] = vendor.description
    filter['phone'] = vendor.phone

    if vendor.picture.present?
      filter['picture'] = vendor.picture.url(:thumb)
    else
      filter['picture'] = ''
    end

    filter['locations'] = []
    locations = vendor.locations
    if locations.present?
      locations.each do |location|
        tmp = {}
        tmp['address'] = location.address
        tmp['longitude'] = location.longitude
        tmp['latitude'] = location.latitude
        filter['locations'] << tmp
      end
    end

    return filter
  end

  def self.filter_reward_vendor(data_vendor)
    filter = {}
    filter['id'] = data_vendor.id
    filter['reward_detail'] = data_vendor.reward_detail
    return filter
  end
end

