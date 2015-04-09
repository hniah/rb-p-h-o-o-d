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
    filter['address'] = vendor.address
    filter['website'] = vendor.website
    filter['description'] = vendor.description
    filter['phone'] = vendor.phone

    if vendor.picture.present?
      filter['picture'] = vendor.picture.url(:thumb)
    else
      filter['picture'] = ENV['ROOT_URL'].to_s+vendor.picture.url(:thumb)
    end

    filter['locations'] = []
    locations = vendor.locations
    if locations.present?
      locations.each do |location|
        tmp = {}
        tmp['id'] = location.id
        tmp['name'] = location.name
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

  def self.format_data_locations(location)
    filter = {}
    filter['location_id'] = location.id
    filter['location_name'] = location.name
    filter['location_address'] = location.address
    vendor = location.vendor
    filter['vendor_id'] = vendor.id
    filter['vendor_email'] = vendor.email
    filter['vendor_name'] = vendor.name
    filter['vendor_phone'] = vendor.phone
    filter['vendor_fax'] = vendor.fax
    filter['vendor_address'] = vendor.address
    filter['vendor_website'] = vendor.website
    filter['vendor_description'] = vendor.description
    filter['vendor_phone'] = vendor.phone
    if vendor.picture.present?
      filter['vendor_picture'] = vendor.picture.url(:thumb)
    else
      filter['vendor_picture'] = ENV['ROOT_URL'].to_s+vendor.picture.url(:thumb)
    end
    return filter
  end
end

