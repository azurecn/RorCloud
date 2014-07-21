class KpFile < ActiveRecord::Base
  attr_accessible :create_time, :file_id, :is_delete, :modify_time, :name, :rev, :sha1, :share_id, :size, :type
end
