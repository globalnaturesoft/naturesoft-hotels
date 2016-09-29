Naturesoft::Option.class_eval do
  @hotels = {
    "items_per_page" => 10,
    "event_thumbnails" => {
      "0" => {
        "code" => "big",
        "width" => "500",
        "height" => "500",
        "scale" => "fit"
      },
      "1" => {
        "code" => "medium",
        "width" => "200",
        "height" => "200",
        "scale" => "fit"
      }
    }
  }
end