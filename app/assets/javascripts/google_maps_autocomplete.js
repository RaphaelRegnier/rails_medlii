$(document).ready(function() {
  var user_location = $('#user_location').get(0);
  var appointment_address = $('#appointment_address').get(0);

  if (user_location) {
    var autocomplete = new google.maps.places.Autocomplete(user_location, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(user_location, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

  if (appointment_address) {
      var autocomplete = new google.maps.places.Autocomplete(appointment_address, { types: ['geocode'] });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
      google.maps.event.addDomListener(appointment_address, 'keydown', function(e) {
        if (e.keyCode == 13) {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
});


function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  $('#user_location').trigger('blur').val(components.address + ", " + components.zip_code + ", " + components.city);
}

function onPlaceChanged() {
  var place2 = this.getPlace();
  var components2 = getAddressComponents(place);

  $('#appointment_address').trigger('blur').val(components2.address + ", " + components2.zip_code + ", " + components2.city);
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    address: street_number == null ? route : (street_number + ' ' + route),
    zip_code: zip_code,
    city: city,
    country_code: country_code
  };
}
