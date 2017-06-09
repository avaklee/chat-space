require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid with a message" do
      message = build(:message, image: nil)
      expect(message).to be_valid
    end
  end
end

describe Message do
  describe '#create' do
    it "is valid with an image" do
        message = create(:message, body: nil)
        expect(message).to be_valid
    end
  end
end

describe Message do
  describe '#create' do
    it "is valid with both message/image" do
        message = create(:message)
        expect(message).to be_valid
    end
  end
end

describe Message do
  describe '#create' do
    it "is invalid without neither message nor image" do
        message = create(:message)
        message.image = nil
        message.body = nil
        message.valid?
        expect(message).to_not be_valid
    end
  end
end

describe Message do
  describe '#create' do
    it "is invalid without a group_id" do
        message = create(:message, group_id: nil)
        expect(message).to be_valid
    end
  end
end

describe Message do
  describe '#create' do
    it "is invalid without a user_id" do
        message = create(:message, user_id: nil)
        expect(message).to be_valid
    end
  end
end
