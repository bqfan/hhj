# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :organization do
    key 'key'
    initialize_with { Organization.first_or_create(key: :key)}      
  end  
  
  factory :helsinki_uni, parent: :organization do
    name  'Helsingin yliopisto'
    key   'helsinki'
    #_id   '4f6b1edf91bc2b33d3010300'
    #initialize_with { Organization.first_or_create(key: :key)}
  end

  factory :spartan_teknillinen_yliopisto, parent: :organization do
    name  'Spartan Teknillinen Yliopisto'
    key   'sty'
    #   #_id   '4f6b1edf91bc2b33d3010000'
    #   initialize_with { Organization.first_or_create(key: :key)}
  end

  factory :luonnontieteellinen_tiedekunta, parent: :spartan_teknillinen_yliopisto do
    name  'Luonnontieteellinen tiedekunta'
    #   #_id   '4f6b1edf91bc2b33d3010100'
    #   parent { FactoryGirl.create(:spartan_teknillinen_yliopisto) }
  end

  factory :kirjasto, parent: :spartan_teknillinen_yliopisto do
    name  'Kirjasto'
    #   #_id   '4f6b1edf91bc2b33d3010200'
    #   parent { FactoryGirl.create(:spartan_teknillinen_yliopisto) }
  end

  factory :kemian_laitos, parent: :luonnontieteellinen_tiedekunta do
    name  'Kemian laitos'
    #   #_id   '4f6b1edf91bc2b33d3010101'
    #   parent { FactoryGirl.create(:luonnontieteellinen_tiedekunta) }
  end

  factory :fysiikan_laitos, parent: :luonnontieteellinen_tiedekunta do
    name  'Fysiikan laitos'
    #   #_id   '4f6b1edf91bc2b33d3010102'
    #   parent { FactoryGirl.create(:luonnontieteellinen_tiedekunta) }
  end

  factory :akhaimenidien_yliopisto, parent: :organization do
    name  'Akhaimenidien Yliopisto'
    key   'ay'
    #   #_id   '5e5c1edf91bc2b3300000000'
  end

  factory :akhaimenidien_kirjasto, parent: :akhaimenidien_yliopisto do
    name  'Akhaimenidien Kirjasto'
    #   #_id   '5e5c1edf91bc2b3302000000'
    #   parent { FactoryGirl.create(:akhaimenidien_yliopisto) }
  end

  #end

end
