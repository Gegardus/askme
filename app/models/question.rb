class Question < ApplicationRecord
  belongs_to :user
  validates :text, :user, presence: true

  # callbacks of object life cycle
  before_commit :before_commit
  after_commit :after_commit

  before_validation :before_validation
  after_validation :after_validation

  before_create :before_create
  after_create :after_create

  before_save :before_save
  after_save :after_save

  before_update :before_update
  after_update :after_update

  before_destroy :before_destroy
  after_destroy :after_destroy

  private

  # callback methods dynamic generation
  [ "commit", "validation", "create", "save", "update", "destroy" ].each do |action|
    [ "before", "after" ].each do |time|
      define_method("#{time}_#{action}") do
        puts "******> #{time} #{action}"
      end
    end
  end
end
