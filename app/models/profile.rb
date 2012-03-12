# == Schema Information
#
# Table name: profiles
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  first_name :string(255)
#  last_name  :string(255)
#  address    :string(255)
#  postcode   :string(255)
#  country    :string(255)
#  age_group  :string(255)
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Profile < ActiveRecord::Base
end
