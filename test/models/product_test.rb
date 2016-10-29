# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  reference          :string
#  price              :decimal(, )
#  quantity           :integer
#  brand              :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category_id        :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
