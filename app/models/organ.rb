class Organ
  include Mongoid::Document
  include Halloped::AutoFormatLocalizedAttributes
  include Mongoid::Timestamps

  validates :name, :organization, :official, allow_blank: false, presence: true

  belongs_to :organization
  has_many :calls
  has_many :members

  field :name, localize: true
  field :description, localize: true
  field :term_start, type: Date
  field :term_end, type: Date
  field :manager_name, type: String
  field :manager_email, type: String
  field :appointer, type: String
  field :official, type: Boolean

  def unofficial
    not official
  end

  def organization_full_name
    organization.ancestors_and_self.drop(1).map(&:name).join(' - ')
  end

  def add_members_from_applications(position_results)
    return if position_results.nil? or position_results.empty?
    position_results.select{ |id, position|
      [:position_member, :position_deputy].include? position.to_sym
    }.each do | id, position|
      application = PositionApplication.find(id)
      self.members << Member.create(
        user: application.user,
        position: position,
        term_start: application.call.term_start,
        term_end: application.call.term_end
      )
    end
  end

  def resign_member(id)
    return if id.nil?
    members.where(_id: id).update_all(current: false, resigned_date: Time.now.utc)
  end

end

