require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be a User" do
    expect(subject).to be_a_kind_of(User)
  end

  describe "attributes" do
    it "should respond to #first_name" do
      expect(subject).to respond_to :first_name
    end

    it "should respond to #last_name" do
      expect(subject).to respond_to :last_name
    end

    it "should respond to #skill_level" do
      expect(subject).to respond_to :skill_level
    end

    it { is_expected.to respond_to :first_name }
    it { is_expected.to respond_to :last_name }
    it { is_expected.to respond_to :skill_level }
  end

  describe "validations" do
    describe "#skill_level" do
      context "when User is first created" do
        it "should have a default value of 1" do
          user = User.new
          expect(user.skill_level).to eq 1
        end
      end

      it "should not be valid for skill level 0" do
        user = User.new
        user.skill_level = 0
        expect(user).not_to be_valid
      end

      it "should be valid for range 1 to 5" do
        user = User.new
        user.skill_level = 5
        expect(user).to be_valid
      end

      it "should be number" do
        user = User.new
        user.skill_level = 'xyz'
        expect(user).not_to be_valid
      end
    end
  end
end
