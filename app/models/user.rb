class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :secret_key

  # Setup accessible (or protected) attributes for your model
  #, :as => :admin
  attr_accessible :role_ids
  attr_accessible :user_id,:name, :email, :password, :password_confirmation, :remember_me,:sms_alerts,:phone_number,:work_hours_start,:work_hours_finish,:timezone,:secret_key,:did_accept_eula

  attr_accessible :organization_id, :ppv

  attr_accessible :email_alerts

  has_many :user_survey_responces

  has_many :activities

  has_many :tasks

  has_many :message_action_users

  has_many :message_actions, :through => :message_action_users

  has_many :user_achievements
  has_many :achievements, :through => :user_achievements

  has_many :new_achievements, :through => :user_achievements,
    :class_name => "Achievement",
    :source => :achievement,
    :conditions => ['user_achievements.is_new = true']

  has_many :user_phases
  has_many :phases, :through => :user_phases

  has_many :user_studies
  has_many :studies, :through => :user_studies
  belongs_to :organization

  after_create :setup_study

  validates :name, :presence => {:message => "Please enter a valid user name"}
  validates :did_accept_eula, :presence => {:message => "Please agree to the consent form"}
  #validates :secret_key, :presence => {:message => "Enter a valid study Id key"},:if => "created_at.nil? == false"
  validates :organization, :presence => {:message => "Enter a valid organization and study key"}

  protected
  def confirmation_required?
    false
  end
  # :find study with secret
  # :create user_study
  # :associate study and user_study and user
  # :setup user_study
  # :find first phase
  # :create user phase and associate
  # :setup user_phase


  def setup_study

    self.ppv = 0;

    study = Study.find_by_name('RiseAtWork')
    phase = Phase.find_by_name('Baseline')
    phase1 = Phase.find_by_name('Phase 1')
    phase2 = Phase.find_by_name('Phase 2')
    phase3 = Phase.find_by_name('Phase 3')
    phase4 = Phase.find_by_name('Phase 4')
    phase5 = Phase.find_by_name('Phase 5')
    status = Status.find_by_name('NOTSTARTED')


    userphase = self.user_phases.create()
    userphase.phase = phase

    status.user_phases << userphase
    userphase.phase_baseline = 0
    userphase.save

    userstudy = self.user_studies.create()
    userstudy.user_phases << userphase
    userstudy.study = study
    userstudy.current_user_phase = userphase.id

    userphase1 = self.user_phases.create()
    userphase1.phase = phase1

    status.user_phases << userphase1
    userphase1.phase_baseline = 0

    userphase2 = self.user_phases.create()
    userphase2.phase = phase2

    status.user_phases << userphase2
    userphase2.phase_baseline = 0


    userphase3 = self.user_phases.create()
    userphase3.phase = phase3

    status.user_phases << userphase3
    userphase3.phase_baseline = nil

    userphase4 = self.user_phases.create()
    userphase4.phase = phase4

    status.user_phases << userphase4
    userphase4.phase_baseline = nil


    userphase5 = self.user_phases.create()
    userphase5.phase = phase5

    status.user_phases << userphase5
    userphase5.phase_baseline = nil


    userphase.previous_user_phase = nil
    userphase.next_user_phase = userphase1.id

    userphase1.previous_user_phase = userphase.id
    userphase1.next_user_phase = userphase2.id

    userphase2.previous_user_phase = userphase1.id
    userphase2.next_user_phase = userphase3.id

    userphase3.previous_user_phase = userphase2.id
    userphase3.next_user_phase = userphase4.id

    userphase4.previous_user_phase = userphase3.id
    userphase4.next_user_phase = userphase5.id

    userphase5.previous_user_phase = userphase4.id
    userphase5.next_user_phase = nil

    userstudy.user_phases << userphase
    userstudy.user_phases << userphase1
    userstudy.user_phases << userphase2
    userstudy.user_phases << userphase3
    userstudy.user_phases << userphase4
    userstudy.user_phases << userphase5

    userphase1.save
    userphase2.save
    userphase3.save
    userphase4.save
    userphase5.save

    userstudy.save

  end

end
