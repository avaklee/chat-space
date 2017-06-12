require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid with a message" do
      message = build(:message, image: nil)
      expect(message).to be_valid
    end

    it "is valid with an image" do
      message = create(:message, body: nil)
      expect(message).to be_valid
    end

    it "is valid with both message/image" do
      message = create(:message)
      expect(message).to be_valid
    end

    it "is invalid without neither message nor image" do
      message = build(:message, image: nil, body: nil)
      message.valid?
      expect(message.errors[:image]).to include("を入力してください")
    end

    it "is invalid without a group_id" do
      message = create(:message, group_id: nil)
      expect(message).to be_valid
    end

    it "is invalid without a user_id" do
      message = create(:message, user_id: nil)
      expect(message).to be_valid
    end
  end
end
