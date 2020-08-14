FactoryBot.define do
  factory :user do
    nickname                  {"フリマ四郎"}
    email                     {"furima@co.jp"}
    password                  {"password4"}
    password_confirmation     {password}
    family_name_full_width	  {"フリマ"}
    first_name_full_width	    {"四郎"}
    family_name_kana_input	  {"フリマ"}
    first_name_kana_input	    {"シロウ"}
    birthday	                {"2000-01-01"}
  end
end