require 'spec_helper'

describe User do
  context "validations" do
    it { should validate_presence_of :name }
  end
end