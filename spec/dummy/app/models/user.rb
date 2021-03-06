class User < ActiveRecord::Base
  devise :database_authenticatable, #:registerable,
    :recoverable, :rememberable, :trackable, #, :validatable
    :lockable, :lock_strategy => :none, :unlock_strategy => :none

  include EnjuSeed::EnjuUser
end

Manifestation.include(EnjuSubject::EnjuManifestation)
Manifestation.enju_isdn_isdn_search
ImportRequest.enju_isdn_isdn_search
