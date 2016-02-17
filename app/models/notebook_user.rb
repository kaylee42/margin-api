class NotebookUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :notebook

  validates_presence_of :notebook_id, :user_id
  validates :user_id, uniqueness: {scope: :notebook_id}
  validates_associated :user, :notebook
end
