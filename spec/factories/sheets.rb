# coding: utf-8
FactoryGirl.define do
  factory :sheet do
    pol 'test'
    pod 'test'
    rate_wm 1
    rate_min 1
    tt 1
  end

  factory :invalid_sheet, parent: :sheet do
    pol nil
    pod nil
    rate_wm nil
    rate_min nil
    tt nil
  end
end