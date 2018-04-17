# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  picture    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'carrierwave/orm/activerecord'

class Item < ApplicationRecord
    mount_uploader :picture, PictureUploader
end
