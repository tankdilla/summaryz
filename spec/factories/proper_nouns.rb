# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proper_noun, :class => 'ProperNouns' do
    term "MyString"
    article_id 1
    count 1
  end
end
