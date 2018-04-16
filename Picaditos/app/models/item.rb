require 'carrierwave/orm/activerecord'

class Item < ApplicationRecord
    mount_uploader :picture, PictureUploader
end
