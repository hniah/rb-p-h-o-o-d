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
    filter['picture'] = vendor.picture.url(:thumb)
    filter['longitude'] = vendor.longitude
    filter['latitude'] = vendor.latitude
    return filter
  end
end

