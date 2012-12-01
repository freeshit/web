class Item < ActiveRecord::Base
  attr_accessible :claimed, :claimed_at, :claimer_id, :description, :image_url, :lat, :lon, :tracker_count, :user_id
end
