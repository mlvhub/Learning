module Shopengine
  class Item < ActiveRecord::Base
    mount_uploader :image, ItemImageUploader

    belongs_to :category
  end
end
