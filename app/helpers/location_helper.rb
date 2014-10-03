module LocationHelper

  CORDS = { 'v' => { '-' => 'S', '+' => 'N' }, 'h' => { '-' => 'W', '+' => 'E' } }

  def location_url(location)
    "https://www.google.com/maps/place/" + location_param(location)
  end

  def location_param(location)
    dms(location.latitude, 'v') + "+" + dms(location.longitude, 'h')
  end

  def dms(cord, orientation)
    cord = cord.split(":")
    cord[0] = cord[0].to_i
    cord[1] = cord[1].to_i
    cord[2] = cord[2].gsub(',', '.').to_f

    sign = '+'
    if cord[0] < 0
      sign = '-'
      cord[0] = -cord[0]
    end

    cord = cord[0].to_s + "°" + cord[1].to_s + "'" + cord[2].to_s + '"'
    cord + CORDS[orientation][sign]
  end

end
