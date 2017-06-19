
FactoryGirl.define do
  factory :event do
    name "abdul"
    venue "bommanahalli"
    country "india"
    city "bangalore"
    start_date "2017-12-19 00:00:00"
    end_date "2020-12-20 00:00:00"
    
  end
end


FactoryGirl.define do
  factory :event_new , class: Event do
    name "champions tropy"
    venue "bommanahalli"
    country "india"
    city "bangalore"
    type "Cricket"
    start_date "2017-12-19 00:00:00"
    end_date "2020-12-20 00:00:00"
    
  end
end

FactoryGirl.define do
  factory :user do
    name "balamurugan"
    email "bala@gmail.com"
    password "balamurugan"
    father_name "natarajan"
    mother_name "selvarani"
    profession "software en"
    city "bangalore"
    state "karnataka"
    country "in"
    role "ADMIN"
    phone_no "9842059138"
  end
end
=begin
  FactoryGirl.define do
  factory :bala , class: User do
    name "raj"
    email "raj@kreatio.com"
    password "raj@kreatio.com"
    role "Admin"
  end
end

=end
